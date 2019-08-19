<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>恭喜您，注册成功！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body{background: #FFF}
	.mainC{
		width: 800px;
		height: 450px;background: #FDFDFD;
		margin: 0 auto;
		border-radius:8px;
		border: 1px solid #CCC;
	}
	.mainTitle{
		width: 98%;
		height:35px;
		background: #DDD;
		line-height: 35px;
		padding-left: 2%;
	}
	.mainBody{
		width: 700px;
		height:315px;
		background: #FDFDFD;
		border-radius:8px;
		padding: 50px;
	}
	.icls{color: green;}
	.endt{color: green;}
	</style>

  </head>
  
  <body>
    <div class="mainC">
    	<div class="mainTitle">邮箱验证</div>
    	<div class="mainBody">
    		<img alt="yes" width="150" height="150" src="${pageContext.request.contextPath}/images/yes.jpg">
    		<div style="width:450px;height: 400px;float: right;">
	    		<p>恭喜您，注册成功！！欢迎您成为悦书网的会员。</p>
	    		<p>您的账户为：<i class="icls">${session.regName }</i> ,请先登录邮箱激活账户，</p><p>否则无法登录。</p>
	    		<p><i class="endt"></i>  秒后,进入登录界面</p>
    		</div>
    	</div>
    </div>
    
    <script type="text/javascript">
        $(function () {
                var count = 30;
                var countdown = setInterval(CountDown, 1000);

                function CountDown() {
                   $('.endt').text(count);
                    if (count == 0) {
                        clearInterval(countdown);
                        window.location.href = "login.jsp";
                    }
                    count--;
                }

        });
   </script>
    
    
  </body>
</html>
