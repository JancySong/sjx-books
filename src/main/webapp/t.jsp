<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>表单重复提交了</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/JancyMsgBox.css">

  </head>
  
  <body style="padding: 0;margin:0;">
	<div>这是测试</div>
	<input type="button" value="hd" onclick="hdf()">
	<script type="text/javascript">
	function hdf(){
		$.jancyMsgBox.alert({
			title:'弹框测试',
			msg:'测试成功',
			ok:function(){
				alert('0kjg2');
			}
		});
	}
	</script>

  </body>
</html>
