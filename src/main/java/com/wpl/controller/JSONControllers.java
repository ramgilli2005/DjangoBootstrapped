package com.wpl.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wpl.DAO.OrderDAO;
import com.wpl.DAO.ProductDAO;
import com.wpl.DAO.UserDAO;
import com.wpl.model.Order;
import com.wpl.model.Product;
import com.wpl.model.User;

@Controller
@RequestMapping("getjson")
public class JSONControllers {
	
private static final Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	UserDAO uDao;
	
	@Autowired
	OrderDAO oDao;
	
	@RequestMapping(value="/prod_search", method = RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Product> searchProd(@RequestBody Product product){
		
		log.info("Product Controller POST");
		List<Product> products = dao.getProducts(product);

		return products;
	}
	
	@RequestMapping(value="/user", method = RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody User searchUser(HttpSession session){
		
		log.info("Product Controller POST");
		User user = uDao.getProdDAO(session.getAttribute("userName").toString());

		return user;
	}
	
	@RequestMapping(value="/order", method = RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Order> getOrderHistory(HttpSession session){
		
		log.info("Product Controller POST");
		List<Order> order = oDao.getOrderDAO(session.getAttribute("userName").toString());

		return order;
	}
	
	
	

}
