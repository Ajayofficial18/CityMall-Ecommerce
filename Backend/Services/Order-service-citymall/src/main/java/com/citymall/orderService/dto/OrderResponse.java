package com.citymall.orderService.dto;

import com.citymall.orderService.entity.OrderStatus;
import com.citymall.orderService.entity.PaymentMethod;

import java.math.BigDecimal;

public record OrderResponse(
        Long id,
        String orderNumber,
        BigDecimal amount,
        PaymentMethod paymentMethod,
        String customerId,
        OrderStatus status
) {
}
