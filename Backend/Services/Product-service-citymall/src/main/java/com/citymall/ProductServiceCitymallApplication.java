package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ProductServiceCitymallApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProductServiceCitymallApplication.class, args);
		System.out.println("Product Service is started : welcome to citymall");
	}

}
