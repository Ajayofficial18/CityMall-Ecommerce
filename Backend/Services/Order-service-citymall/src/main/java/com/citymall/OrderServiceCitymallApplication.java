package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OrderServiceCitymallApplication {

	public static void main(String[] args) {
		SpringApplication.run(OrderServiceCitymallApplication.class, args);
		System.out.println("Order Service is started : welcome to citymall");
	}

}
