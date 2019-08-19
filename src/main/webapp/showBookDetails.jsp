<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>图书详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyPageCommentUtil.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/JancyMsgBox.css">
	
  </head>
  <style>
  	.bookInfos{width:1000px;height:400px;margin:20px auto;}
  	.bookImg{width:297px;height:300px;cursor: pointer;padding:40px 0px;text-align: center;margin:auto 0;float: left;border: 1px red solid;}
  	.bookInfoDetail{background:white;width:600px;height: 100%;float: left;padding-left:60px;}
  	
  	.bookInfoName{width:99%;height:50px;}
  	.bookInfoSimp{width:99%;height:100px;}
  	
  	.bookInfoAuPr{width:660px;height:45px;}
  	.bookInfoAuthor{width:200px;height:45px;line-height: 45px;display: inline;}
  	.bookInfoPress{width:220px;height:45px;line-height: 45px;display: inline;}
  	.bookInfoPressDate{width:200px;height:45px;line-height: 45px;display: inline;}
  	
  	.bookInfoPrice{width:660px;height:60px;line-height:60px;color:red;font-size:20px;}
  	
  	.bookInfoCount{width:660px;height:50px;line-height: 50px;}
  	.bookCount{font-size: 18px;width: 45px;height:35px;margin: 0;padding: 0;}
  	.bookCountBtn{border: 0;background: rgba(45,45,45,.2)}
  	.bookCountInput{height: 30px;}
  	
  	.oper{width:660px;height:75px;line-height: 75px;}
  	
  	.buyBook{border:1px solid #F00;width:100px;height:40px;bottom:10px;font-size:18px;background: rgba(250,213,214,1);color:#F00;cursor:pointer;border-radius:5px;}
  	.buyBook:hover{background: rgba(250,200,200,1);}
  	.addBookTo{border:0px;width:150px;height:40px;font-size:18px;background: rgba(230,60,0,.8);color:#FFF;border-radius:5px;cursor:pointer;}
  	.addBookTo:hover{background: rgba(245,30,10,.8);}
  	
  	.etr{width:900px;background:white;margin:0 auto;}
  	
  	.tit{width:90%;height:40px;font-size:20px;line-height: 40px;padding-left: 2%;margin-bottom:5px;border-left: 2px red solid;border-bottom: 2px gray solid;}
  	.bookBasic{width:90%;height:100px;text-align: center;padding-left: 10%;}
  	.bookBasicDet{width:32%;height:20px;float: left;text-align: left;color:gray;}
  	
  	.bookAuthor{width:99%;height:120px;}
  	.simpl{width:95%;height:28px;line-height:28px;color:gray;border-bottom: 2px rgba(45,45,45,.2) solid;border-left: 2px red solid;}
  	.bookDir{width:99%;height:150px;}
  	.bookApp{width:99%;height:150px;}
  	
  	.bookComment{width:99%;height:650px;background: white;}
  	.commentTit{width:96%;height: 30px;padding-left: 3%;line-height: 30px;border: 1px rgba(45,45,45,.3) solid;background: rgba(45,45,45,.1);}
  	.commentContainer{width:99%;height:600px;}
  	.commentContent{width:99%;height:150px;border-bottom:  1px rgba(45,45,45,.3) solid; padding-top: 8px;}
  	.userPic{height: 100%;width: 150px;float: left;}
  	.userComment{height: 80%;width: 700px;float: left;}
  	.commentTime{height: 18%;width: 700px;float: right;text-align: right;}
  	
  	.pagingComment{width:99%;height:40px;clear: both;font-size: 16px;}
  	.pagingBar{width:50%;height: 90%;background: white;float: right;margin-top:10px;}
  	.changePaging{width: 80px;height: 30px;border: 0;background: rgba(230,70,20,.8);color: #FFF;font-weight: 600;border-radius:3px;cursor: pointer;}
  	.paginToNum{width:40px;}
  	.paginTo{width: 45px;height: 25px;border: 0;background: rgba(230,70,20,1);border-radius:3px;color:#FFF;cursor: pointer;}
  	
  	.tabSwitch{color:rgba(45,45,45,.6);cursor: pointer;margin-right: 25px;text-decoration: none;}
  	
  	.disableBtn{cursor: not-allowed;}
  	.grayClass{background: rgba(45,45,45,.2);width: 100px;padding-left:5px;display: block;margin-bottom: 5px;}
  	.hiddenImg{
			display:none
		}
  </style>
  
   	<style type="text/css">
  	body{background: rgba(0, 0, 0, .09);}
  	.pagingBtn{width: 60px;height:30px;line-height:30px;color:#FFF;border: 0;border-radius:3px;background: rgba(230,70,20,1);}
  	.inputPageNum{width:50px;}
  	.disabledBtn{cursor: not-allowed}
  	.pointorCls{cursor: pointer;}
  	</style>
  
  <body style="background: #FFF;">
  		<jsp:include page="./init.jsp"></jsp:include>
    	<%--  	-------------头部开始---------	--%>
		<jsp:include page="layout/header.jsp"></jsp:include> 
		<jsp:include page="layout/header_nav.jsp"></jsp:include> 
		<%--	-------------头部结束---------	--%>

		
		<div class="bookInfos">
			<div class="bookImg" id="bookImg">
				<c:choose>
					<c:when test="${imgUrls.size()==0}">
						<img alt="${bookName}" width="297" height="300" src="<s:text name="img.server.path"/>${coverImage }">
						
					</c:when>
					<c:when test="${imgUrls.size()!=0}">
						<c:forEach items="${imgUrls}" var="imgUrl">
						 	<img src="<s:text name="img.server.path"/>${imgUrl}" width="297" height="300" class="3dimgs hiddenImg" />
						</c:forEach>
					</c:when>
				</c:choose>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyRotate3D.js"></script>
			<script type="text/javascript">
			$(function(){
				$('#bookImg').jancyRotate3D();
			});
			</script>
			</div>
			<div class="bookInfoDetail">
				<div class="bookInfoName">书名:${bookName}</div>
				<div class="bookInfoSimp">简单介绍：
					<c:choose>
						<c:when test="${introduction==null || introduction==''}">没有内容简介</c:when>
						<c:when test="${introduction!=null}">
							<c:if test="${fn:length(introduction)>200 }">${fn:substring(introduction, 0, 200)}</c:if>
							<c:if test="${fn:length(introduction)<=200 }">${introduction}</c:if>
						</c:when>
					</c:choose>
				</div>
				
				<div class="bookInfoAuPr">
					<div class="bookInfoAuthor">作者:${author}</div>
					<div class="bookInfoPress">出版社:${press }</div>
					<div class="bookInfoPressDate">出版时间:${publishDate }</div>
				</div>
				
				<div class="bookInfoPrice">￥ ${price }</div>
				
				<div class="bookInfoCount">
					<input id="bookSUB" class="bookCount bookCountBtn" type="button" value="-"/>
					<input id="bookIn" class="bookCount bookCountInput" type="text" value="1" />
					<input id="bookADD" class="bookCount bookCountBtn" type="button" value="+"/>
				</div>
				
				<div class="oper">
					<input id="bookId" type="hidden" value="${bid}">
					<input class="buyBook" type="button" value="立即购买"/>
					<input onClick="addBookToCart()" class="addBookTo" type="button" value="加入购物车"/>
				</div>
			</div>
		</div>
		
		<div class="etr">
			<div class="bookDetail">
				<div id="titFixed" class="tit"><a class="tabSwitch">商品详情</a><a href="#bcomment" class="tabSwitch">商品评论(<span class="countComments">0</span>)</a></div>
				<div class="bookBasic">
					<div class="bookBasicDet">版 次：1</div>
					<div class="bookBasicDet">页 数：${totalPages }</div>
					<div class="bookBasicDet">字 数：</div>
					<div class="bookBasicDet">印刷时间：${publishDate }</div>
					<div class="bookBasicDet">开 本：16开</div>
					<div class="bookBasicDet">纸 张：胶版纸</div>
					<div class="bookBasicDet">印 次：1</div>
					<div class="bookBasicDet">包 装：平装</div>
					<div class="bookBasicDet">丛书名：</div>
					<div class="bookBasicDet">国际标准书号ISBN：9787553722306</div>
				</div>
				<div class="bookAuthor">
					<div class="simpl">
						<span class="grayClass">作者简介</span>
						${author}
					</div>
				</div>
				<div class="bookDir">
					<div class="simpl">
						<span class="grayClass">内容简介</span>
						${introduction}
		<script type="text/javascript">
			var introSize = ${fn:length(introduction)};
			var introRows = parseInt( introSize / 50);
			$('.bookDir').height(introRows * 30 + 50);
			//$("div#footer-container").css({"margin-top":"310px"});
		</script>
					</div>
				</div>
				<div class="bookApp">
					<div class="simpl">
						<span class="grayClass">在线预读</span>
					</div>
				</div>
			</div>
			<div class="bookComment">
				<a name="bcomment"></a>
				<div class="commentTit">商品评论(<span class="countComments">0</span>)</div>
				<div class="commentContainer">
				<!--
					<div class="commentContent">
						<div class="userPic">脑袋里住着</div>
						<div class="userComment">
							一本专业药师用良心写就的药学常识书，一本中国人居家必备的安全用药权威指南。
							 ★中美双重认证职业药剂师以13年资深经验深入阐述亿万国人最关心的用药问题。
							  ★@和睦家药师冀连梅应30万微博粉丝要求，诚意奉上本书，生动讲述国人必须知道的用药常识
							  ：抗生素≠消炎药，对滥用输液说不，感冒用药如何规避误区，婴幼儿、孕妇、哺乳期女性如何安全用
						</div>
						<div class="commentTime">2013-12-13 16:07:42 </div>
					</div>
				-->
				</div>
					<div style="width:98%;height:80px;text-align: right;clear:both;line-height:80px;">
						<input class="selBtn pagingBtn firstPage" type="button" value="首页">
						<input class="selBtn pagingBtn prevPage" type="button" value="<上一页">
						<input class="selBtn pagingBtn nextPage" type="button" value="下一页>">
						<input class="selBtn pagingBtn lastPage" type="button" value="尾页">
						<label id="totalPage">总页数：0</label>
						<input class="inputPageNum" id="inputPageNum" type="text">
						<input id="currentPage" type="hidden">
						<input class="pagingBtn goToPage pointorCls" type="button" value="GOTO">
					</div>
			</div>
		</div>
		<script type="text/javascript">
		var url = document.URL;
		url = url.split("#")[0];
		var getValURL = url.split("?")[1];
		var param = "";
		if(getValURL!="" && getValURL!=undefined){
			if(getValURL.split("=")[1]!="" && getValURL.split("=")[1]!=undefined){
				param = decodeURI(getValURL.split("=")[1]);
			}
		}
		//var introRows = parseInt( introSize / 50);
		//$('.bookDir').height(introRows * 40);
		var getComments = function(params){
			$.ajax({
				url:'${pageContext.request.contextPath}/userCommentAction!findUserCommentsByBookId.action',
				method:'post',
				dataType:'json',
				data:params,
				success:function(data){
					var list = data.list;
					var pinfo = data.page;
					$('.countComments').text(pinfo.totalCount);
					$('.commentContainer').html("");
					//$('.commentContainer').height(list.length * 150);
					
					var baseHei = $('.bookDetail').height();
					$('.etr').height(list.length * 160 + baseHei + 120);
					$(list).each(function(){
						var commentHtml = "<div class='commentContent'>";
						commentHtml +="<div class='userPic'>"+this["userName"]+"</div>";
						commentHtml +="<div class='userComment'>"+this["content"]+"</div>";
						commentHtml +="<div class='commentTime'>"+this["commTime"]+"</div>";
						commentHtml +="</div>";
						$('.commentContainer').append(commentHtml);
					});
					jancyPageCommentMethod(pinfo);
					//$('#footer-container').css({"margin-top":"0px"});
				}
				});
		};
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>	
		<script type="text/javascript">
		//$("div#footer-container").css({"margin-top":"1000px"});
		var addBookToCart = function(){
			var bookQuantity = $("#bookIn").val();
			var bookId = $("#bookId").val();
			var params = {
				"bookId":bookId,
				"quantity":bookQuantity
			};
			$.jancyMsgBox.confirm({
				title:'温馨提示',
				msg:'要加入购物车吗？',
				ok:function(){
					$.ajax({
						url:jancy.contextPath + 'userCartAction!addBookToUserCart.action',
						type:'post',
						data:params,
						dataType:'json',
						success:function(result){
							if(result.success){
								$.jancyMsgBox.alert({
									title:'温馨提示',
									msg:'添加成功！！'
								});
							}
						}
					});
				}
			});
		};
		
		(function($){
			window.onload = getComments({"bookId":param,"rows":2});
			$('#bookIn').keyup(function(){
				var reg = /^\d{1,5}$/;
				var input = $(this).val();
				if(reg.test(input)){
					change(input);
				}else{
					$(this).val(1);
					change(1);
				}
			});
			$('#bookSUB').click(function(){
				var bookIn = $('#bookIn');
				var input = parseInt(bookIn.val());
				if(input-1<1){
					change(1);
				}else{
					bookIn.val(input-1);
				}
			});
			$('#bookADD').click(function(){
				var bookIn = $('#bookIn');
				var input = parseInt(bookIn.val());
				bookIn.val(input+1);
				if(input==1){
					change(2);
				}
			});
			
			var change = function(num){
				if(num==1){
					$('#bookSUB').addClass('disableBtn');
				}else{
					$('#bookSUB').removeClass('disableBtn');
				}
			};
			
			
			
			
			var commentHeight = $('.commentContent').size() * 150;
			$('.commentContainer').height(commentHeight);
			$('.bookComment').height(commentHeight+180);
			
			
			
			
			
			
			
		})(jQuery);
		
		</script>
	<%--  	------------底部开始-------------	--%>
	<jsp:include page="layout/footer.jsp"></jsp:include> 
	<%--  	------------底部开始-------------	--%>

  </body>
</html>
