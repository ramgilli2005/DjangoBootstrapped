package com.wpl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wpl.DAO.ProductDAO;

@Controller
@RequestMapping("productDesc.html")
public class ProductDescController {
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest req,
			HttpServletResponse response,
			Model model) {
		
		log.info("Entered ProductDesc Controller - GET method");
		// Add values to model to be accessed in the JSP page
		// Return the name of the JSP page to be displayed
		return "productDesc";
	}
	
	

}
