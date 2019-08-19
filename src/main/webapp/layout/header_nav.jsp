<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>头部导航</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css"></link>

  </head>
  
  <body>
   <div id="header-logo">
	<div class="logo-icon"></div>
	<div class="logo-nav">
		<ul>
			<li class="logo-nav nav-option">文艺</li>
			<li class="logo-nav nav-option">青春</li>
			<li class="logo-nav nav-option">教育</li>
			<li class="logo-nav nav-option">励志</li>
			<li class="logo-nav nav-option">生活</li>
		</ul>
	</div>
	<div class="logo-search">
		<input class="search-input" name="likeWhere" type="text"></input>
		<input class="search-btn" type="button"></input>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('.search-btn').on('click',function(){
		var input = $('.search-input').val();
		window.location.href = '${pageContext.request.contextPath}/showBooks.jsp?more='+input;
	});
	$('.search-input').keydown(function(event){
		  if(event.keyCode == 13) {
			 var input = $('.search-input').val();
			 window.location.href = '${pageContext.request.contextPath}/showBooks.jsp?more='+input;
		  }
	});
});
</script>

  </body>
</html>
