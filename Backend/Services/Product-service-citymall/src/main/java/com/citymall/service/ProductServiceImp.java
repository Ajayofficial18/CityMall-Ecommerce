package com.citymall.service;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;
import com.citymall.entity.Product;
import com.citymall.exception.ProductPurchaseException;
import com.citymall.exception.ResourceNotFound;
import com.citymall.mapper.ProductMapper;
import com.citymall.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

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

    @Override
    public List<ProductResponse> findAllProducts() {
        log.info("fetching all products");
        List<Product> productList = repository.findAll();
        return productList.stream()
                .map(mapper::mapToProductResponse)
                .toList();
    }

    @Transactional(rollbackFor = ProductPurchaseException.class)
    @Override
    public List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> request) {
        var productIds = request
                .stream()
                .map(obj-> obj.productId())
                .toList();
        var storedProducts = repository.findAllByIdInOrderById(productIds);
        if (productIds.size() != storedProducts.size()) {
            throw new ProductPurchaseException("One or more products does not exist");
        }
        var sortedRequest = request
                .stream()
                .sorted(Comparator.comparing(PurchaseRequest::productId))
                .toList();
        var purchasedProducts = new ArrayList<PurchaseResponse>();
        for (int i = 0; i < storedProducts.size(); i++) {
            var product = storedProducts.get(i);
            var productRequest = sortedRequest.get(i);
            if (product.getAvailableQuantity() < productRequest.quantity()) {
                throw new ProductPurchaseException("Insufficient stock quantity for product with ID:: " + productRequest.productId());
            }
            var newAvailableQuantity = product.getAvailableQuantity() - productRequest.quantity();
            product.setAvailableQuantity(newAvailableQuantity);
            repository.save(product);
            purchasedProducts.add(mapper.mapToproductPurchaseResponse(product, productRequest.quantity()));
        }
        return purchasedProducts;
    }
}
