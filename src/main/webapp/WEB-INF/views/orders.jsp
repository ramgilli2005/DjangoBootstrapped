<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/layout.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/jquery.jcarousel.setup.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order History</title>
<script>
$(document).ready(function(){
	
	$.ajax({
	type:"POST",
    url: "getjson/order",
    contentType:"application/json; charset=utf-8",
	dataType: "JSON",
    data: JSON.stringify({}),
    success: function(res){
    	for(i=0;i<res.length;i++){
    		
                    $("#div2").append("<table><tr><td style=color:black;>"+res[i].orderId+"</td><td style=color:black;>"+res[i].userName+"</td><td style=color:black;>"+res[i].productId+"</td><td style=color:black;>"+res[i].productQty+"</td><td style=color:black;>"+res[i].totalPrice+"</td><td style=color:black;>"+res[i].orderStatus+"</td></tr></table>");
    	}
                      },
    error:function(jqXHR, textStatus, errorThrown){
                     alert("error");
                      }
           });
	
});
</script>
</head>
<body>
<div class="wrapper col1">
  <div id="topbar">
    <span style="float:right;"><a href="contact.html">Contact Us|</a>
    <a href="contact.html">Hi|</a>
    <a href="contact.html">logout</a></span>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="header">
    <div class="fl_left">
      <h1><a href="home.html">Django Bootstrapped</a></h1>
    </div>
    <br class="clear" />
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="topnav">
    <ul>
      <li><a href="home.html">Homepage</a></li>
      <li><a href="products.html">Products</a></li>
      <li  class="active"><a href="orders.html">Order History</a></li>
      <li><a href="cart.html">Shopping Cart</a></li>
      <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->
<div  class="wrapper col5">
  <div id="container">
    <div id="content">
   <div id="div1">
Your History
</div>
<div id="div2">

</div>
  </div>
    
    </div>
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved
    <br class="clear" />
  </div>
</div>
</body>
</html>