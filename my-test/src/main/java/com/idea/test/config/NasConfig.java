package com.idea.test.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
@ConfigurationProperties(prefix = "sys.file.config.nas")
public class NasConfig {
	
	private boolean enable;
	
	private String url;
	
	private Integer port;
	
	private String username;
	
	private String password;
	
}
