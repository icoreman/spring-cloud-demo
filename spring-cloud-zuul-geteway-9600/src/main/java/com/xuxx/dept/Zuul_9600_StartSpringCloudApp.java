package com.xuxx.dept;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
public class Zuul_9600_StartSpringCloudApp {
	public static void main(String[] args) {
		SpringApplication.run(Zuul_9600_StartSpringCloudApp.class, args);
	}
}
