package com.citymall.controller;

import com.citymall.dto.ProductRequest;
import com.citymall.dto.ProductResponse;
import com.citymall.dto.PurchaseRequest;
import com.citymall.dto.PurchaseResponse;
import com.citymall.response.ApiResponse;
import com.citymall.response.PageResponse;
import com.citymall.service.ProductService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
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


//    Creating product
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

//    fetching all products
//    @GetMapping
//    public ResponseEntity<ApiResponse<List<ProductResponse>>> getAllProducts(){
//        List<ProductResponse> allProducts = service.findAllProducts();
//        String msg = allProducts.isEmpty() ? "No Products Found" : "Products fetched successfully";
//        return ResponseEntity.ok(
//                ApiResponse.<List<ProductResponse>>builder()
//                        .message(msg)
//                        .success(true)
//                        .data(allProducts)
//                        .build()
//        );
//    }

    @GetMapping
    public ResponseEntity<PageResponse<ProductResponse>> getAllProducts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {

        Page<ProductResponse> response = service.findAllProducts(page, size);

        return ResponseEntity.ok(
                PageResponse.<ProductResponse>builder()
                        .content(response.getContent())
                        .page(response.getNumber())
                        .size(response.getSize())
                        .totalElements(response.getTotalElements())
                        .totalPages(response.getTotalPages())
                        .first(response.isFirst())
                        .last(response.isLast())
                        .build()
        );
    }

//    fetcing product by id
    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ProductResponse>> getById(
            @PathVariable("id") Integer id
    ){
        ProductResponse response = service.findProductById(id);
        return ResponseEntity.ok(
                ApiResponse.<ProductResponse>builder()
                        .message("Products fetched successfully")
                        .success(true)
                        .data(response)
                        .build()
        );
    }

//    deleting product with product id
    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteById(@PathVariable("id") Integer id){
        service.deleteProductById(id);
        return ResponseEntity.ok(
                ApiResponse.<Void>builder()
                        .success(true)
                        .message("Product deleted successfully")
                        .build()
        );
    }

//    update product
    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<ProductResponse>> updateProduct(
            @PathVariable Integer id,
            @Valid @RequestBody ProductRequest request
    ) {
        ProductResponse response = service.updateProduct(id, request);
        return ResponseEntity.ok(
                ApiResponse.<ProductResponse>builder()
                        .success(true)
                        .message("Product updated successfully")
                        .data(response)
                        .build()
        );
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<Page<ProductResponse>>> searchProducts(
            @RequestParam String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {

        Page<ProductResponse> response = service.searchProducts(keyword, page, size);
        return ResponseEntity.ok(
                ApiResponse.<Page<ProductResponse>>builder()
                        .success(true)
                        .message("Search results fetched successfully")
                        .data(response)
                        .build()
        );
    }

//    purchasing product
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

