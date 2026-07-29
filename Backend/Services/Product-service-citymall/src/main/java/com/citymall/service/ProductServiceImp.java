package com.citymall.service;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;
import com.citymall.entity.Category;
import com.citymall.entity.Product;
import com.citymall.exception.BadRequestException;
import com.citymall.exception.ProductPurchaseException;
import com.citymall.exception.ResourceNotFound;
import com.citymall.mapper.ProductMapper;
import com.citymall.repository.CategoryRepository;
import com.citymall.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductServiceImp implements ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final ProductMapper productMapper;


    // Fetch product by id or throw ResourceNotFoundException.
    private Product getProductOrThrow(Integer productId) {

        return productRepository.findById(productId)
                .orElseThrow(() -> {
                    log.warn("Product not found with id={}", productId);
                    return new ResourceNotFound(
                            "Product not found with id: " + productId
                    );
                });
    }

    // Fetch category by id or throw ResourceNotFoundException.
    private Category getCategoryOrThrow(Integer categoryId) {

        return categoryRepository.findById(categoryId)
                .orElseThrow(() -> {
                    log.warn("Category not found with id={}", categoryId);
                    return new ResourceNotFound(
                            "Category not found with id: " + categoryId
                    );
                });
    }

    // Creates a new product after validating that the provided category exists.
    @Override
    @Transactional
    public ProductResponse createProduct(ProductRequest request) {

        log.info("Creating product with name='{}' and categoryId={}",
                request.name(), request.categoryId());

        // Validate category existence
        Category category = getCategoryOrThrow(request.categoryId());
        // Map request to entity
        Product product = productMapper.mapToProduct(request);
        // Assign managed Category entity
        product.setCategory(category);
        // persist order
        Product savedProduct = productRepository.save(product);

        log.info("Product created successfully. ProductId={}", savedProduct.getId());
        return productMapper.mapToProductResponse(savedProduct);
    }

    // Fetch product by id.
    @Override
    @Transactional(readOnly = true)
    public ProductResponse findProductById(Integer id) {

        log.info("Fetching product with id={}", id);

        Product product = getProductOrThrow(id);

        return productMapper.mapToProductResponse(product);
    }

    // Fetch paginated products.
    @Override
    @Transactional(readOnly = true)
    public Page<ProductResponse> findAllProducts(int page, int size) {

        log.info("Fetching products. Page={}, Size={}", page, size);

        Pageable pageable = PageRequest.of(page, size);
        return productRepository.findAll(pageable)
                .map(productMapper::mapToProductResponse);
    }

    // Delete product.
    @Override
    @Transactional
    public void deleteProductById(Integer id) {

        log.info("Deleting product with id={}", id);

        Product product = getProductOrThrow(id);
        productRepository.delete(product);

        log.info("Product deleted successfully. ProductId={}", id);
    }

    // Update existing product.
    @Override
    @Transactional
    public ProductResponse updateProduct(Integer id, ProductRequest request) {

        log.info("Updating product with id={}", id);
        // Validate product existence
        Product existingProduct = getProductOrThrow(id);
        // Validate category existence
        Category category = getCategoryOrThrow(request.categoryId());

        existingProduct.setName(request.name());
        existingProduct.setDescription(request.description());
        existingProduct.setAvailableQuantity(request.availableQuantity());
        existingProduct.setPrice(request.price());
        existingProduct.setCategory(category);

        Product updatedProduct = productRepository.save(existingProduct);
        log.info("Product updated successfully. ProductId={}", updatedProduct.getId());

        return productMapper.mapToProductResponse(updatedProduct);
    }

    // Search product.
    @Override
    @Transactional(readOnly = true)
    public Page<ProductResponse> searchProducts(String keyword, int page, int size) {

        if (keyword == null || keyword.isBlank()) {
            throw new BadRequestException("Keyword cannot be empty");
        }

        log.info("Searching products. Keyword='{}', Page={}, Size={}",
                keyword, page, size);

        Pageable pageable =
                PageRequest.of(page, size, Sort.by("name").ascending());

        Page<Product> products = productRepository.searchProducts(keyword, pageable);
        return products.map(productMapper::mapToProductResponse);
    }

    @Override
    @Transactional(readOnly = true)
    public List<PurchaseResponse> validateProducts(List<PurchaseRequest> requests) {

        log.info("Validating {} product(s)", requests == null ? 0 : requests.size());
        // 1. Validate request
        validatePurchaseRequests(requests);
        // 2. Check duplicate product IDs
        Map<Integer, PurchaseRequest> requestMap = buildRequestMap(requests);
        // 3. Check product existence
        List<Product> products = fetchProducts(requestMap);
        // 4. Check stock availability
        validateStockAvailability(products, requestMap);
        // 5. Return validated product details (without deducting inventory)
        List<PurchaseResponse> responses = new ArrayList<>();
        for (Product product : products) {
            PurchaseRequest request = requestMap.get(product.getId());
            responses.add(
                    productMapper.mapToproductPurchaseResponse(
                            product,
                            request.quantity()
                    )
            );
        }
        log.info("Successfully validated {} product(s)", responses.size());

        return responses;
    }

    @Override
    @Transactional
    public List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> requests) {

        log.info("Purchase request received for {} product(s)",
                requests == null ? 0 : requests.size());

        // 1. Validate request
        validatePurchaseRequests(requests);
        // 2. Check duplicate product IDs
        Map<Integer, PurchaseRequest> requestMap = buildRequestMap(requests);
        // 3. Fetch products with pessimistic lock
        List<Product> products = fetchProductsForUpdate(requestMap);
        // 4. Validate stock availability
        validateStockAvailability(products, requestMap);
        // 5. Deduct inventory
        List<PurchaseResponse> responses = deductInventory(products, requestMap);
        // 6. Persist inventory changes
        productRepository.saveAll(products);

        log.info("Purchase completed successfully for {} product(s)", products.size());
        return responses;
    }

    // Validates that the purchase request is not null or empty.
    private void validatePurchaseRequests(List<PurchaseRequest> requests) {

        if (requests == null || requests.isEmpty()) {
            log.warn("Received empty purchase request");
            throw new ProductPurchaseException("Purchase request cannot be empty");
        }
    }

    // Converts purchase requests into a map keyed by productId.
    // Also prevents duplicate product IDs in a single request.
    private Map<Integer, PurchaseRequest> buildRequestMap(List<PurchaseRequest> requests) {

        return requests.stream()
                .collect(Collectors.toMap(
                        PurchaseRequest::productId,
                        Function.identity(),
                        (existing, duplicate) -> {
                            log.warn("Duplicate product id found: {}",
                                    duplicate.productId());

                            throw new ProductPurchaseException(
                                    "Duplicate product ID found: "
                                            + duplicate.productId()
                            );
                        }
                ));
    }

    // Fetches products using pessimistic locking and validates that every requested product exists.
    private List<Product> fetchProductsForUpdate(Map<Integer, PurchaseRequest> requestMap) {

        List<Integer> productIds = new ArrayList<>(requestMap.keySet());

        List<Product> products =
                productRepository.findAllByIdInForUpdate(productIds);

        Set<Integer> foundIds = products.stream()
                .map(Product::getId)
                .collect(Collectors.toSet());

        List<Integer> missingIds = productIds.stream()
                .filter(id -> !foundIds.contains(id))
                .toList();

        if (!missingIds.isEmpty()) {

            log.warn("Requested products not found: {}", missingIds);

            throw new ProductPurchaseException(
                    "Products not found: " + missingIds
            );
        }

        return products;
    }
    // Ensures every requested product has sufficient inventory.
    private void validateStockAvailability(
            List<Product> products,
            Map<Integer, PurchaseRequest> requestMap
    ) {

        for (Product product : products) {

            PurchaseRequest request =
                    requestMap.get(product.getId());

            if (product.getAvailableQuantity() < request.quantity()) {

                log.warn(
                        "Insufficient stock for productId={}, requested={}, available={}",
                        product.getId(),
                        request.quantity(),
                        product.getAvailableQuantity()
                );

                throw new ProductPurchaseException(
                        "Insufficient stock for product ID: "
                                + product.getId()
                );
            }
        }
    }

    // deducts and manage inventory
    private List<PurchaseResponse> deductInventory(
            List<Product> products,
            Map<Integer, PurchaseRequest> requestMap
    ) {

        List<PurchaseResponse> responses = new ArrayList<>();
        for (Product product : products) {
            PurchaseRequest request = requestMap.get(product.getId());
            product.setAvailableQuantity(
                    product.getAvailableQuantity() - request.quantity()
            );
            responses.add(productMapper.mapToproductPurchaseResponse(
                    product,request.quantity()
            ));
            log.info(
                    "Inventory updated. ProductId={}, RemainingQuantity={}",
                    product.getId(),
                    product.getAvailableQuantity()
            );
        }
        return responses;
    }

    private List<Product> fetchProducts(Map<Integer, PurchaseRequest> requestMap) {

        List<Integer> productIds = new ArrayList<>(requestMap.keySet());

        List<Product> products =
                productRepository.findAllByIdIn(productIds);

        Set<Integer> foundIds = products.stream()
                .map(Product::getId)
                .collect(Collectors.toSet());

        List<Integer> missingIds = productIds.stream()
                .filter(id -> !foundIds.contains(id))
                .toList();

        if (!missingIds.isEmpty()) {
            log.warn("Requested products not found: {}", missingIds);

            throw new ProductPurchaseException(
                    "Products not found: " + missingIds
            );
        }

        return products;
    }
}
