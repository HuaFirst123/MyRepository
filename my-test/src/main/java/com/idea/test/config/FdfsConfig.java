package com.idea.test.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;
import org.springframework.stereotype.Component;

import com.github.tobato.fastdfs.FdfsClientConfig;

import lombok.Data;

@Configuration
@Import(FdfsClientConfig.class)
@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
@Data
@ConfigurationProperties(prefix = "sys.file.config.fdfs")
public class FdfsConfig {

	private boolean enable;
	
	private String downloadpath;
}
