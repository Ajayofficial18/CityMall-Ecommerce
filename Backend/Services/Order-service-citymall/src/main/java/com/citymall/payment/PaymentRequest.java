package com.citymall.payment;

import com.citymall.customer.CustomerResponse;
import com.citymall.orderService.entity.PaymentMethod;

import java.math.BigDecimal;

public record PaymentRequest(
        BigDecimal amount,
        PaymentMethod paymentMethod,
        Long orderId,
        String orderNumber,
        CustomerResponse customer
) {
}
