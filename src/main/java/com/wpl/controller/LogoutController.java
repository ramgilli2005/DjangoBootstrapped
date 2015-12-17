package com.wpl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("logout.html")
public class LogoutController {
	private static final Logger log = Logger.getLogger(LogoutController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String logout(HttpServletRequest req,
			HttpServletResponse response,
			@ModelAttribute("model") ModelMap model) {
		
		log.info("Entered Logout Controller - GET method");
		// Add values to model to be accessed in the JSP page
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		// Return the name of the JSP page to be displayed
		return "login";
	}

}
