package com.citymall.notification_service.notification;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;



@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "notifications")
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NotificationType type;

    @Column(nullable = false)
    private String orderReference;

    @Column(nullable = false)
    private String recipientEmail;

    @Column(nullable = false)
    private String recipientName;

    @Column(nullable = false)
    private LocalDateTime notificationDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NotificationStatus status;     // SENT, FAILED, PENDING

    @Column(length = 1000)
    private String failureReason;
}
