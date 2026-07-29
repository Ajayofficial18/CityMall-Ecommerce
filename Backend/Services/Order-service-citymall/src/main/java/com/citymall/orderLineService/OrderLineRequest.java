package com.citymall.orderLineService;

import java.math.BigDecimal;

public record OrderLineRequest(
        Long orderId,
        Integer productId,
        String productName,
        BigDecimal price,
        Integer quantity
) {
}
