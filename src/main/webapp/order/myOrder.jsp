<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>我的订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css"></link>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/JancyMsgBox.css">
	
	<style type="text/css">
	.cart-container{width:960px;height:360px;background: #FFF;margin: 0 auto;border: 5px solid rgba(215,211,206,1);}
	.cart-title{width:98%;padding-left:2%;height:30px;background: rgba(215,211,206,1);line-height: 30px;}
	.cart-item{width:100%;height:140px;background:#FFF;}
	.cart-from{width:95%;height: 35px;line-height: 35px;
			padding-left: 5%;
			background: rgba(147,219,162,.8);
			color: #000;
			/*background: rgba(211,67,47,.9);*/
			}
	.cart-item-detail{
				width:98%;height:100%;padding-left: 2%;
				background: #FAFAFA;
				/*background: rgba(225,185,185,.6);*/
				}
	.cart-checked{height: 50px;width: 30px;float: left;padding-top: 42px;}
	.cart-book-name{height: 105px;width: 280px;float: left;line-height: 105px;}
	.cart-book-price{height: 105px;width: 200px;float: left;line-height: 105px;}
	.cart-book-quantity2{height: 105px;width: 100px;float: left;line-height: 105px;}
	.cart-book-quantity{height: 105px;width: 200px;float: left;line-height: 105px;}
	.cart-book-total{height: 105px;width: 100px;float: left;line-height: 105px;}
	.cart-operation{
				height: 60px;width: 60px;
				float: left;
				padding-top: 40px;
	}
	
	.cart-pay{width:100%;height:40px;background: #FFF;margin-top:10px;
				line-height:40px;
				border-top: 1px solid #CCC;
				}
	.cart-pay-btn{width:80px;height:35px;border:0px solid gray;border-radius:5px;font-weight:900;
				font-size: 16px;color: #FFF;background: #53B8D6;
				outline:none;
				float:right;margin:8px 50px;
				cursor: pointer;
				}
	.cart-pay-btn:hover{background: #3299B7}
	
	#footer-container .footer-copyright{height: 40px;}
	.subOrAdd{text-decoration: none;width: 40px;height: 105px;float: right;padding-top: 35px;}
	.showQuantity{float: left;}
	.btnAddOrSub{width: 25px;height: 16px;display:block;
	background-image: url("${pageContext.request.contextPath}/images/layout/icons.png");
	background-position: -100px -300px;
	background-repeat: no-repeat;
	border: 1px solid gray;border-radius:3px;margin-top:2px;cursor: pointer;}
	.add{background-position: -107px -328px;}
	.sub{background-position:-107px -315px;}
	.removeGoodsCls{
		background: #53B8D6;
		color: #FFF;
		outline: none;
		display: block;
		width: 100px;
		height: 30px;
		border: 0px;
		border-radius:5px;
		font-size: 16px;
		cursor: pointer;
		text-decoration: none;
		text-align: center;
		line-height: 30px;
	}
	.removeGoodsCls:hover{
		background: #3299B7;
	}
	.towhere{width: 860px;height: 30px;margin: 20px auto;border: 2px solid rgba(215,211,206,1);
				background: #FFF;padding: 30px 50px;
	}
	.inwh{width: 500px;}
	.clsOrder{
		color: #000;
		font-size: 16px;
		cursor: pointer;
		text-decoration: none;
	}
	.clsOrder:hover{
		color: red;
	}
	</style>
  </head>
  
  <body>
		<jsp:include page="../init.jsp"></jsp:include>
  		
        <%--  	-------------头部开始---------	--%>
		<jsp:include page="../layout/header.jsp"></jsp:include> 
		
		<%--	-------------头部结束---------	--%>
		<div class="cart-container">
			<div class="cart-title">
			            订单编号	下单时间	合计	订单状态	操作
			</div>
			<div class="cart-item-container">
			
			<c:forEach items="${list}" var="order">
			
				<div class="cart-item">
						<div class="cart-from">悦书网</div>
						<div class="cart-item-detail">
							<div class="cart-checked"></div>
							<div class="cart-book-name">${order.orderId }</div>
							<div class="cart-book-price">${order.orderTime }</div>
							<div class="cart-book-quantity2">
								<span class="showQuantity">${order.total }</span>
							</div>
							<div class="cart-book-quantity">
								<c:choose>
									<c:when test="${order.status ==1 }">
										<a class="clsOrder" href="${pageContext.request.contextPath}/bookOrderAction!payBookOrder.action?orderId=${order.orderId }">去支付</a>
									</c:when>
									<c:when test="${order.status ==2 }">已支付</c:when>
									<c:when test="${order.status ==4 }">已配货</c:when>
									<c:when test="${order.status ==8 }">发货中|
										<a class="clsOrder" href="javascirpt:void(0)" onClick="confirmRec('${order.orderId }')">收货确认</a>
									</c:when>
									<c:otherwise>订单结束</c:otherwise>
								</c:choose>
							</div>
							<div class="cart-operation">
								<a class="removeGoodsCls" href="${pageContext.request.contextPath}/bookOrderItemAction!showBookDetails.action?orderId=${order.orderId}">查看详细</a>
							</div>
						</div>
				</div>
			</c:forEach>
			</div>
		</div>
		
		
		
		<%--  	------------底部开始-------------	--%>
		<jsp:include page="../layout/footer.jsp"></jsp:include> 
		<%--  	------------底部开始-------------	--%>
		
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>	
<script type="text/javascript">
var confirmRec = function(orderId){
	var params ={
		"orderIds":orderId,
		"status":16
	};
	$.jancyMsgBox.confirm({
		title:'温馨提示',
		msg:'确认已经收到货！！',
		ok:function(){
			$.ajax({
				url:jancy.contextPath + 'bookOrderAction!updateStatus.action',
				type:'post',
				data:params,
				dataType:'json',
				success:function(result){
					if(result.success){
						location.reload();
					}
				}
			});
		}
	});
};

$('.cart-container').height($('.cart-item').size()*$('.cart-item').height()+90);
$(function(){
});

</script>		
		
		
	</body>
</html>
