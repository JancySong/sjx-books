var OrderManage = function() {
	return {
		distribution : function() {
			var rows = $('#order_order_search_datagrid').datagrid('getChecked');
			if (rows.length == 0) {
				$.messager.alert({
					title : '配货提示',
					msg : '请勾选要配货的记录！！'
				});
				return;
			}
			var notIds = [];
			var ids = [];
			for ( var i = 0; i < rows.length; i++) {
				if (rows[i]['status'] == Constants.ORDER_CONFIRMED) {
					ids.push(rows[i]['orderId']);
				} else {
					notIds.push(rows[i]['orderId']);
				}
			}
			if (notIds.length != 0) {
				$.messager.alert({
					title : '配货提示',
					msg : '记录中含有不是已确认状态不能配货,请正确勾选记录！！'
				});
				return;
			}
			$.messager.confirm('配货提示', '确定要配货吗??', function(flag) {
				if (flag) {
					$.ajax({
						url : rootPath + 'bookOrderAction!updateStatus.action',
						data : {
							'orderIds' : ids.join(","),
							'status' : Constants.ORDER_DISTRIBUTOIN
						},
						dataType : 'json',
						method : 'post',
						success : function(result) {
							if (result.success) {
								$.messager.alert({
									title : '配货提示',
									msg : '配货成功！！'
								});
								$('#order_order_search_datagrid').datagrid('reload');
								$("#order_order_search_datagrid").datagrid('clearSelections').datagrid('clearChecked');
							} else {
								$.messager.alert({
									title : '配货提示',
									msg : '配货失败！！'
								});
							}
						}
					});
				}
			});

		},
		shipped : function() {
			var rows = $('#order_order_search_datagrid').datagrid('getChecked');
			if (rows.length == 0) {
				$.messager.alert({
					title : '发货提示',
					msg : '请勾选要发货的记录！！'
				});
				return;
			}
			var notIds = [];
			var ids = [];
			for ( var i = 0; i < rows.length; i++) {
				if (rows[i]['status'] == Constants.ORDER_DISTRIBUTOIN) {
					ids.push(rows[i]['orderId']);
				} else {
					notIds.push(rows[i]['orderId']);
				}
			}
			if (notIds.length != 0) {
				$.messager.alert({
					title : '发货提示',
					msg : '记录中含有不是已配货状态不能发货,请正确勾选记录！！'
				});
				return;
			}
			$.messager.confirm('发货提示', '确定要发货吗??', function(flag) {
				if (flag) {
					$.ajax({
						url : rootPath + 'bookOrderAction!updateStatus.action',
						data : {
							'orderIds' : ids.join(","),
							'status' : Constants.ORDER_SHIPPED
						},
						dataType : 'json',
						method : 'post',
						success : function(result) {
							if (result.success) {
								$.messager.alert({
									title : '发货提示',
									msg : '发货成功！！'
								});
								$('#order_order_search_datagrid').datagrid('reload');
								$("#order_order_search_datagrid").datagrid('clearSelections').datagrid('clearChecked');
							} else {
								$.messager.alert({
									title : '发货提示',
									msg : '发货失败！！'
								});
							}
						}
					});
				}
			});
		},
		showDetails : function(orderId) {
			$('#bookOrderDetailShow').dialog({
				title : '订单详细信息',
				width : 520,
				height : 400,
				closed : false,
				cache : false,
				modal : true
			});
			$('#order_order_show_details').datagrid({
				url : rootPath + 'bookOrderItemAction!getBookOrderItemByOrderId.action',
				fit : true,
				border : false,
				pagination : true,
				singleSelect : true,
				pagePosition : 'bottom',
				idField : 'orderItemId',
				pageSize : 10,
				pageList : [ 5, 10, 20, 30, 40, 50 ],
				sortName : 'name',
				sortOrder : 'asc',
				queryParams : {
					orderId : orderId
				},
				checkOnSelect : false,
				selectOnCheck : false,
				frozenColumns : [ [ {
					field : 'orderItemId',
					title : '编号',
					width : 100,
					checkbox : true
				} ] ],
				columns : [ [ {
					field : 'bookName',
					title : '书名',
					width : 150
				}, {
					field : 'price',
					title : '单价',
					width : 60
				}, {
					field : 'quantity',
					title : '数量',
					width : 60
				}, {
					field : 'total',
					title : '小计',
					width : 80,
					formatter : function(value, row, index) {
						var price = parseFloat(row.price);
						var quantity = parseFloat(row.quantity);
						return price * quantity;
					}
				} ] ],
				toolbar : [ {
					text : '保存',
					iconCls : 'icon-save',
					handler : function() {
						BookManager.saveBookImg();
					}
				}, '-', {
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						BookManager.deleteBookImg();
					}
				}, '-' ]
			});
		},
		searchOrder : function() {
			var flag = $('#order_order_search_condition_form').form('validate');
			if (!flag) {
				$.messager.alert({
					title : '提示',
					msg : '请选择时间'
				});
				return;
			}
			var condition = $.jancySong.serializeForm2Object($('#order_order_search_condition_form'));
			$('#order_order_search_datagrid').datagrid({
				queryParams : condition
			});
		}

	}
}();