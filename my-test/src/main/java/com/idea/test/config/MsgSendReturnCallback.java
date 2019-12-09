/**
 * @Description :
 * @author :
 * @date :2019年8月30日
 */
package com.idea.test.config;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.RabbitTemplate.ReturnCallback;

import lombok.extern.slf4j.Slf4j;

/**
 * @Description :设置回调函数
 * @author :彭晨
 * @date :2019年8月30日
 */
@Slf4j
public class MsgSendReturnCallback implements ReturnCallback{

	/**
	 * @Title :回调函数
	 * @Description :交换机未连接到队列后回调函数
	 * @param :message消息主体 ， replyText描述，exchange交换机名，routingKey路由键
	 * @return :
	 */
	@Override
	public void returnedMessage(Message message, int replyCode, String replyText, String exchange, String routingKey) {
		log.info("交换机未连接到队列后回调return--message:"+new String(message.getBody())+",replyCode:"+replyCode+",replyText:"
                +replyText+",exchange:"+exchange+",routingKey:"+routingKey);
	}

}
