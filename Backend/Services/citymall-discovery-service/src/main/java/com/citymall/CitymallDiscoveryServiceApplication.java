package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class CitymallDiscoveryServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CitymallDiscoveryServiceApplication.class, args);
		System.out.println("discovery service is started : welcome to citymall");
	}

}
