<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    
    <title>新用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_reg.css" type="text/css"></link>
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-plugins/sjx-plugins.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/sjx-plugins/checkpwd/check_pwd.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-plugins/checkpwd/sjx-check-pwd.js"></script>
	<style type="text/css">
	#showCode{cursor: pointer;}
	</style>
	

  </head>
  
  <body>
  
  	<div id="user_reg_top"></div>
  	<div id="user_reg_main">
  	
  	<div class="new_user_reg">新用户注册</div>
  	
  	<div class="new_user_title">
  		<div class="new_user_title title">用户名:</div>
  		<div class="new_user_title title">密码:</div>
  		<div class="new_user_title title">确认密码:</div>
  		<div class="new_user_title title">邮箱:</div>
  		<div class="new_user_title title">验证码:</div>
  	</div>
  	<div class="new_user_input">
  		<form action="${pageContext.request.contextPath}/userAction!regist.action" method="post" onsubmit="return checkRegForm()">
  		<s:token/>
  		<input class="new_user_input inName" type="text" name="username" value="${username }">
  		<input class="new_user_input inPass" type="password" name="password">
  		<input class="new_user_input confPass" type="password" name="comfirmPassWord">
  		<input type="text" name="email" value="${email }">
  		<input type="text" name="verifyCode">
  		<input class="new_user_input submit" type="submit" value="立  即  注  册">
  		</form>
  	</div>
  	<div class="new_user_error">
  		<div class="new_user_error err"><span class="new_user_error err nameErr"></span></div>
  		<div class="new_user_error err checkpass"><span></span></div>
  		<div class="new_user_error err"><span class="new_user_error err passErr"></span></div>
  		<div class="new_user_error err"><span></span></div>
  		<div class="new_user_error err"><img id="showCode" alt="" width="100px" height="33px" src="${pageContext.request.contextPath}/verifyCodeAction!newVerifyCode.action"><span></span></div>
  	</div>
  	
  	</div>
  	<c:choose>
  		<c:when test="${msg!=null&&msg!='' }">
  			<script type="text/javascript">
  				alert('${msg}');
  			</script>
  		</c:when>
  	</c:choose>
  	
  	<jsp:include page="layout/footer.jsp"></jsp:include>
  	
  	<%--<div id="user_reg_bottom"></div>
  	
  	--%><script type="text/javascript">
  	
  	var userName_flag = false;
  	function checkRegForm(){
  		if(!userName_flag){
  			return false;
  		}
  	}
  	$(function(){
  		$(".new_user_input .inName").on("blur",function(){
  			var name = $(".new_user_input .inName").val();
  			if(name==""){
  				$(".new_user_error .err .nameErr").css("color","#E22");
  				$(".new_user_error .err .nameErr").css("background","url('${pageContext.request.contextPath}/images/tip.png') 0px -23px no-repeat");
  				$(".new_user_error .err .nameErr").text("用户名不能为空");
  			}else{
  				$.ajax({
  					type:'post',
  					url:'${pageContext.request.contextPath}/userAction!isExistUserName.action',
  					data:$(this).serialize(),
  					dataType:'json',
  					success:function(data){
  						var flag = data.success;
  						if(flag=="true"||flag==true){
  							$(".new_user_error .err .nameErr").css("color","#E22");
  							$(".new_user_error .err .nameErr").css("background","url('${pageContext.request.contextPath}/images/tip.png') 0px -23px no-repeat");
  							$(".new_user_error .err .nameErr").text("该用户名已被注册");
  							userName_flag = false;
  						}else{
  							$(".new_user_error .err .nameErr").css("color","#3D3");
  							$(".new_user_error .err .nameErr").css("background","url('${pageContext.request.contextPath}/images/tip.png') no-repeat");
  							$(".new_user_error .err .nameErr").text("该用户名可用");
  							userName_flag = true;
  						}
  							
  					}
  				});
  			}
  		});
  		
		$("#showCode").on("click",function(){
			$("#showCode").attr("src","${pageContext.request.contextPath}/verifyCodeAction!newVerifyCode.action?random="+Math.random());
		});
		
	  	var ck_flag = true;
		$(".new_user_input .inPass").on("keyup",function(){
			if(ck_flag){
				$(this).sjx_check_pwd({
		            sjx_check_show:".new_user_error .checkpass"
		    	});
				ck_flag = false;
			}
			if($(this).val()==""){
				$(".new_user_error .checkpass").html("<span style='font-weight: 500;'>密码不能为空！！！</span>");
				ck_flag = true;
			}
		});

		$(".new_user_input .inPass").on("blur",function(){
			if($(this).val()==""){
				$(".new_user_error .checkpass").html("<span style='font-weight: 500;'>密码不能为空！！！</span>").end().addClass(".new_user_error .err .passErr");
			}
		});
  		
  		
  		$(".new_user_input .confPass").on("blur",function(){
  			var pass = $(".new_user_input .inPass").val();
  			var confPass = $(this).val();
  			if(pass!=confPass){
  				$(".new_user_error .err .passErr").css("color","#E22");
				$(".new_user_error .err .passErr").css("background","url('${pageContext.request.contextPath}/images/tip.png') 0px -23px no-repeat");
				$(".new_user_error .err .passErr").text("两次密码不一致！！！");
  			}else if(pass!=""&&confPass!=""&&pass==confPass){
  				$(".new_user_error .err .passErr").css("color","#3D3");
				$(".new_user_error .err .passErr").css("background","url('${pageContext.request.contextPath}/images/tip.png') no-repeat");
				$(".new_user_error .err .passErr").text("密码一致。");
  			}
  		});
  		
  		
  		
  		


  		
  		
  	});
  	</script>
   
  </body>
</html>


















