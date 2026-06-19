package com.citymall.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;

public record ProductRequest(

        @NotBlank(message = "Product name is required")
        String name,
        @NotBlank(message = "Product description is required")
        String description,
        @Positive(message = "Available quantity should be positive")
        Integer availableQuantity,
        @Positive(message = "Price should be positive")
        BigDecimal price,
        @NotNull
        @Positive(message = "Category ID must be greater than 0")
        Integer categoryId
) {
}
