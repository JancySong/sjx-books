var UserManager = function() {
	return {
		search : function() {
			$('#user_user_datagrid').datagrid({
				queryParams : $.jancySong.serializeForm2Object($('#user_user_searchForm'))
			});
		},
		clear : function() {
			$('#user_user_searchForm input').val('');
		}
	}
}();