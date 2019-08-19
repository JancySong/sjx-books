<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
		$(function(){
			$('#admin_index_form').form({
				url : '${pageContext.request.contextPath}/adminAction!login.action',
				dataType:'json',
				success : function(data){
					var $obj = jQuery.parseJSON(data);
					if($obj["success"]){
						$('#admin_index_dialog').dialog('close');
						$('#showAdminName').text($obj["object"]+",");
					}
					$.messager.show({
						title:'登陆提示',
						msg:$obj["message"]
					});
				}
			});
			
		$('#admin_index_form input').on('keyup',function(event){
			if(event.keyCode == 13){
				$('#admin_index_form').submit();
			}
		});
		});
	</script>
<div id="admin_index_dialog" class="easyui-dialog"
	style="width:280px;height:180px;"
	data-options="title:'管理员登陆',closable:false,modal:true,
  	  	 buttons:[{text:'登陆',iconCls:'icon-ok',handler:function(){$('#admin_index_form').submit();}}]">

	<form id="admin_index_form" method="post">
		<s:token/>
		<div class="admin_index_login">
			<input type="text" value="admin" name="username"
				class="adminName easyui-validatebox"
				data-options="required:true,missingMessage:'登录名不能为空'">
		</div>
		<div class="admin_index_login">
			<input type="password" value="123456" name="password"
				class="adminPass easyui-validatebox"
				data-options="required:true,missingMessage:'密码不能为空'">
		</div>
	</form>

	</div>