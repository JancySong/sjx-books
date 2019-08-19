<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>悦读悦快乐</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css" type="text/css"></link>
  	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showBooks.js"></script>
  </head>
  
  <body>
  	<jsp:include page="./init.jsp"></jsp:include>
	<%--  	-------------头部开始---------	--%>
	<jsp:include page="layout/header.jsp"></jsp:include> 
	<jsp:include page="layout/header_nav.jsp"></jsp:include> 
	<%--	-------------头部结束---------	--%>
	
	
	<div style="width: 1120px;height: 320px;background: rgba(127,127,127,0.1);margin: 0 auto;padding: 0;">
	<jsp:include page="layout/head_nav_ad.jsp"></jsp:include>

	</div>
	
	
	
	<div class="contTit">小说<div class="moreBooks"><a href="${pageContext.request.contextPath}/showBooks.jsp?more=小说">更多...</a></div></div>
	<div class="contb">
	
	</div>
	<div class="contTit">文学<div class="moreBooks"><a href="${pageContext.request.contextPath}/showBooks.jsp?more=文学">更多...</a></div></div>
	<div class="contb1">
	
	</div>
	<div class="contTit">教育<div class="moreBooks"><a href="${pageContext.request.contextPath}/showBooks.jsp?more=教育">更多...</a></div></div>
	<div class="contb2">
	
	</div>
	
	<%--  	------------底部开始-------------	--%>
	<jsp:include page="layout/footer.jsp"></jsp:include> 
	<jsp:include page="layout/right_cart.jsp"></jsp:include>
	<%--  	------------底部开始-------------	--%>
	
	
	<script type="text/javascript">
	$(function(){
		
		
		var rootPath = '${pageContext.request.contextPath}/';
		
		window.onload = $.ajax({
			url:'${pageContext.request.contextPath}/bookBaseInfoAction!show.action',
			dataType:'json',
			data:{"likeWhere":"小说","pageIndex":1,"pageSize":4},
			cache: false,
			success:function(data){
				var list = data.list;
				$(list).each(function(){
					showBooks(rootPath,"contb",this);
				});
				initBooksStyle("contb",1);
			}
			});
			
		
		initBooksStyle = function(parent,count){
			$('.'+parent).hide().height(320*count).slideDown(1000*2);
		};
		
		
		$('.slider-cart .slider-to-top').click(function(){
			var size = 150;
			if($(window).scrollTop() >= size){
			$("html,body").animate({
				scrollTop:0
			},800);
			}
		});

		var count = $('.book-info').size();
		if(count % 4 !=0){
			count = parseInt(count/4+1);
		}else{
			count = count/4;
		}
		
		$('.contb').height(340*count);

		$(window).scroll(function(){
			var size = 150;
			if($(window).scrollTop() >= size){
				$("#quick-posi").fadeIn(1000*1.5);
			} else{
				$("#quick-posi").fadeOut(1000*1.5);
			}
		});
		
		var flag = 1;
		$(window).scroll(function(){
			if($(window).scrollTop() >= 500 && flag == 1){
				$.ajax({
					url:'${pageContext.request.contextPath}/bookBaseInfoAction!show.action',
					dataType:'json',
					data:{"likeWhere":"文学","pageIndex":1,"pageSize":4},
					cache: true,
					success:function(data){
						var list = data.list;
						$(list).each(function(){
							showBooks(rootPath,"contb1",this);
						});
						initBooksStyle("contb1",1);
					}
				});
				flag++;
			}else if($(window).scrollTop() >= 800 && flag == 2){
				$.ajax({
					url:'${pageContext.request.contextPath}/bookBaseInfoAction!show.action',
					dataType:'json',
					data:{"likeWhere":"教育","pageIndex":1,"pageSize":4},
					cache: true,
					success:function(data){
						var list = data.list;
						$(list).each(function(){
							showBooks(rootPath,"contb2",this);
						});
						initBooksStyle("contb2",1);
					}
				});
				flag++;
			}
		});




		var hoverTimer;
		$('.book-info').hover(function(){
			var target = this;
			hoverTimer = setTimeout(function(){
				$(target).find('.book-intro').slideDown();
			},300);	
		},function(){
			clearTimeout(hoverTimer);
			$(this).find('.book-intro').slideUp(300);
		});


	});
</script>
	
	
	
  </body>
</html>
