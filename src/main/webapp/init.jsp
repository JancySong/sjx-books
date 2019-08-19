<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String rootPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
String contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	var jancy = jancy || {};
		jancy.contextPath = '<%=contextPath%>';
		jancy.rootPath = '<%=rootPath%>';
		jancy.imgsServer = '<s:text name="remoteFileServer"/>';
		jancy.imgServerPath = '<s:text name="img.server.path"/>';
</script>
<c:set var="jancy_contextPath" value="<%=contextPath%>"/>
<c:set var="jancy_rootPath" value="<%=rootPath%>"/>
