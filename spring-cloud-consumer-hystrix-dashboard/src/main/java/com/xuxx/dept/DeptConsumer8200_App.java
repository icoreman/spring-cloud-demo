package com.xuxx.dept;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;

@SpringBootApplication
@EnableHystrixDashboard
public class DeptConsumer8200_App {
	public static void main(String[] args) {
		SpringApplication.run(DeptConsumer8200_App.class, args);
	}
}
