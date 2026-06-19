package com.citymall.service;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ProductService {
    ProductResponse createProduct(ProductRequest request);
    ProductResponse findProductById(Integer id);
    Page<ProductResponse> findAllProducts(int page, int size);
    void deleteProductById(Integer id);
    ProductResponse updateProduct(Integer id, ProductRequest request);
    List<PurchaseResponse> purchaseProducts(List<PurchaseRequest> request);
    Page<ProductResponse> searchProducts(String keyword, int page, int size);
}
