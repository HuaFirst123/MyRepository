package com.idea.test.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
@ConfigurationProperties(prefix = "sys.file.config.local")
public class LocalConfig {
	
	private boolean enable;
	
	private String storepath;
	
	private String downloadpath;
}
