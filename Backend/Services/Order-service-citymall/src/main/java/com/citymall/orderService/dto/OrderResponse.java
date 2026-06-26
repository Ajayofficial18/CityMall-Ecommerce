package com.citymall.orderService.dto;

import com.citymall.orderService.entity.OrderStatus;
import com.citymall.orderService.entity.PaymentMethod;

import java.math.BigDecimal;

public record OrderResponse(
        Long id,
        String orderNumber,
        BigDecimal totalAmount,
        PaymentMethod paymentMethod,
        Long customerId,
        OrderStatus status
) {
}
