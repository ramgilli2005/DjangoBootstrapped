package com.wpl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("orders.html")
public class OrderHistoryController {
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest req,
			HttpServletResponse response,
			@ModelAttribute("model") ModelMap model) {
		
		log.info("Entered Order Controller - GET method");
		// Add values to model to be accessed in the JSP page

		
		// Return the name of the JSP page to be displayed
		return "orders";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest req, HttpServletResponse resp){
		
		log.info("Order Controller POST");
		return "orders";
	}

}
