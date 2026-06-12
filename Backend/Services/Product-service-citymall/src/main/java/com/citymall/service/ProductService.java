package com.citymall.service;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;

import java.util.List;

public interface ProductService {
    ProductResponse createProduct(ProductRequest request);
    ProductResponse findProductById(Integer id);
    List<ProductResponse> findAllProducts();
    List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> request);
}
