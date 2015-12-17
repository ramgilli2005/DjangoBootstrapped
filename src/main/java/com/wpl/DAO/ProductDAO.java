package com.wpl.DAO;

import java.util.Arrays;
import java.util.List;

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
	
	public List<Product> getProdDAO(){
		HttpEntity entity = new HttpEntity(new Product(), header);
		Product[] prodArr = rt.postForObject(SERVICE_URI+PRODUCT_SEARCH, entity, Product[].class);
		List<Product> prodList = Arrays.asList(prodArr);
		//log.info("Prod Name: "+prodList.get(0).getProductName() +" Price: "+prodList.get(0).getProductPrice());
		for(Product prod : prodList){
			prod.setProductImg(prod.getProductName().toLowerCase().concat(".jpg"));
		}
		return prodList;
	}
	
	public List<Product> getProducts(Product p){

		HttpEntity entity = new HttpEntity(p, header);
		Product[] prodArr = rt.postForObject(SERVICE_URI+PRODUCT_SEARCH, entity, Product[].class);
		List<Product> prodList = Arrays.asList(prodArr);
		//log.info("Prod Name: "+prodList.get(0).getProductName() +" Price: "+prodList.get(0).getProductPrice());
		for(Product prod : prodList){
			prod.setProductImg(prod.getProductName().toLowerCase().concat(".jpg"));
		}
		return prodList;
	}
}
