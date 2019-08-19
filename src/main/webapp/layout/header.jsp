<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<title>头部页面</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css"></link>
	
	<style type="text/css">
		.noClass{text-decoration: none;color: #C22;}
		.noClass:hover{color: #F10;font-weight: 600;}
	</style>

</head>

<body>

	<div id="header-bar">
		<div class="header-login">
			欢迎来到(<strong>悦书网</strong>),
			<c:choose>
				<c:when test="${sessionScope.username!=null }"><span>（${sessionScope.username}）</span><a class="noClass" href="${pageContext.request.contextPath}/userAction!logout.action">退出</a></c:when>
				<c:when test="${sessionScope.username==null }"><a class="noClass" href="${pageContext.request.contextPath}/login.jsp">请登录。</a></c:when>
			</c:choose>
			
		</div>
		<div class="header-op-nav">
			<ul>
				<li><a class="alink" href="${pageContext.request.contextPath}/userCartAction!query.action?userId=${sessionScope.userId}"><div class="header-cart"></div>购物车<span>
							${sessionScope.countCarts}</span>
				</a>
				</li>
				
				<span class="bord">|</span>
				<li><a class="alink" href="${pageContext.request.contextPath}/bookOrderAction!getBookOrdersByUserId.action?userId=${sessionScope.userId}">我的订单 </a>
				</li>
				<span class="bord">|</span>
				<li><a class="alink" href="javascript:void(0)">个人中心 </a>
				</li>
				<span class="bord">|</span>
				<li><a class="alink" href="javascript:void(0)">联系 </a></li>
			</ul>
		</div>
	</div>
</body>
</html>
