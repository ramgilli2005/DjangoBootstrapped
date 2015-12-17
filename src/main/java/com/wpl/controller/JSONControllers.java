package com.wpl.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wpl.DAO.ProductDAO;
import com.wpl.model.Product;

@Controller
@RequestMapping("getjson")
public class JSONControllers {
	
private static final Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(value="/prod_search", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Product> searchProd(@RequestBody Product product){
		
		log.info("Product Controller POST");
		List<Product> products = dao.getProducts(product);

		return products;
	}

}
