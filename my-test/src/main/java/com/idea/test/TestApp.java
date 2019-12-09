package com.idea.test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.scheduling.annotation.EnableScheduling;


import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication(exclude = { RabbitAutoConfiguration.class, RedisAutoConfiguration.class, })
@ComponentScans({ @ComponentScan("com.idea.platform.common.config.druid"),
		@ComponentScan("com.idea.platform.common.config.exception"),
		@ComponentScan("com.idea.platform.common.config.swagger"),
		@ComponentScan("com.idea.platform.common.config.version"),
		@ComponentScan("com.idea.platform.common.config.parameter"),//统一处理用户信息参数,如用户名,UUID,tenant,用户姓名
        @ComponentScan("com.idea.platform.common.config.valid"),//统一校验
		@ComponentScan("com.idea.platform.common.config.pageHelper") })

@EnableDiscoveryClient
@EnableFeignClients
@EnableSwagger2
@MapperScan("com.idea.test.mapper")
public class TestApp {

		public static void main(String[] args) {
			SpringApplication.run(TestApp.class, args);
		}
	}
