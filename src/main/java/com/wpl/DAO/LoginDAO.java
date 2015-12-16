package com.wpl.DAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.wpl.controller.LoginController;
import com.wpl.model.UserDetails;
import com.wpl.servicehelper.ServiceConstants;

@Component
public class LoginDAO implements ServiceConstants{
	
	private RestTemplate rt;
	
	private static final String LOGIN_CHECK = "login/checklogin";
	
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	private HttpHeaders header;
	public LoginDAO(){
		this.rt = new RestTemplate();
		rt.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		header = new HttpHeaders();
		header.add("Authorization", authHeader);
	}
	
	public boolean checkLoginDAO(UserDetails req){
		
		//Add Service Authentication
		
		HttpEntity entity = new HttpEntity(req, header);
		UserDetails ud = rt.postForObject(SERVICE_URI+LOGIN_CHECK, entity, UserDetails.class);
		
		log.info("Check: " + ud.getName());
		
		if(ud != null && ud.getName() != null){
			return true;
		}
			
		return false;
	}
	

}
