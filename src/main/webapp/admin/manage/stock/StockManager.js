var StockManager = function() {
	return {
		search : function() {
			$('#stock_book_stock_datagrid').datagrid({
				queryParams : $.jancySong.serializeForm2Object($('#stock_book_stockr_searchForm'))
			});
		},
		clear : function() {
			var stock = {
				bookName : '',
				author : '',
				bookStockFrom : '',
				bookStockTo : ''
			};
			// $('#stock_book_stockr_searchForm input').val('');
			$('#stock_book_stockr_searchForm').form('load', stock);
		},
		adjustStock : function() {
			var row = $('#stock_book_stock_datagrid').datagrid('getChecked');
			if (row.length == 0) {
				$.messager.alert({
					title : '修改提示',
					msg : '请勾选记录！！'
				});
				return;
			}
			if (row.length > 1) {
				$.messager.alert({
					title : '修改提示',
					msg : '每次只能修改一条记录！！'
				});
				return;
			}
			$('#adjustStockPanel').dialog({
				title : '库存调整',
				width : 480,
				height : 260,
				closed : false,
				cache : false,
				modal : true
			});
			$('#adjustStockForm').form('load', row[0]);
		},
		saveBookStock : function() {
			var params = $.jancySong.serializeForm2Object($('#adjustStockForm'));
			$.ajax({
				url : rootPath + 'bookStockAction!updateBookStock.action',
				method : 'post',
				data : params,
				dataType : 'json',
				success : function(result) {
					if (result.success) {
						$.messager.alert({
							title : '保存提示',
							msg : '保存成功！！'
						});
						$('#adjustStockPanel').dialog('close');
						StockManager.search();
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
