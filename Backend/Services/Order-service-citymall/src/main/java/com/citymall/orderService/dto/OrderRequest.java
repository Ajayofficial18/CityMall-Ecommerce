package com.citymall.orderService.dto;

import com.citymall.orderService.entity.OrderStatus;
import com.citymall.orderService.entity.PaymentMethod;
import com.citymall.product.PurchaseRequest;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;
import java.util.List;

public record OrderRequest(

        @NotNull(message = "Customer should be present")
        String customerId,

        @NotNull(message = "Payment method should be precised")
        PaymentMethod paymentMethod,

        @NotEmpty(message = "You should at least purchase one product")
        List<PurchaseRequest> products
) {
}
