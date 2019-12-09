package com.idea.test.config;

import java.io.IOException;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author fuweiheng
 * @date 2019年8月27日
 * @Description:es 连接工厂
 */
@Slf4j
public class ESClientFactory {
	public static int CONNECT_TIMEOUT_MILLIS = 1000;
	public static int SOCKET_TIMEOUT_MILLIS = 30000;
	public static int CONNECTION_REQUEST_TIMEOUT_MILLIS = 500;
	public static int MAX_CONN_PER_ROUTE = 10;
	public static int MAX_CONN_TOTAL = 30;

	private static HttpHost[] HTTP_HOST;

	private RestClientBuilder builder;

	private RestClient restClient;

	private RestHighLevelClient restHighLevelClient;

	private static ESClientFactory esClientFactory = new ESClientFactory();

	private ESClientFactory() {
	}

	public static ESClientFactory build(HttpHost[] httpHostArray, Integer maxConnectNum, Integer maxConnectPerRoute) {
		HTTP_HOST = httpHostArray;
		MAX_CONN_TOTAL = maxConnectNum;
		MAX_CONN_PER_ROUTE = maxConnectPerRoute;
		return esClientFactory;
	}

	public static ESClientFactory build(HttpHost[] httpHostArray, Integer connectTimeOut, Integer socketTimeOut,
			Integer connectionRequestTime, Integer maxConnectNum, Integer maxConnectPerRoute) {
		HTTP_HOST = httpHostArray;
		CONNECT_TIMEOUT_MILLIS = connectTimeOut;
		SOCKET_TIMEOUT_MILLIS = socketTimeOut;
		CONNECTION_REQUEST_TIMEOUT_MILLIS = connectionRequestTime;
		MAX_CONN_TOTAL = maxConnectNum;
		MAX_CONN_PER_ROUTE = maxConnectPerRoute;
		return esClientFactory;
	}

	public void init() {
		builder = RestClient.builder(HTTP_HOST);
		setConnectTimeOutConfig();
		setMutiConnectConfig();
	}

	// 配置连接时间延时
	public void setConnectTimeOutConfig() {
		builder.setRequestConfigCallback(requestConfigBuilder -> {
			requestConfigBuilder.setConnectTimeout(CONNECT_TIMEOUT_MILLIS);
			requestConfigBuilder.setSocketTimeout(SOCKET_TIMEOUT_MILLIS);
			requestConfigBuilder.setConnectionRequestTimeout(CONNECTION_REQUEST_TIMEOUT_MILLIS);
			return requestConfigBuilder;
		});
	}

	// 使用异步httpclient时设置并发连接数
	public void setMutiConnectConfig() {
		builder.setHttpClientConfigCallback(httpClientBuilder -> {
			httpClientBuilder.setMaxConnTotal(MAX_CONN_TOTAL);
			httpClientBuilder.setMaxConnPerRoute(MAX_CONN_PER_ROUTE);
			return httpClientBuilder;
		});
	}

	/**
	 * lowlevelclient
	 * @return
	 */
	public RestClient getClient() {
		return builder.build();
	}

	/**
	 * highlevelclient
	 * @return
	 */
	public RestHighLevelClient getRhlClient() {
		return new RestHighLevelClient(builder);
	}

	public void close() {
		if (restClient != null) {
			try {
				restClient.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (restHighLevelClient != null) {
			try {
				restHighLevelClient.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		log.info("client closed");
	}
}
