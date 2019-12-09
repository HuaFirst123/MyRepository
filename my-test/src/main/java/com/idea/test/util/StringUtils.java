package com.idea.test.util;
/**
 * 字符串的工具类
 * <p>Title: StringUtils.java</p>   
 * @author 朱乔华 
 * @date 2019年12月5日
 */
public class StringUtils {
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 * @author 朱乔华 
	 * @date 2019年12月5日
	 */
	public static boolean isEmpty(String str) {
		boolean result = true;
		if(str.equals("")||str==null) {
			return result;
		}
		result = false;
		return result;
	}

}
