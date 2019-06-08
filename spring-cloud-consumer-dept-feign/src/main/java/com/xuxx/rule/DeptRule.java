package com.xuxx.rule;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.netflix.loadbalancer.IRule;

@Configuration
public class DeptRule {
	@Bean
	public IRule myRule() {
		return new TimesRule();// 采用轮询，自定义每台调用次数
	}
}
