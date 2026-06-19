package com.citymall.controller;

import com.citymall.dto.CategoryRequest;
import com.citymall.dto.CategoryResponse;
import com.citymall.response.ApiResponse;
import com.citymall.service.CategoryService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/categories")
@RequiredArgsConstructor
@Validated
public class CategoryController {

    private final CategoryService service;

    @PostMapping
    public ResponseEntity<ApiResponse<CategoryResponse>> createCategory(
            @Valid
            @RequestBody
            CategoryRequest request
    ){
        CategoryResponse response = service.createCategory(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(
                ApiResponse.<CategoryResponse>builder()
                        .success(true)
                        .message("Category Created Successfully")
                        .data(response)
                        .build()
        );
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<CategoryResponse>>> getAllCategory(){
        List<CategoryResponse> allCategory = service.findAllCategories();
        String msg = allCategory.isEmpty() ? "No Category Found" : "Category fetched successfully";
        return ResponseEntity.ok(
                ApiResponse.<List<CategoryResponse>>builder()
                        .message(msg)
                        .success(true)
                        .data(allCategory)
                        .build()
        );
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<CategoryResponse>> getById(@PathVariable Integer id){
        CategoryResponse response = service.findCategoryById(id);
        return ResponseEntity.ok(
                ApiResponse.<CategoryResponse>builder()
                        .message("Category fetched successfully")
                        .data(response)
                        .success(true)
                        .build()
        );
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteById(@PathVariable("id") Integer id) {
        service.deleteCategory(id);
        return ResponseEntity.ok(
                ApiResponse.<Void>builder()
                        .success(true)
                        .message("Category deleted successfully")
                        .build()
        );
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<CategoryResponse>> updateCategory(
            @PathVariable Integer id,
            @Valid @RequestBody CategoryRequest request
    ){
        CategoryResponse response = service.updateCategory(id, request);
        return ResponseEntity.ok(
                ApiResponse.<CategoryResponse>builder()
                        .message("Category updated")
                        .success(true)
                        .data(response)
                        .build()
        );
    }
}
