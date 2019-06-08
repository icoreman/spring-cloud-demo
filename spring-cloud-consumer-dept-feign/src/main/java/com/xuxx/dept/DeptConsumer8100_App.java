package com.xuxx.dept;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients(basePackages= {"com.xuxx.dept"})
@ComponentScan("com.xuxx.dept")
public class DeptConsumer8100_App {
	public static void main(String[] args) {
		SpringApplication.run(DeptConsumer8100_App.class, args);
	}
}
