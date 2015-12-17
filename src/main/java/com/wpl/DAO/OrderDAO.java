package com.wpl.DAO;

import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.Order;
import com.wpl.servicehelper.ServiceConstants;

@Component
public class OrderDAO implements ServiceConstants{
	
	private RestTemplate rt;
	
	private static final String ORDER_SEARCH = "order/get";
	
	private static final Logger log = Logger.getLogger(ProductDAO.class);
	
	private HttpHeaders header;
	public OrderDAO(){
		this.rt = new RestTemplate();
		rt.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		header = new HttpHeaders();
		header.add("Authorization", authHeader);
	}
	
	public List<Order> getOrderDAO(String userName){
		HttpEntity entity = new HttpEntity(userName, header);
		Order[] order = rt.postForObject(SERVICE_URI+ORDER_SEARCH, entity, Order[].class);
		
		return Arrays.asList(order);
	}
	
	
}
