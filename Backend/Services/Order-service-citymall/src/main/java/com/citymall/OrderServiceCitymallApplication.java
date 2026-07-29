package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableFeignClients
@EnableJpaAuditing
public class OrderServiceCitymallApplication {

	public static void main(String[] args) {
		SpringApplication.run(OrderServiceCitymallApplication.class, args);
		System.out.println("Order Service is started : welcome to citymall");
	}

}
