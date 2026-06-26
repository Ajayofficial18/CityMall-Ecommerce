package com.citymall.orderLineService;

public record OrderLineRequest(
        Integer id,
        Long orderId,
        Integer productId,
        Integer quantity
) {
}
