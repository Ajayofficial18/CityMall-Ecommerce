package com.citymall.orderService.mapper;

import com.citymall.orderService.dto.OrderRequest;
import com.citymall.orderService.dto.OrderResponse;
import com.citymall.orderService.entity.Order;
import org.springframework.stereotype.Component;

@Component
public class OrderMapper {
    public Order toEntity(OrderRequest request){
        if (request == null){
            return null;
        }
        return Order.builder()
                .paymentMethod(request.paymentMethod())
                .customerId(request.customerId())
                .build();
    }

    public OrderResponse toResponse(Order order) {

        return new OrderResponse(
                order.getId(),
                order.getOrderNumber(),
                order.getTotalAmount(),
                order.getPaymentMethod(),
                order.getCustomerId(),
                order.getStatus()
        );
    }
}
