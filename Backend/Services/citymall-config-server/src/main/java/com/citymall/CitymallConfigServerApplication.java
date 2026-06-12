package com.citymall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class CitymallConfigServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CitymallConfigServerApplication.class, args);
		System.out.println("Config Server Started : welcome to citymall");
	}

}
