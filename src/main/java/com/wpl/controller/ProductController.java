package com.wpl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wpl.DAO.ProductDAO;
import com.wpl.model.Product;

@Controller
@RequestMapping("products.html")
public class ProductController {
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest req,
			HttpServletResponse response,
			Model model) {
		
		log.info("Entered Product Controller - GET method");
		// Add values to model to be accessed in the JSP page
		List<Product> products = dao.getProdDAO();
		model.addAttribute("products", products);
		// Return the name of the JSP page to be displayed
		return "products";
	}
	
	

}
