package com.wpl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wpl.DAO.OrderDAO;
import com.wpl.DAO.ProductDAO;
import com.wpl.model.Order;
import com.wpl.model.Pay;
import com.wpl.model.Product;

@Controller
@RequestMapping("cart.html")
public class CheckoutController {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	OrderDAO oDao;
	
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginPage(HttpServletRequest req,
			HttpServletResponse response,
			@ModelAttribute("model") ModelMap model) {
		
		log.info("Entered Checkout Controller - GET method");
		// Add values to model to be accessed in the JSP page

		
		// Return the name of the JSP page to be displayed
		return "cart";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		
		log.info("Checkout Controller POST");
		Product product = new Product();
		product.setProductName(req.getParameter("prod_id"));
		List<Product> productList = dao.getProducts(product);
		
		Order order = new Order();
		order.setProductId(productList.get(0).getProductId());
		order.setProductQty("1");
		order.setTotalPrice(productList.get(0).getProductPrice());
		order.setUserName(session.getAttribute("userName").toString());
		order.setOrderStatus("CONFIRMED");
		String orderId = oDao.saveOrder(order);
		
		Pay pay = new Pay();
		pay.setCardType("VISA");
		pay.setOrderId(orderId);
		pay.setUserName(session.getAttribute("userName").toString());
		pay.setPaymentStatus("SUCCESS");
		String status = oDao.savePay(pay);
		
		
		return "home";
	}

}
