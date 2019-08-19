<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>管理员首页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/lg_yun1.png">

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.3/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" type="text/css"></link>
  
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sjx-icon/sjx_icon.css" type="text/css"></link>
  
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-plugins/sjx-plugins.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-utils.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts/esl.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sjx-chart-plugin.js"></script>
  	<!-- -->
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
  	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plupload.full.min.js"></script>
   
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sjx-icon.css" type="text/css"></link>
  	
	<style type="text/css">
		.admin_index_login{margin-top:8px;height:40px;line-height:40px;}
		.admin_index_login input{height:33px;width:223px;padding-left:15%;border:1px #CCC solid;background-size:26px 26px;}
		.loginAndLogout{height: 100%;float: right;width:400px;text-align: right;line-height: 50px;padding-right:10px;}
		.logoInfo{width:260px;height: 100%;float: left;background-size:260px 60px;}
		.bg-cls{background: #EEE}
	</style>
	
	<script type="text/javascript">
		$.jancySong.imgsServer = '<s:text name="remoteFileServer"/>';
		function addTab(options){
			var tab = $('#admin_index_tabs');
			if(tab.tabs('exists',options.title)){
				tab.tabs('select',options.title);
			}else{
				tab.tabs('add',options);
			}
		}
	</script>
  
  </head>
  
  <body class="easyui-layout">
  <jsp:include page="../init.jsp"></jsp:include>
  <!-- 
  	<div class="easyui-layout" style="height:850px;width:100%;">
  	 -->
  	
  	<div data-options="region:'north',height:60">
  		<div class="easyui-panel bg-cls" data-options="border:false,fit:true">
  			<div class="logoInfo icon-logo"></div>
  			<div class="loginAndLogout">
  				<span id="showAdminName">
  				<c:if test="${session.adminName!=null}">${session.adminName },</c:if>
  				</span>
  				欢迎使用悦书后台管理系统
	  			<a href="${pageContext.request.contextPath}/adminAction!logout.action" class="easyui-linkbutton" data-options="iconCls:'icon-logout'">logout</a>
  			</div>
  		</div>
  	</div>
  	
	<div data-options="region:'west',title:'菜单导航栏'" style="height:300px;width:180px;">
		<div class="easyui-panel" data-options="fit:true,border:false">
		
			<ul class="easyui-tree" data-options="url:'data/nav.json',
				method:'get',
				animate:true,
				lines:true,
				onClick:function(node){
					var url = '${pageContext.request.contextPath}'+node.attributes.url;
					addTab({
						title:node.text,
						href:url,
						closable:true
					});
			}"></ul>
		</div>
	</div>

  	<div data-options="region:'center'">
  	
  		<div id="admin_index_tabs" class="easyui-tabs" data-options="border:false,fit:true">
  			<div title="首页">
				<div id="_bookChartContainer" style="width: 600px;height:440px;border:1px solid #BBB;float:left;margin:2px;"></div>
			</div>
  		</div>
  	
  	</div>
    <!-- 
	<div data-options="region:'east',title:'广告栏'" style="height:300px;width:100px;"></div>
	 -->
    <div data-options="region:'south',height:30">
    	<div class="easyui-panel" data-options="border:false,fit:true" style="background:#E0ECFF;font-weight:500;text-align:center;line-height:28px;">
    		版权  copyRight 2515452324@qq.com  宋建熙  (  如有问题请联系我)
    	</div>
    </div>
  	
  	<c:if test="${session.aid==null }">
		<jsp:include page="login.jsp"></jsp:include>
  	</c:if>
  	
  	<!-- 
  	</div>
  	 -->
  	 <script type="text/javascript">
var loadData = function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/chartAction!bookChart.action',
		dataType:'json',
		success:function(result){
			$('#_bookChartContainer').SjxChartShow({
				type:"pie",
				data:result,
				title:"销售量前十情况",
				subTitle:""
			});
		}
	});  
};
$(function($) {
		loadData();
		setInterval("loadData()",1000*60*5);
});
</script>
  	 <script type="text/javascript">
	  	$('#admin_index_tabs').tabs({
	  		onBeforeClose: function(title,index){
				  if(title == "订单数据趋势"){
					  clearInterval(chart);
					  clearInterval(chartGroup);
				  }else if(title == "图书销售量走势"){
					  clearInterval(bookCart);
				  }
			  }
		});
  	 </script>
  </body>
</html>
