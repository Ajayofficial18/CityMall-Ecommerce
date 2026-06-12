package com.citymall.controller;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;
import com.citymall.response.ApiResponse;
import com.citymall.service.ProductService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/products")
@RequiredArgsConstructor
@Validated
public class ProductController {

    private final ProductService service;

    @PostMapping
    public ResponseEntity<ApiResponse<ProductResponse>> createProduct(
            @Valid
            @RequestBody
            ProductRequest request
    ){
        ProductResponse response = service.createProduct(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(
                ApiResponse.<ProductResponse>builder()
                        .message("Product created successfully")
                        .success(true)
                        .data(response)
                        .build()
        );
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<ProductResponse>>> getAllProducts(){
        List<ProductResponse> allProducts = service.findAllProducts();
        String msg = allProducts.isEmpty() ? "No Products Found" : "Products fetched successfully";
        return ResponseEntity.ok(
                ApiResponse.<List<ProductResponse>>builder()
                        .message(msg)
                        .success(true)
                        .data(allProducts)
                        .build()
        );
    }

    @GetMapping("/{product-id}")
    public ResponseEntity<ApiResponse<ProductResponse>> getById(
            @PathVariable("product-id") Integer id
    ){
        ProductResponse response = service.findProductById(id);
        return ResponseEntity.ok(
                ApiResponse.<ProductResponse>builder()
                        .message("found product with id : "+id)
                        .success(true)
                        .data(response)
                        .build()
        );
    }

    @PostMapping("/purchase")
    public ResponseEntity<ApiResponse<List<PurchaseResponse>>> purchaseProduct(
            @Valid
            @RequestBody
            List<PurchaseRequest> request
    ){
        List<PurchaseResponse> productPurchaseResponses = service.purchaseProducts(request);

        return ResponseEntity.ok(
                ApiResponse.<List<PurchaseResponse>>builder()
                        .message("product purchase list")
                        .success(true)
                        .data(productPurchaseResponses)
                        .build()
        );
    }
}

