<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/layout.css" type="text/css" />
<link rel="stylesheet" href="../css/display.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/jquery.jcarousel.setup.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
<script>
$(document).ready(function(){	
		var searchkey=$.cookie("productnames");
		if(searchkey == ""){
			alert("Cart is empty!");
			window.location.href = "home.html";
		}
		 //alert(searchkey);
		 $.ajax({
				type:"POST",
			    url: "getjson/prod_search",
			    contentType:"application/json; charset=utf-8",
				dataType: "JSON",
			    data: JSON.stringify({}),
			    success: function(data){
			    	for(i=0;i<data.length;i++){
			    		if(data[i].productName==searchkey)
			    		{	
			    		$("#div2").append("<table><tr><th>Image</th><th>name</th><th>Description</th><th>Price</th></tr><tr><td style=color:black;><img class=productsimage src=../assets/"+data[i].productImg+"\></td><td class=prodname style=color:black;>"+data[i].productName+"</td><td style=color:black;>"+data[i].productDescription+"</td><td style=color:black;>"+data[i].productPrice+"</td></tr></table>");
			    		$("#prod_id").val(data[i].productName);
			    		$("#prod_id").hide();
			    		break;
			    		}
			    	}
			    	
			                      }
			           });

			function selectCart(ide){
				var cartproduname=ide.value;
			alert(cartproduname);
			$.cookie("cartproductnames", cartproduname, { path: '/', expires: 7 });
			window.location.href = "cart.html";
			}
			
			$("#submitBut").click(function(){
				alert("Your order has been Placed!")
			});
			$("#cart_empty").click(function(){
				$.cookie("productnames", "", { path: '/', expires: 7 });
				alert("Cart Emptied");
				window.location.href = "products.html";
				
			});
			
			
	});
	

</script>
</head>
<body>
<div class="wrapper col1">
  <div id="topbar">
    <span style="float:right;"><a href="contact.html">Contact Us|</a>
    <a href="contact.html">Hi|</a>
    <a href="logout.html">logout</a></span>
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
      <li><a href="orders.html">Order History</a></li>
      <li class="active"><a href="cart.html">Shopping Cart</a></li>
      <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->
<div  class="wrapper col5">
  <div id="container">
    <div id="content">
   <div id="div1">
Your Cart

</div>
<form id="form1" method="post">
<div id="div2">

</div>
<div id="div3">
<input type="text" name="prod_id" id="prod_id" />
<h3> <input type='button' value='Empty Cart' id='cart_empty' /> </h3>
<br/>
<h2>Card Information</h2>
<input type="text" name="card" placeholder="Card Number" /> <br/><br/>
<input type="text" name="expiry" placeholder="Valid Thru" />
<input type="text" name="cvv" placeholder="CVV" /> <br/><br/>
<input type="text" name="name" placeholder="Name" />
<br/>
<br/>
<h2>Shipping Information</h2>
<h4>Name : <input type="text" name="sname" placeholder="Name" value="Test"/> <br/><br/><br/>
Address : <input type="text" name="saddr" placeholder="Address" value="601 W Renner Rd"/> <br/><br/><br/>
Address 2 :<input type="text" name="saddr2" placeholder="Address" value="Apt #120"/> <br/><br/><br/>
City/State : <input type="text" name="cvv" placeholder="CVV" value="Richardson, TX"/> <br/><br/><br/>
Zipcode : <input type="text" name="name" placeholder="Name" value="75080"/> <br/><br/><br/></h4>
</div>
<br/>
<input type="submit" value="Place Order" id="submitBut"/>
</form>
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