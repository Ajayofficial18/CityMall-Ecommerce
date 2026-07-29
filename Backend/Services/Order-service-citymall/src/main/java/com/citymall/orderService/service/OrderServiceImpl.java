package com.citymall.orderService.service;

import com.citymall.customer.CustomerClient;
import com.citymall.exception.BusinessException;
import com.citymall.exception.ResourceNotFound;
import com.citymall.kafka.OrderConfirmation;
import com.citymall.kafka.OrderProducer;
import com.citymall.orderLineService.OrderLineRequest;
import com.citymall.orderLineService.OrderLineService;
import com.citymall.orderService.dto.OrderRequest;
import com.citymall.orderService.dto.OrderResponse;
import com.citymall.orderService.entity.Order;
import com.citymall.orderService.entity.OrderStatus;
import com.citymall.orderService.mapper.OrderMapper;
import com.citymall.orderService.repository.OrderRepository;
import com.citymall.payment.PaymentClient;
import com.citymall.payment.PaymentRequest;
import com.citymall.product.ProductClient;
import com.citymall.product.PurchaseRequest;
import com.citymall.product.PurchaseResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

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
        log.info("Received order creation request for customerId={}", request.customerId());

        // Validate customer
        log.info("Validating customer with id {}", request.customerId());
        var customerResponse = customerClient.findCustomerById(request.customerId());
        if (customerResponse == null || !customerResponse.isSuccess() || customerResponse.getData() == null) {
            log.error("Customer validation failed. CustomerId={}",
                    request.customerId());
            throw new BusinessException("Cannot create order: customer not found");
        }
        var customer = customerResponse.getData();
        log.info("Customer : {} validated successfully", customer.firstname());


        // Validate products (availability only)
        log.info("checking product availability {}", request.products());
        var validatedProducts  = productClient.validateProducts(request.products());
        if (validatedProducts  == null || validatedProducts .isEmpty()) {
            log.error("Product validation failed for customer {}",
                    request.customerId());
            throw new BusinessException("Cannot create order: products unavailable");
        }
        log.info("products validated :  {}", validatedProducts );


        // Calculate Total Amount
        BigDecimal totalAmount = validatedProducts.stream()
                .map(product ->
                        product.price().multiply(
                                BigDecimal.valueOf(product.quantity())
                        ))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        log.info("Calculated total amount {} for {} product(s)",
                totalAmount,
                validatedProducts.size());


        // Generate order Number
        String orderNumber = generateOrderNumber();
        log.info("Generated order number {}", orderNumber);


        // Create order As PENDING
        log.info("creating order with status PENDING");
        Order order = modelMapper.toEntity(request);
        order.setOrderNumber(orderNumber);
        order.setTotalAmount(totalAmount);
        order.setStatus(OrderStatus.PENDING);
        repository.save(order);
        log.info("Order {} persisted with id {} and status {}",
                order.getOrderNumber(),
                order.getId(),
                order.getStatus());


        // Persist order lines
        log.info("Saving order lines for order {}", orderNumber);
        for (PurchaseResponse product : validatedProducts) {
            orderLineService.saveOrderLine(
                    new OrderLineRequest(
                            order.getId(),
                            product.productId(),
                            product.name(),
                            product.price(),
                            product.quantity()
                    )
            );
        }
        log.info("Saved {} order line(s) for order {}",
                request.products().size(),
                orderNumber);


        // start payment process
        log.info("Initiating payment for order {} with amount {}",
                orderNumber,
                totalAmount);
        var paymentRequest = new PaymentRequest(
                totalAmount,
                request.paymentMethod(),
                order.getId(),
                orderNumber,
                customer
        );
        paymentClient.requestOrderPayment(paymentRequest);
        log.info("Payment initiated successfully for order {}",
                orderNumber);


        // Deduct Inventory
        log.info("Deducting inventory for order {}", orderNumber);
        productClient.purchaseProducts(request.products());
        log.info("Inventory updated successfully for order {}", orderNumber);


        // send the order confirmation --> notification-ms (using kafka)
        log.info("Publishing order confirmation event for order {}",
                orderNumber);
        orderProducer.sendOrderConfirmation(
                new OrderConfirmation(
                        orderNumber,
                        totalAmount,
                        request.paymentMethod(),
                        customer,
                        validatedProducts
                )
        );
        log.info("Order confirmation event published successfully for order {}",
                orderNumber);

        order.setStatus(OrderStatus.CONFIRMED);
        repository.save(order);
        log.info("Order {} status updated to {}",
                orderNumber,
                order.getStatus());
        log.info("Order {} created successfully for customer {}",
                orderNumber,
                customer.firstname());
        return modelMapper.toResponse(order);
    }

    @Override
    public List<OrderResponse> findAllOrders() {
        log.info("Fetching all orders");
        return this.repository.findAll()
                .stream()
                .map(this.modelMapper::toResponse)
                .collect(Collectors.toList());
    }

    @Override
    public OrderResponse findById(Long id) {
        log.info("Fetching order by order id");
        return this.repository.findById(id)
                .map(this.modelMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFound(String.format("No order found with the provided ID: %d", id)));
    }

    @Override
    public List<OrderResponse> findByCustomerId(String customerId) {
        log.info("fetching all the order of Customer with id {}", customerId);
        return repository.findByCustomerId(customerId)
                .stream()
                .map(this.modelMapper::toResponse)
                .collect(Collectors.toList());
    }

    public static String generateOrderNumber() {
        return "CM-"
                + LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE)
                + "-"
                + UUID.randomUUID()
                .toString()
                .substring(0, 6)
                .toUpperCase();
    }
}
