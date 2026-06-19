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

    private final ProductRepository repository;
    private final ProductMapper mapper;
    @Override
    public ProductResponse createProduct(ProductRequest request) {
        Product product = mapper.mapToProduct(request);
        log.info("Created product with details: {}", product);
        return mapper.mapToProductResponse(repository.save(product));
    }

    @Override
    public ProductResponse findProductById(Integer id) {
        var product = repository.findById(id).orElseThrow(()-> new ResourceNotFound("product not found for id:"+id));
        return mapper.mapToProductResponse(product);
    }

//    @Override
//    public List<ProductResponse> findAllProducts() {
//        log.info("fetching all products");
//        List<Product> productList = repository.findAll();
//        return productList.stream()
//                .map(mapper::mapToProductResponse)
//                .toList();
//    }

    @Override
    public Page<ProductResponse> findAllProducts(int page, int size) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Product> products = repository.findAll(pageable);
        log.info("fetching all products with pagination");
        return products.map(mapper::mapToProductResponse);
    }

    @Override
    public void deleteProductById(Integer id) {
        Product product = repository.findById(id).orElseThrow(() -> new ResourceNotFound("Product not found with id: " + id));
        repository.delete(product);
    }

    @Override
    public ProductResponse updateProduct(Integer id, ProductRequest request) {

        Product existingProduct = repository.findById(id).orElseThrow(() -> new ResourceNotFound("Product not found with id: " + id));

        existingProduct.setName(request.name());
        existingProduct.setDescription(request.description());
        existingProduct.setAvailableQuantity(request.availableQuantity());
        existingProduct.setPrice(request.price());
        existingProduct.setCategory(
                Category.builder()
                        .id(request.categoryId())
                        .build()
        );

        Product updatedProduct = repository.save(existingProduct);
        return mapper.mapToProductResponse(updatedProduct);
    }

    @Override
    public Page<ProductResponse> searchProducts(String keyword, int page, int size) {
        if (keyword == null || keyword.isBlank()) {
            throw new BadRequestException("Keyword cannot be empty");
        }
        Pageable pageable = PageRequest.of(page, size, Sort.by("name").ascending());
        Page<Product> products = repository.searchProducts(keyword, pageable);
        return products.map(mapper::mapToProductResponse);
    }


    @Transactional(rollbackFor = ProductPurchaseException.class)
    @Override
    public List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> requests) {
        if (requests == null || requests.isEmpty()) {
            throw new ProductPurchaseException("Purchase request cannot be empty");
        }

        Map<Integer, PurchaseRequest> requestMap =
                requests.stream()
                        .collect(Collectors.toMap(
                                PurchaseRequest::productId,
                                Function.identity(),
                                (existing, duplicate) -> {
                                    throw new ProductPurchaseException(
                                            "Duplicate product ID found: "
                                                    + duplicate.productId()
                                    );
                                }
                        ));

        List<Integer> productIds = new ArrayList<>(requestMap.keySet());
        List<Product> products = repository.findAllByIdInForUpdate(productIds);

        Set<Integer> foundIds = products.stream().map(Product::getId).collect(Collectors.toSet());
        List<Integer> missingIds = productIds.stream().filter(id -> !foundIds.contains(id)).toList();

        if (!missingIds.isEmpty()) {
            throw new ProductPurchaseException(
                    "Products not found: " + missingIds
            );
        }

        List<PurchaseResponse> responses = new ArrayList<>();

        for (Product product : products) {
            PurchaseRequest request = requestMap.get(product.getId());
            Integer requestedQuantity = request.quantity();
            if (product.getAvailableQuantity() < requestedQuantity) {
                throw new ProductPurchaseException(
                        "Insufficient stock for product ID: "
                                + product.getId()
                );
            }

            product.setAvailableQuantity(product.getAvailableQuantity() - requestedQuantity);
            responses.add(mapper.mapToproductPurchaseResponse(product, requestedQuantity));
        }
        repository.saveAll(products);
        return responses;
    }
}
