var AdminManager = function() {
	return {
		search : function() {
			$('#admin_admin_datagrid').datagrid('reload');
		},
		showPanel : function() {
			$('#addAdminPanel').dialog({
				title : '新增管理员',
				width : 400,
				height : 230,
				closed : false,
				cache : false,
				modal : true
			});
		},
		saveAdmin : function() {
			var flag = $('#adminFormInfo').form('validate');
			if (!flag) {
				$.messager.alert({
					title : '保存提示',
					msg : '请填写完必填项再保存！！'
				});
				return;
			}
			var params = $.jancySong.serializeForm2Object($('#adminFormInfo'));
			$.ajax({
				url : rootPath + 'adminAction!saveAdmin.action',
				method : 'post',
				data : params,
				dataType : 'json',
				success : function(result) {
					if (result.success) {
						$.messager.alert({
							title : '保存提示',
							msg : '保存成功！！'
						});
						AdminManager.search();
						$('#addAdminPanel').dialog('close');
						$('#adminFormInfo').form('load', {
							"username" : "",
							"password" : ""
						});
					} else {
						$.messager.alert({
							title : '保存提示',
							msg : '保存失败！！'
						});
					}
				}
			});
		}

	}
}();