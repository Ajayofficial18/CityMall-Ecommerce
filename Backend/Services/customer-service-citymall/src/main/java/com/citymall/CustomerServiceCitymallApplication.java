package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class CustomerServiceCitymallApplication {

	public static void main(String[] args) {
		SpringApplication.run(CustomerServiceCitymallApplication.class, args);
		System.out.println("Customer Service is running Successfully : welcome to citymall");
	}

}
