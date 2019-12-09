package com.idea.test.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Aspect  

public class Guardian {  
      
    @Pointcut("execution(* com.idea.test.util.Monkey.stealPeaches(..))")  
    public void foundMonkey(){}  
  
    @Before(value="foundMonkey()")  
    public void foundBefore(){  
        System.out.println("before【守护者】发现猴子正在进入果园...");  
    }  
    
    
    @Around(value="foundMonkey()")  
    public void foundAround(ProceedingJoinPoint pjp) throws Throwable{  
    	Object[] args = pjp.getArgs();
    	for(Object a: args)
    	System.out.print(a+" ");
    	System.out.println();
    	System.out.println("qwerweret234234ound testetw环绕234325345听的方法");
    	pjp.proceed();
        System.out.println("around【守护者】发现猴子正在徘徊...");  
    }  
      
    @AfterReturning("foundMonkey() && args(name,..)")  
    public void foundAfter(String name){  
        System.out.println("afterReturn【守护者】抓住了猴子,守护者审问出了猴子的名字叫“"+name+"”...");  
    }  
      
}  

