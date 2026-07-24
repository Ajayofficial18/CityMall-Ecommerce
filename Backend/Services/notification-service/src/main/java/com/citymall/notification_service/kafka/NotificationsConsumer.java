package com.citymall.notification_service.kafka;

import com.citymall.notification_service.email.EmailService;
import com.citymall.notification_service.kafka.order.OrderConfirmation;
import com.citymall.notification_service.kafka.payment.PaymentConfirmation;
import com.citymall.notification_service.notification.Notification;
import com.citymall.notification_service.notification.NotificationRepository;
import com.citymall.notification_service.notification.NotificationStatus;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

import static com.citymall.notification_service.notification.NotificationType.ORDER_CONFIRMATION;
import static com.citymall.notification_service.notification.NotificationType.PAYMENT_CONFIRMATION;
import static java.lang.String.format;

@Service
@Slf4j
@RequiredArgsConstructor
public class NotificationsConsumer {

    private final NotificationRepository repository;
    private final EmailService emailService;
    @KafkaListener(topics = "payment-topic")
    public void consumePaymentSuccessNotifications(PaymentConfirmation paymentConfirmation) throws MessagingException {
        log.info(format("Consuming the message from payment-topic Topic:: %s", paymentConfirmation));
        var customerName = paymentConfirmation.customerFirstname() + " " + paymentConfirmation.customerLastname();

        Notification notification = Notification.builder()
                .type(PAYMENT_CONFIRMATION)
                .orderReference(paymentConfirmation.orderReference())
                .recipientEmail(paymentConfirmation.customerEmail())
                .recipientName(customerName)
                .notificationDate(LocalDateTime.now())
                .status(NotificationStatus.PENDING)
                .build();

        try{
            emailService.sendPaymentSuccessEmail(
                    paymentConfirmation.customerEmail(),
                    customerName,
                    paymentConfirmation.amount(),
                    paymentConfirmation.orderReference()
            );
            notification.setStatus(NotificationStatus.SENT);

        } catch (MessagingException ex) {
            notification.setStatus(NotificationStatus.FAILED);
            notification.setFailureReason(ex.getMessage());
            throw ex;
        }
        finally {
            repository.save(notification);
        }


    }

    @KafkaListener(topics = "order-topic")
    public void consumeOrderConfirmationNotifications(OrderConfirmation orderConfirmation) throws MessagingException {
        log.info(format("Consuming the message from order-topic Topic:: %s", orderConfirmation));
        var customerName = orderConfirmation.customer().firstname() + " " + orderConfirmation.customer().lastname();
        Notification notification = Notification.builder()
                .type(ORDER_CONFIRMATION)
                .orderReference(orderConfirmation.orderReference())
                .recipientEmail(orderConfirmation.customer().email())
                .recipientName(customerName)
                .notificationDate(LocalDateTime.now())
                .status(NotificationStatus.PENDING)
                .build();

        try{
            emailService.sendOrderConfirmationEmail(
                    orderConfirmation.customer().email(),
                    customerName,
                    orderConfirmation.totalAmount(),
                    orderConfirmation.orderReference(),
                    orderConfirmation.products()
            );

            notification.setStatus(NotificationStatus.SENT);

        } catch (MessagingException ex) {
            notification.setStatus(NotificationStatus.FAILED);
            notification.setFailureReason(ex.getMessage());
            throw ex;
        }
        finally {
            repository.save(notification);
        }

    }
}
