<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>右侧购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
		<div id="slide-bar">
		<div class="slider-cart">
			<div class="slider-cart slider-cart-icon"></div>
			<span>购</span><span>物</span><span>车</span>
			<div class="slider-cart slider-cart-count">${sessionScope.countCarts}</div>
			<div class="slider-cart slider-feedback"></div>
			<div class="slider-cart slider-to-top"></div>
		</div>
		</div>
  </body>
</html>
