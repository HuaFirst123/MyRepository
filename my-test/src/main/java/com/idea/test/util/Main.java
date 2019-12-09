package com.idea.test.util;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {  
	  
    public static void main(String[] args) {  
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("config.xml");  
        Monkey monkey = (Monkey) context.getBean("monkey");  
        try {  
            monkey.stealPeaches("孙大圣的大徒弟 what is it?","123",18,213);  
        }  
        catch(Exception e) {}  
    }  
  
}  
