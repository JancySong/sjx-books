<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>

		<title>用户登陆</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="author" content="宋建熙">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_login.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-plugins/sjx-plugins.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/JancyMsgBox.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/JancyMsgBox.css">
	
	</head>

	<body>
	
	<div id="login_top"></div>
	<div id="login_body">
		<div id="login_show_ad"></div>
		<div class="login_user">
			<form action="${pageContext.request.contextPath}/userAction!login.action" method="post" onsubmit="return checkSubmit()">
			<s:token/>
			<div class="login_user comm"></div>
			<div class="login_user comm"></div>
			<div class="login_user comm">
				<input class="login_user comm userName" type="text" name="username" value="${username }">
			</div>
			<div class="login_user tip"><span class="login_user tip u">请输入用户名</span></div>
			
			<div class="login_user comm">
				<input class="login_user comm userPass" type="password" name="password" value="${password }">
			</div>
			<div class="login_user tip"><span class="login_user tip p">请输入密码</span></div>
			<div class="login_user comm">
				<input class="login_user comm incode" type="text" name="verifyCode" value="${verifyCode }">
				<div class="login_user comm showcode">
						<img alt="" width="100px" height="33px" src="${pageContext.request.contextPath}/verifyCodeAction!newVerifyCode.action">
				</div>
			</div>
			<div class="login_user tip"><span class="login_user tip c">请输入验证码</span></div>
			<div class="login_user comm">
				<input class="login_user comm submit" type="submit" value="登	&nbsp;	陆">
				<div class="login_user comm reg">立即注册</div>
			</div>
			</form>
		</div>
	</div>
	<div id="login_bottom"></div>
	<c:choose>
  		<c:when test="${msg!=null&&msg!='' }">
  			<script type="text/javascript">
  			$(function(){
  				$.jancyMsgBox.alert({
  					title:'我的提示',
  					msg:'${msg}'
  				});
  			});
  			</script>
  		</c:when>
  	</c:choose>
		
		<script type="text/javascript">
		
		function checkSubmit(){
			var name = $(".login_user .comm .userName").val();
			var pass = $(".login_user .comm .userPass").val();
			var code = $(".login_user .comm .incode").val();
			if(name.trim()==""||name=="用户名"){
				return false;
			}
			if(pass.trim()==""||pass=="密码"){
				return false;
			}
			if(code.trim()==""||code=="验证码"){
				return false;
			}
		}
		
		
		
			$(function(){
				
				//$(".login_user .comm .userName").val("用户名");
				$(".login_user .comm .userName").val("admin");
				$(".login_user .comm .userName").sjx_focus_Clear();
				$(".login_user .comm .userName").sjx_blur_Show();
				
				//$(".login_user .comm .userPass").val("密码");
				$(".login_user .comm .userPass").val("123456");
				$(".login_user .comm .userPass").attr("type","text");
				$(".login_user .comm .userPass").sjx_focus_Clear({
					sjx_equalValue:"密码",
					sjx_hideErrorTips:".login_user .tip .p",
					sjx_inType:"password"
				});
				$(".login_user .comm .userPass").sjx_blur_Show({
					sjx_not_equalValue:"密码",
					sjx_hideErrorTips:".login_user .tip .p",
				});
				
				$(".login_user .comm .incode").sjx_focus_Clear({
					sjx_equalValue:"验证码",
					sjx_hideErrorTips:".login_user .tip .c",
				});
				$(".login_user .comm .incode").sjx_blur_Show({
					sjx_not_equalValue:"验证码",
					sjx_hideErrorTips:".login_user .tip .c",
				});
				
				
				
				$(".login_user .comm .reg").click(function(){
					window.location="reg.jsp";
				});
				
				
				
				/*
				$(".login_user .comm .userName").on("focus",function(){
		  			var name = $(this).val();
		  			if(name=="用户名"){
		  				$(this).val("");
		  				$(this).css("color","black");
		  				$(".login_user .tip .u").css("display","none");
		  			}
		  		});
				*/
				/*
				$(".login_user .comm .userName").on("blur",function(){
		  			var name = $(this).val();
		  			if(name==""){
		  				$(this).val("用户名");
		  				$(this).css("color","gray");
		  				$(this).css("border","1px gray solid");
		  				$(".login_user .tip .u").css("display","block");
		  			}else if(name!=""||name!="用户名"){
		  				$(this).css("border","1px #0a3 solid");
		  			}
		  		});
				*/
				/*
				$(".login_user .comm .userPass").on("focus",function(){
		  			var pass = $(this).val();
		  			if(pass=="密码"){
		  				$(this).attr("type","password");
		  				$(this).val("");
		  				$(this).css("color","black");
		  				$(".login_user .tip .p").css("display","none");
		  			}
		  		});
				*/
				/*
				$(".login_user .comm .userPass").on("blur",function(){
		  			var pass = $(this).val();
		  			if(pass==""){
		  				$(this).attr("type","text");
		  				$(this).val("密码");
		  				$(this).css("color","gray");
		  				$(this).css("border","1px gray solid");
		  				$(".login_user .tip .p").css("display","block");
		  			}else if(pass!=""||pass!="密码"){
		  				$(this).css("border","1px #0a3 solid");
		  			}
		  		});
				*/
				/*
				$(".login_user .comm .incode").on("focus",function(){
		  			var code = $(this).val();
		  			if(code=="验证码"){
		  				$(this).val("");
		  				$(this).css("color","black");
		  				$(".login_user .tip .c").css("display","none");
		  			}
		  		});
				*/
				/*
				$(".login_user .comm .incode").on("blur",function(){
		  			var code = $(this).val();
		  			if(code==""){
		  				$(this).val("验证码");
		  				$(this).css("color","gray");
		  				$(this).css("border","1px gray solid");
		  				$(".login_user .tip .c").css("display","block");
		  			}else if(code!=""||code!="验证码"){
		  				$(this).css("border","1px #0a3 solid");
		  			}
		  		});
				*/
				
				
				$(".login_user .comm .showcode").on("click",function(){
					$(".login_user .comm .showcode img").attr("src","${pageContext.request.contextPath}/verifyCodeAction!newVerifyCode.action?random="+Math.random());
				});
				
				
				
			});
		</script>

	</body>
</html>
