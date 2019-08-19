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
			background: #3C80A7;
			color: #FFF;
			/*background: rgba(211,67,47,.9);*/
			}
	.cart-item-detail{
				width:98%;height:100%;padding-left: 2%;
				background: #FAFAFA;
				/*background: rgba(225,185,185,.6);*/
				}
	.cart-checked{height: 50px;width: 30px;float: left;padding-top: 42px;}
	.cart-book-name{height: 105px;width: 520px;float: left;line-height: 105px;}
	.cart-book-price{height: 105px;width: 100px;float: left;line-height: 105px;}
	.cart-book-quantity{height: 105px;width: 60px;float: left;line-height: 105px;}
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
		background: #D4544F;
		color: #FFF;
		outline: none;
		display: block;
		width: 60px;
		height: 30px;
		border: 0px;
		border-radius:5px;
		font-size: 16px;
		cursor: pointer;
	}
	.removeGoodsCls:hover{
		background: #BD362F;
	}
	.towhere{width: 860px;height: 30px;margin: 20px auto;border: 2px solid rgba(215,211,206,1);
				background: #FFF;padding: 30px 50px;
	}
	.inwh{width: 500px;}
	</style>
  </head>
  
  <body>
		<jsp:include page="../init.jsp"></jsp:include>
  		
        <%--  	-------------头部开始---------	--%>
		<jsp:include page="../layout/header.jsp"></jsp:include> 
		
		<%--	-------------头部结束---------	--%>
		<div class="towhere">
			收货地址：<input id="addr" class="inwh" type="text" >
		</div>
		
		<div class="cart-container">
			<div class="cart-title">
			             商品名称	单价	数量	小计	操作
			</div>
			<div class="cart-item-container">
			
			<c:forEach items="${list}" var="cart">
			
				<div id="ID_${cart.cartId }" class="cart-item">
						<div class="cart-from">悦书网</div>
						<div class="cart-item-detail">
							<div class="cart-checked"><input class="cart-checked-y" name="subCheck"  type="hidden" value="${cart.cartId}"></div>
							<div class="cart-book-name">${cart.bookName }</div>
							<div class="cart-book-price">${cart.bookPrice }</div>
							<div class="cart-book-quantity">
								<span class="showQuantity">${cart.quantity }</span>
								<input type="hidden" id="quantity_${cart.cartId }" value="${cart.quantity}">
							</div>
							<div class="cart-book-total"><span>$</span><fmt:formatNumber type="number" value="${cart.quantity * cart.bookPrice }" pattern="0.00" maxFractionDigits="2"/></div>
							<input type="hidden" id="total_${cart.cartId }" value="<fmt:formatNumber type="number" value="${cart.quantity * cart.bookPrice }" pattern="0.00" maxFractionDigits="2"/>">
							

						</div>
				</div>
			</c:forEach>
			</div>
			<div class="cart-pay">
				<input class="cart-pay-btn" onClick="orderIt()" type="button" value="确认下单"><span id="totalCart" style="float:right;">总计：$0</span>
			</div>
		</div>
		
		
		
		<%--  	------------底部开始-------------	--%>
		<jsp:include page="../layout/footer.jsp"></jsp:include> 
		<%--  	------------底部开始-------------	--%>
		
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>	
<script type="text/javascript">
var orderIt = function(){
	var addr = $('#addr').val();
	if(addr.trim() == ''){
		$.jancyMsgBox.alert({
			title:'温馨提示',
			msg:'请填写收货地址'
		});
		return;
	}
	var arr = $(".cart-checked-y[type='hidden']").map(function(){ return $(this).val();});
	var cartIds = "";
	for(var i = 0; i < arr.length; i++){
		if(i==0){
			cartIds += arr[i];
		}else{
			cartIds += ","+arr[i];
		}
	}
	var params = {
		"address":addr,
		"cartIds":cartIds
	};
	$.jancyMsgBox.confirm({
		title:'温馨提示',
		msg:'确定要下单吗？',
		ok:function(){
			$.ajax({
				url:jancy.contextPath + 'bookOrderAction!generateNewOrder.action',
				data:params,
				dataType:'json',
				success:function(result){
					if(result.success){
						window.location.href = "index.jsp";
					}
				}
			});
		}
	});
}
$('.cart-container').height($('.cart-item').size()*$('.cart-item').height()+90);
$(function(){
     countMethod();
});
     var countMethod = function(){
    	var arr = $(".cart-checked-y[type='hidden']").map(function(){ return $(this).val();});
 		if(arr.length <= 0){
 			$('#totalCart').html("总计：$0");
 		}else{
 			var count =0;
 			$.each(arr,function(n,value){
 				count = count + parseFloat($('#total_'+value).val());
 			});
 			$('#totalCart').html("总计：$"+count.toFixed(2));
 		}
     }
</script>		
		
		
	</body>
</html>
