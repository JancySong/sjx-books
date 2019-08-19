<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showBooks.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css" type="text/css"></link>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyPageUtil.js"></script>
  
  	<style type="text/css">
  	body{background: rgba(0, 0, 0, .09);}
  	.pagingBtn{width: 60px;height:30px;line-height:30px;color:#FFF;border: 0;border-radius:3px;background: rgba(230,70,20,1);}
  	.inputPageNum{width:50px;}
  	.disabledBtn{cursor: not-allowed}
  	.pointorCls{cursor: pointer;}
  	</style>
  
  </head>
  
  <body>
    <jsp:include page="./init.jsp"></jsp:include>
	<%--  	-------------头部开始---------	--%>
	<jsp:include page="layout/header.jsp"></jsp:include> 
	<jsp:include page="layout/header_nav.jsp"></jsp:include> 
	<%--	-------------头部结束---------	--%>
	
	<div style="width:1000px;height:80px;margin:0 auto;">
		
	</div>
	
	<div class="contb">
	
	</div>


	<div style="width:1000px;height:60px;margin:0 auto;text-align: right;">
		<input class="selBtn pagingBtn firstPage" type="button" value="首页">
		<input class="selBtn pagingBtn prevPage" type="button" value="<上一页">
		<input class="selBtn pagingBtn nextPage" type="button" value="下一页>">
		<input class="selBtn pagingBtn lastPage" type="button" value="尾页">
		<label id="totalPage">总页数：0</label>
		<input class="inputPageNum" id="inputPageNum" type="text">
		<input id="currentPage" type="hidden">
		<input class="pagingBtn goToPage pointorCls" type="button" value="GOTO">
	</div>
	
	<%--  	------------底部开始-------------	--%>
	<jsp:include page="layout/footer.jsp"></jsp:include> 
	<jsp:include page="layout/right_cart.jsp"></jsp:include>
	<%--  	------------底部开始-------------	--%>
	
	
	<script type="text/javascript">
	var rootPath = '${pageContext.request.contextPath}/';
	var url = document.URL;
	var getValURL = url.split("?")[1];
	var param = "";
	if(getValURL!="" && getValURL!=undefined){
		if(getValURL.split("=")[1]!="" && getValURL.split("=")[1]!=undefined){
			param = decodeURI(getValURL.split("=")[1]);
			$('.search-input').val(param);
		}
	}
	var getBooks = function(params){
		$.ajax({
			url:'${pageContext.request.contextPath}/bookBaseInfoAction!show.action',
			method:'post',
			dataType:'json',
			data:params,
			success:function(data){
				var list = data.list;
				var pinfo = data.page;
				$('.contb').html("");
				$(list).each(function(){
					showBooks(rootPath,"contb",this);
				});
				var count = $('.book-info').size();
				if(count % 4 !=0){
					count = parseInt(count/4+1);
				}else{
					count = count/4;
				}
				
				$('.contb').height(320*count);
				jancyPageMethod(pinfo);
			}
			});
	};
	
	$(function(){
		window.onload = getBooks({"likeWhere":param,"pageSize":10});
		$('.slider-cart .slider-to-top').click(function(){
			var size = 150;
			if($(window).scrollTop() >= size){
			$("html,body").animate({
				scrollTop:0
			},800);
			}
		});
	});
</script>
	
	
	
  </body>
</html>
