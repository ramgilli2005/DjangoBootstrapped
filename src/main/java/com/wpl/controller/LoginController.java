package com.wpl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wpl.DAO.LoginDAO;
import com.wpl.model.UserDetails;

@Controller
@RequestMapping("login.html")
public class LoginController {
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	LoginDAO loginDao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest req,
			HttpServletResponse response,
			@ModelAttribute("model") ModelMap model) {
		
		log.info("Entered Login Controller - GET method");
		// Add values to model to be accessed in the JSP page
		model.addAttribute("test", "test value");
		// Return the name of the JSP page to be displayed
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest req, HttpServletResponse resp){
		
		log.info("Login Controller POST");
		UserDetails daoReq = new UserDetails();
		daoReq.setUserName(req.getParameter("inputEmail").toString());
		daoReq.setPassword(req.getParameter("inputPassword").toString());
		
		if(loginDao.checkLoginDAO(daoReq)){
			log.info("User Validated Successfully");
			return "home";
		}
		
		return "login";
	}

}
