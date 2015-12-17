package com.wpl.servicehelper;

import java.nio.charset.Charset;

import org.springframework.util.Base64Utils;

public interface ServiceConstants {
	public static final String SERVICE_URI = "http://192.168.0.5:9595/ShoppingService/rest/";
	public static String auth = "admin:admin";
	public static byte[] encodedAuth = Base64Utils.encode(auth.getBytes(Charset.forName("US-ASCII")));
	public static String authHeader = "Basic " + new String(encodedAuth);
	
}
