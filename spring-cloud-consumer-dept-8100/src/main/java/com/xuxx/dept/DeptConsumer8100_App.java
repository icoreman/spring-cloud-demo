package com.xuxx.dept;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.ribbon.RibbonClient;

import com.xuxx.rule.DeptRule;

@SpringBootApplication
@EnableEurekaClient
@RibbonClient(name = "MICROSERVICECLOUD-DEPT", configuration = DeptRule.class)
public class DeptConsumer8100_App {
	public static void main(String[] args) {
		SpringApplication.run(DeptConsumer8100_App.class, args);
	}
}
