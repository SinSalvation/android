package com.tonghang.util;

import java.io.UnsupportedEncodingException;

public class CharsetUtil {
	
	public static String getCharacterEncoding(String obj) throws Exception{
		String result = new String(obj.getBytes("gbk"),"gbk");
		if(obj.equals(result)){
			return "gbk";
		}
		result = new String(obj.getBytes("utf-8"),"utf-8");
		if(obj.equals(result)){
			return "utf-8";
		}
		result = new String(obj.getBytes("iso-8859-1"),"iso-8859-1");
		if(obj.equals(result)){
			return "iso-8859-1";
		}
		result = new String(obj.getBytes("gb2312"),"gb2312");
		if(obj.equals(result)){
			return "gb2312";
		}
		return "unknow";
	}
	
	public static String changeCharset(String obj,String charsetname){
		try {
			return new String(obj.getBytes("iso-8859-1"),charsetname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return obj;
		}
	}
}
