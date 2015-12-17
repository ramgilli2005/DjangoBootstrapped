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
	
	$.ajax({
	type:"POST",
    url: "getjson/prod_search",
    contentType:"application/json; charset=utf-8",
	dataType: "JSON",
    data: JSON.stringify({}),
    success: function(data){
    	for(i=0;i<data.length;i++){
    		 $("#div3").append("<table><tr><td><input type=radio name=productname value="+data[i].productName+" onchange=setting(this)></td><td style=color:black;><img class=productsimage src=../assets/"+data[i].productImg+"\></td><td class=prodname style=color:black;>"+data[i].productName+"</td><td style=color:black;>"+data[i].productPrice+"</td></tr></table>");
    	}
    	
                      }
           });
	$("#btn1").click(function(){
		getProductSearch();
		
	
})

});

function setting(ide){
	var produname=ide.value;
//alert(produname);
$.cookie("productnames", produname, { path: '/', expires: 7 });
window.location.href = "cart.html";
}
</script>
<script>

	function getProductSearch(){
		
		var searchvalue=$("#searchValue").val();
		var obj = new Object();
		obj.productName = searchvalue;
		$.ajax({
			type:"POST",
		    url: "getjson/prod_search",
		    contentType:"application/json; charset=utf-8",
			dataType: "JSON",
		    data: JSON.stringify(obj),
		    success: function(dataa){
		    	
		    	for(i=0;i<dataa.length;i++){
		    		$("#div3").empty();
		                    $("#div3").append("<table><tr><td><input type=radio name=productname value="+dataa[i].productName+" onchange=setting(this)></td><td style=color:black;><img class=productsimage src=../assets/"+dataa[i].productImg+"\></td><td class=prodname style=color:black;>"+dataa[i].productName+"</td><td style=color:black;>"+dataa[i].productPrice+"</td></tr></table>");
		                    
		    	}
		    	if(dataa.length==0){
		    		alert("No item Found");
		    	}
		    	
		    	
		                      },
		    error:function(jqXHR, textStatus, errorThrown){
		                     alert("No item Found");
		                      }
		           });
		
	}
	
	
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
Search: <input type="text" id="searchValue">
<br/>
Category:
<select id ="category">
<option>Home</option>
<option>Electronics</option>
<option>books</option>
</select>
<br/>
<input type="button" id="btn1" value="Search">

</form>
</div>
<br/>
<div id="div4">
</div>
<br/>
<div id="div3">

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