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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
      <li class="active"><a href="products.html">Products</a></li>
      <li><a href="orders.html">Order History</a></li>
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
</div>
<div id="div2">
<form>
Serach: <input type="text" id="name">
<br/>
Category:
<select id ="category">
<option>Home</option>
<option>Electronics</option>
<option>books</option>
</select>
<br/>

<button type="button" class="btn btn-lg btn-primary btn-block" onclick=getProducts()>Submit</button>
</form>
</div>
<br/>
<div id="div3">

${products[0].productImg}

</div>

    </div>
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
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