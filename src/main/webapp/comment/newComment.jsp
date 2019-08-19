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
	.leftCls{width: 180px;height: 80%;float: left;padding: 10% 10px;}
	.rightCls{width: 760px;height: 80%;float: right;padding: 10% 0;}
	.submitComm{
		background: #53B8D6;
		color: #000;
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
	</style>
  </head>
  
  <body>
		<jsp:include page="../init.jsp"></jsp:include>
  		
        <%--  	-------------头部开始---------	--%>
		<jsp:include page="../layout/header.jsp"></jsp:include> 
		
		<%--	-------------头部结束---------	--%>
		
		<div style="width: 960px;height: 400px;margin: 0 auto;background: #FFF;">
		<div class="leftCls">您对《${bookName }》这本书的评论：<input id="bookId" type="hidden" value="${bid}"></div>
		<div class="rightCls">
			<textarea id="commentContent" rows="10" cols="100"></textarea>
			<input class="submitComm" type="button" value="提交评论" onClick="submitComment()">
		</div>
			
		</div>
		
		<%--  	------------底部开始-------------	--%>
		<jsp:include page="../layout/footer.jsp"></jsp:include> 
		<%--  	------------底部开始-------------	--%>
		
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>	
<script type="text/javascript">
var submitComment = function(){
	var content = $("#commentContent").val();
	var bookId = $("#bookId").val();
	var  entry = { "'": "&apos;", "\"": "&quot;", "<": "&lt;", ">": "&gt;","&":"&amp;"};
	content = content.replace(/(['")-><&\\\/\.])/g, function ($key) {return entry[$key] || $key; });
	var params = {
		"bookId":bookId,
		"content":content
	};
	$.jancyMsgBox.confirm({
		title:'温馨提示',
		msg:'你确定要提交评论吗？',
		ok:function(){
			$.ajax({
				url:jancy.contextPath + 'userCommentAction!comment.action',
				data:params,
				dataType:'json',
				success:function(result){
					if(result.success){
						toBook(bookId);
					}
				}
			});
		}
	});
};

var toBook = function(bookId){
	var form = $("<form></form>");  
    form.attr("action", jancy.contextPath + "bookBaseInfoAction!showBook.action");  
    form.attr("method", "get");
    var my_input = $('<input type="text" name="bid" />');  
    my_input.attr("value", bookId);  
    form.append(my_input);
    form.submit();
};
</script>		
		
		
	</body>
</html>
