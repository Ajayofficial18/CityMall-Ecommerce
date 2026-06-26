package com.citymall.orderService.service;

import com.citymall.orderLineService.OrderLineService;
import com.citymall.orderService.dto.OrderRequest;
import com.citymall.orderService.dto.OrderResponse;
import com.citymall.orderService.mapper.OrderMapper;
import com.citymall.orderService.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderServiceImpl implements OrderService{

    private final OrderRepository repository;
    private final CustomerClient customerClient;
    private  final ProductClient productClient;
    private final OrderMapper modelMapper;
    private  final OrderLineService orderLineService;
    private final OrderProducer orderProducer;
    private final PaymentClient paymentClient;

    @Transactional
    @Override
    public OrderResponse createOrder(OrderRequest request) {
        // 1️⃣ Validate customer
        // 2️⃣ Validate products (availability only)
        // 3️⃣ Create order or persist order
        // 4️⃣ Persist order lines
        // 5️⃣ start payment process
        // 6️⃣ send the order confirmation --> notification-ms (using kafka)
        return null;
    }

    @Override
    public List<OrderResponse> findAllOrders() {
        return List.of();
    }

    @Override
    public OrderResponse findById(Integer id) {
        return null;
    }

    @Override
    public List<OrderResponse> findByCustomerId(String customerId) {
        return List.of();
    }
}
