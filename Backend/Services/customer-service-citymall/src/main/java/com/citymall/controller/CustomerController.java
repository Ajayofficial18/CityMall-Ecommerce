package com.citymall.controller;

import com.citymall.dto.CustomerRequest;
import com.citymall.dto.CustomerResponse;
import com.citymall.response.ApiResponse;
import com.citymall.service.CustomerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/customers")
@RequiredArgsConstructor
@Validated
public class CustomerController {

    private final CustomerService service;

    @PostMapping
    public ResponseEntity<ApiResponse<CustomerResponse>> createCustomer(
            @Valid
            @RequestBody
            CustomerRequest customerRequest){

        CustomerResponse savedCustomer = service.createCustomer(customerRequest);

        return ResponseEntity.status(HttpStatus.CREATED).body(
                ApiResponse.<CustomerResponse>builder()
                        .message("Customer created successfully")
                        .success(true)
                        .statusCode("201")
                        .data(savedCustomer)
                        .build()
        );
    }

    @GetMapping("/{customerId}")
    public ResponseEntity<ApiResponse<CustomerResponse>> getCustomerById(@PathVariable String customerId){
        CustomerResponse customerResponse = service.getCustomerById(customerId);
        return ResponseEntity.ok(
                ApiResponse.<CustomerResponse>builder()
                        .message("Customer fetched successfully with ID :"+customerId)
                        .success(true)
                        .statusCode("200")
                        .data(customerResponse)
                        .build()
        );
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<CustomerResponse>>> getAllCustomers(){

        List<CustomerResponse> customers = service.getAllCustomers();
        String message = customers.isEmpty()
                ? "No customers found"
                : "Customers fetched successfully";

        return ResponseEntity.ok(
                ApiResponse.<List<CustomerResponse>>builder()
                        .message(message)
                        .success(true)
                        .statusCode("200")
                        .data(customers)
                        .build()
        );
    }

    @PutMapping("/{customerId}")
    public ResponseEntity<ApiResponse<CustomerResponse>> updateCustomer(
            @PathVariable
            String customerId,
            @Valid
            @RequestBody
            CustomerRequest request){
        CustomerResponse updatedCustomer = service.updateCustomer(customerId, request);
        return ResponseEntity.ok(
                ApiResponse.<CustomerResponse>builder()
                        .message("Customer updated successfully")
                        .success(true)
                        .data(updatedCustomer)
                        .build()
        );

    }

    @DeleteMapping("/{customerId}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable String customerId){
        service.deleteCustomer(customerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/exists/{customerId}")
    public ResponseEntity<ApiResponse<Boolean>> isCustomerExist(@PathVariable String customerId) {
        boolean exists = service.isCustomerExist(customerId);

        return ResponseEntity.ok(
                ApiResponse.<Boolean>builder()
                        .message(exists ? "Customer exists with ID: " + customerId
                                : "Customer does not exist with ID: " + customerId)
                        .success(true)
                        .statusCode("200")
                        .data(exists)
                        .build()
        );
    }

}
