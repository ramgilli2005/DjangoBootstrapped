package com.wpl.DAO;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.wpl.model.Product;
import com.wpl.servicehelper.ServiceConstants;

@Component
public class ProductDAO implements ServiceConstants{
	
	private RestTemplate rt;
	
	private static final String PRODUCT_SEARCH = "product_search/search";
	
	private static final Logger log = Logger.getLogger(ProductDAO.class);
	
	private HttpHeaders header;
	public ProductDAO(){
		this.rt = new RestTemplate();
		rt.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		header = new HttpHeaders();
		header.add("Authorization", authHeader);
	}
	
	public Product getProdDAO(){
		HttpEntity entity = new HttpEntity(null, header);
		Product prod = rt.postForObject(SERVICE_URI+PRODUCT_SEARCH, entity, Product.class);
		log.info("Prod Name: "+prod.getProductName() +" Price: "+prod.getProductPrice());
		prod.setProductImg(prod.getProductName().toLowerCase().concat(".jpg"));
		return prod;
	}
	
	public Product getProducts(Product p){

		HttpEntity entity = new HttpEntity(p, header);
		Product prod = rt.postForObject(SERVICE_URI+PRODUCT_SEARCH, entity, Product.class);
		log.info("Prod Name: "+prod.getProductName() +" Price: "+prod.getProductPrice());
		prod.setProductImg(prod.getProductName().toLowerCase().concat(".jpg"));
		return prod;
	}
}
