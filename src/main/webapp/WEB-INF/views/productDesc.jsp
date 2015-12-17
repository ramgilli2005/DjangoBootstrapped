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
<title>Insert title here</title>
<script>
$(document).ready(function(){
	 var searchkey=$.cookie("productnames");
	 alert(searchkey);
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
		    		$("#div2").append("<table><tr><th>Add to cart</th><th>Image</th><th>name</th><th>Description</th><th>Price</th></tr><tr><td><input type=radio name=tocart value="+data[i].productName+" onchange=selectCart(this)/></td><td style=color:black;><img class=productsimage src=../assets/"+data[i].productImg+"\></td><td class=prodname style=color:black;>"+data[i].productName+"</td><td style=color:black;>"+data[i].productDescription+"</td><td style=color:black;>"+data[i].productPrice+"</td></tr></table>");
		    		break;
		    		}
		    	}
		    	
		                      }
		           });

		});

		function selectCart(ide){
			var cartproduname=ide.value;
		alert(cartproduname);
		$.cookie("cartproductnames", cartproduname, { path: '/', expires: 7 });
		window.location.href = "cart.html";
		}
	
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