var BookCategoryManager = function() {
	return {
		addBookCategory : function() {
			$('#addLevel').dialog({
				title : '添加图书类别',
				width : 400,
				height : 300,
				closed : false,
				cache : false,
				modal : true,
				onClose : function() {
				}
			});
		},
		searchBookCategory : function() {
			var level = $('#sel').combobox("getValue");
			console.info(level);
			if (level == Constants.LEVEL_ONE) {
				$('#book_book_category_datagrid').datagrid({
					queryParams : {
						level : level
					}
				});
			} else {
				console.info("llllpp");
				var pid = $('#bookC1').combobox("getValue");
				if (pid == "") {
					$('#book_book_category_datagrid').datagrid({
						queryParams : {
							level : level
						}
					});
				} else {
					$('#book_book_category_datagrid').datagrid({
						queryParams : {
							pid : pid
						}
					});
				}
			}
		},
		saveLevelOne : function() {
			var one = $('#levelOneInput').val();
			if (one == "") {
				return;
			} else {
				$.ajax({
					url : rootPath + 'bookCategoryAction!saveLevel.action',
					data : {
						'cname' : one
					},
					dataType : 'json',
					success : function(res) {
						if (res.success) {
							$.messager.alert({
								title : '保存提示',
								msg : '保存成功！'
							});
							$('#levelOneInput').val("");
						}
					}
				});
			}
		},
		reloadLevelOne : function() {
			$('#bookCategory11').combobox('reload');
		},
		saveLevelTwo : function() {
			var two = $('#levelTwoInput').val();
			var pid = $('#bookCategory11').combobox("getValue");
			if (two == "") {
				return;
			} else {
				$.ajax({
					url : rootPath + 'bookCategoryAction!saveLevel.action',
					data : {
						'cname' : two,
						'pid' : pid
					},
					dataType : 'json',
					success : function(res) {
						if (res.success) {
							$.messager.alert({
								title : '保存提示',
								msg : '保存成功！'
							});
							$('#levelTwoInput').val("");
						}
					}
				});
			}
		}

	}
}();