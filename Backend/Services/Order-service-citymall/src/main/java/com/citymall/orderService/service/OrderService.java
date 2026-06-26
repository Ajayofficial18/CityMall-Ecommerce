package com.citymall.orderService.service;

import com.citymall.orderService.dto.OrderRequest;
import com.citymall.orderService.dto.OrderResponse;

import java.util.List;

public interface OrderService {
    OrderResponse createOrder(OrderRequest request);
    List<OrderResponse> findAllOrders();
    OrderResponse findById(Integer id);
    List<OrderResponse> findByCustomerId(String customerId);
}
