package com.citymall.orderService.controller;

import com.citymall.orderService.dto.OrderRequest;
import com.citymall.orderService.dto.OrderResponse;
import com.citymall.orderService.response.ApiResponse;
import com.citymall.orderService.service.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService service;

    @PostMapping
    public ResponseEntity<ApiResponse<OrderResponse>> createOrder(
            @RequestBody
            @Valid
            OrderRequest request
    ){
        var response = service.createOrder(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(
                ApiResponse.<OrderResponse>builder()
                        .message("order created successfully")
                        .success(true)
                        .statusCode("201")
                        .data(response)
                        .build()
        );
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<OrderResponse>>> findAllOrders(){
        var response = service.findAllOrders();
        return ResponseEntity.ok(
                ApiResponse.<List<OrderResponse>>builder()
                        .message("orders retrieved successfully")
                        .success(true)
                        .statusCode("200")
                        .data(response)
                        .build()
        );
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<OrderResponse>> findById(
            @PathVariable Long id
    ) {
        var response = service.findById(id);
        return ResponseEntity.ok(
                ApiResponse.<OrderResponse>builder()
                        .message("order retrieved successfully")
                        .success(true)
                        .statusCode("200")
                        .data(response)
                        .build()
        );
    }

    @GetMapping("customer/{customerId}")
    public ResponseEntity<ApiResponse<List<OrderResponse>>> getOrdersByCustomer(
            @PathVariable String customerId
    ) {
        var response = service.findByCustomerId(customerId);
        return ResponseEntity.ok(
                ApiResponse.<List<OrderResponse>>builder()
                        .message("Customer orders fetched successfully")
                        .success(true)
                        .statusCode("200")
                        .data(response)
                        .build()
        );
    }
}

