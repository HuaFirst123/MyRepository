package com.idea.test.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

/**
 * @Description:
 * @author leiyangjun
 * @date: 2019年7月2日 上午9:49:36
 */
@Component
@Data
@ConfigurationProperties(prefix = "sys.config.authorization")
public class AuthorizationConfig {

    /**
     * 验证码有效期
     */
    private Integer exp;

    /**
     * token分割符
     */
    private String tokenSplit;

    /**
     * 用户ID分割符
     */
    private String userIdSplit;

    /**
     * datanode前缀
     */
    private String datanodePrefix;
}
