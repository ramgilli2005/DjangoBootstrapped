package com.wpl.DAO;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.User;
import com.wpl.servicehelper.ServiceConstants;

@Component
public class UserDAO implements ServiceConstants{
	
	private RestTemplate rt;
	
	private static final String USER_SEARCH = "user/get";
	
	private static final Logger log = Logger.getLogger(ProductDAO.class);
	
	private HttpHeaders header;
	public UserDAO(){
		this.rt = new RestTemplate();
		rt.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		header = new HttpHeaders();
		header.add("Authorization", authHeader);
	}
	
	public User getProdDAO(String userName){
		HttpEntity entity = new HttpEntity(userName, header);
		User user = rt.postForObject(SERVICE_URI+USER_SEARCH, entity, User.class);
		
		return user;
	}
	
	
}
