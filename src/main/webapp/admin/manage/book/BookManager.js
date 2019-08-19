var BookManager = function() {
	editHistroyIndex: 0;
	return {
		search : function() {
			$('#book_book_datagrid').datagrid({
				queryParams : $.jancySong.serializeForm2Object($('#book_book_searchForm'))
			});
		},
		clear : function() {
			$('#book_book_searchForm input').val('');
		},
		showBookCover : function(imgUrl) {
			console.log(imgUrl);
			$('#imgShow').attr({
				'src' : ''
			});
			$('#showBookCover').dialog({
				title : '查看图片',
				width : 500,
				height : 400,
				closed : false,
				cache : false,
				modal : true
			});
			var flag = imgUrl.indexOf("undefined") == -1 ? false : true;
			if (flag) {
				$('#imgShow').attr({
					'src' : rootPath + 'images/nopic.jpg'
				});
			} else {
				console.log(imgUrl);
				$('#imgShow').attr({
					'src' : imgUrl
				});
			}
		},
		addBook : function() {
			$('#addBook').dialog({
				title : '添加图书',
				width : 600,
				height : 430,
				closed : false,
				cache : false,
				modal : true,
				onClose : function() {
					$('#bookInfo').form('load', BookModels.clearModel);
				}
			});
		},
		modifyBook : function() {
			var row = $('#book_book_datagrid').datagrid('getChecked');
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
			$('#addBook').dialog({
				title : '修改图书',
				width : 600,
				height : 430,
				closed : false,
				cache : false,
				modal : true,
				onClose : function() {
					$('#bookInfo').form('load', BookModels.clearModel);
				}
			});
			$('#bookInfo').form('load', row[0]);
		},
		showUploadBookImgPanel : function(bid) {
			$('#uploadBookImgPanel').dialog({
				title : '上传图书全景图',
				width : 760,
				height : 500,
				closed : false,
				cache : false,
				modal : true,
				onClose : function() {
					// $('#addBook').dialog('destroy');
				}
			});
			$('#ida').val(bid);

			var uploader = new plupload.Uploader(
					{
						runtimes : 'html5,html4',
						browse_button : 'addImgsBtn',
						container : document.getElementById('btnContainer'),
						// url : rootPath + 'uploadAction!uploadFile.action?bookId=' + $('#ida').val(),
						url : rootPath + 'uploadAction!uploadFile.action',
						multipart_params : {
							bookId : $('#ida').val()
						},
						// flash_swf_url : '../js/Moxie.swf',
						// silverlight_xap_url : '../js/Moxie.xap',
						filters : {
							max_file_size : '10mb',
							mime_types : [ {
								title : "Image files",
								extensions : "jpg,gif,png"
							} ],
							prevent_duplicates : true
						},

						init : {
							PostInit : function() {
								document.getElementById('filelist').innerHTML = '';

								document.getElementById('uploadImgsBtn').onclick = function() {
									uploader.start();
									return false;
								};
							},

							FilesAdded : function(up, files) {
								plupload.each(files, function(file) {
									previewImage(file, function(imgsrc) {
										$('#imgPrevSrc').attr("src", imgsrc);
									})
									document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' ('
											+ plupload.formatSize(file.size) + ') <b style="width:350px;height:6px;"></b></div>';
								});
							},

							UploadProgress : function(up, file) {
								// document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent +
								// "%</span>";
								document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = "<div style='width:350px'><div style='width:300px;height:5px;border:1px solid gray;float:left;'><div style='background:#0F0;height:5px;width:"
										+ (file.percent)
										* 3
										+ "px;float:left;'></div></div><div style='width:46px;float:left;'>"
										+ file.percent + "%</div></div>";
							},

							Error : function(up, err) {
								document.getElementById('console').appendChild(
										document.createTextNode("\nError #" + err.code + ": " + err.message));
							},

							UploadComplete : function(uploader, files) {
								$.messager.alert({
									title : '上传提示',
									msg : '上传成功！！'
								});
								// document.getElementById('filelist').innerHTML = "";
								// $('#imgPrevSrc').attr("src", "");
							}
						}
					});

			uploader.init();

		},
		bookImgsShow : function(bid) {
			$('#bookImgsShow').dialog({
				title : '图书图片',
				width : 600,
				height : 500,
				closed : false,
				cache : false,
				modal : true
			});
			$('#book_book_imgs_datagrid').datagrid({
				url : rootPath + 'bookImgAction!getBookImgsById.action',
				fit : true,
				/* fitColumns : true, */
				border : false,
				pagination : true,
				singleSelect : true,
				pagePosition : 'bottom',
				idField : 'imgId',
				pageSize : 10,
				pageList : [ 5, 10, 20, 30, 40, 50 ],
				sortName : 'name',
				sortOrder : 'asc',
				queryParams : {
					bid : bid
				},
				/* pagePosition : 'both', */
				checkOnSelect : false,
				selectOnCheck : false,
				frozenColumns : [ [ {
					field : 'imgId',
					title : '编号',
					width : 100,
					checkbox : true
				} ] ],
				columns : [ [ {
					field : 'bid',
					title : '图书id',
					width : 150,
					hidden : true
				}, {
					field : 'imgUrl',
					title : '图片',
					width : 150,
					formatter : function(value, row, index) {
						var imgUrl = "" + jancy.imgServerPath + value + "";
						return "<img src='" + imgUrl + "'alt='' width='150' height='150' />";
					}
				}, {
					field : 'orderBy',
					title : '排序',
					width : 60,
					editor : {
						type : 'numberbox',
						options : {
							min : 1,
							required : true
						}
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
				}, '-' ],
				onDblClickCell : function(index, field, value) {
					// var selectRow = $('#book_book_imgs_datagrid').datagrid('selectRow', BookManager.editHistroyIndex);
					// if (selectRow["orderBy"] == "") {
					// return;
					// }
					$('#book_book_imgs_datagrid').datagrid('endEdit', BookManager.editHistroyIndex);
					if (field == 'orderBy') {
						BookManager.editHistroyIndex = index;
						$('#book_book_imgs_datagrid').datagrid('beginEdit', index);
					}
				}
			});
		},
		saveBookImg : function() {
			$('#book_book_imgs_datagrid').datagrid('endEdit', BookManager.editHistroyIndex);
			var changes = $('#book_book_imgs_datagrid').datagrid('getChanges');
			if (changes.length == 0) {
				$.messager.alert({
					title : '保存提示！！',
					msg : '没有数据修改'
				});
				return;
			}
			var ids = [];
			var orderBys = [];
			for ( var i = 0; i < changes.length; i++) {
				ids.push(changes[i].imgId);
				orderBys.push(changes[i].orderBy);
			}
			$.ajax({
				url : rootPath + 'bookImgAction!orderByImgs.action',
				data : {
					'imgIds' : ids.join(','),
					'orderBys' : orderBys.join(',')
				},
				dataType : 'json',
				success : function(res) {
					if (res.success) {
						$.messager.alert({
							title : '保存提示',
							msg : '保存成功！'
						});
					}
				}
			});

		},
		saveBook : function() {
			var flag = $('#bookInfo').form('validate');
			if (!flag) {
				$.messager.alert({
					title : '保存提示',
					msg : '请填写完必填项再保存！！'
				});
				return;
			}
			var params = $('#bookInfo').serialize();
			$.ajax({
				url : rootPath + 'bookBaseInfoAction!saveBook.action',
				method : 'post',
				data : params,
				dataType : 'json',
				success : function(result) {
					if (result.success) {
						$.messager.alert({
							title : '保存提示',
							msg : '保存成功！！'
						});
						$('#bookInfo input').val('');
						$('.clearInfo').val("");
					} else {
						$.messager.alert({
							title : '保存提示',
							msg : '保存失败！！'
						});
					}
				}
			});
		},
		uploadCover : function(bid) {
			$('#uploadBookCoverPanel').dialog({
				title : '上传图书封面',
				width : 600,
				height : 500,
				closed : false,
				cache : false,
				modal : true,
				onClose : function() {
				}
			});
			$('#idOfCover').val(bid);

			var uploader = new plupload.Uploader(
					{
						runtimes : 'html5,html4',
						browse_button : 'addCoverBtn',
						container : document.getElementById('btnCoverContainer'),
						// url : rootPath + 'bookBaseInfoAction!uploadCoverImg.action?bid=' + $('#idOfCover').val(),
						url : rootPath + 'bookBaseInfoAction!uploadCoverImg.action',
						multipart_params : {
							bid : $('#idOfCover').val()
						},
						// flash_swf_url : '../js/Moxie.swf',
						// silverlight_xap_url : '../js/Moxie.xap',
						filters : {
							max_file_size : '100mb',
							mime_types : [ {
								title : "Image files",
								extensions : "jpg,gif,png"
							}, {
								title : "Zip files",
								extensions : "zip"
							} ],
							prevent_duplicates : true
						},

						init : {
							PostInit : function() {
								document.getElementById('coverfile').innerHTML = '';

								document.getElementById('uploadCoverBtn').onclick = function() {
									uploader.start();
									return false;
								};
							},

							FilesAdded : function(up, files) {
								up.files = files;
								plupload.each(files, function(file) {
									previewImage(file, function(imgsrc) {
										$('#imgSrc').attr("src", imgsrc);
									})
									document.getElementById('coverfile').innerHTML = '<div id="' + file.id + '">' + file.name + ' ('
											+ plupload.formatSize(file.size) + ') <b></b></div>';
								});
							},

							UploadProgress : function(up, file) {
								console.log(up);
								// document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent +
								// "%</span>";
								document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = "<div style='width:330px'><div style='width:300px;height:5px;border:1px solid gray;float:left;'><div style='background:#0F0;height:5px;width:"
										+ (file.percent)
										* 3
										+ "px;float:left;'></div></div><div style='width:28px;float:left;'>"
										+ file.percent + "%</div></div>";
							},

							Error : function(up, err) {
								document.getElementById('console').appendChild(
										document.createTextNode("\nError #" + err.code + ": " + err.message));
							},

							UploadComplete : function(uploader, files) {
								$.messager.alert({
									title : '上传提示',
									msg : '上传成功！！'
								});
								// document.getElementById('coverfile').innerHTML = "";
								// $('#imgSrc').attr("src", "");
							}
						}
					});

			uploader.init();
		},
		deleteBookImg : function() {
			var rows = $('#book_book_imgs_datagrid').datagrid('getChecked');
			if (rows.length == 0) {
				$.messager.alert({
					title : '删除提示',
					msg : '请勾选记录！！'
				});
				return;
			}
			$.messager.confirm("删除提示", "你确定要删除吗??", function(flag) {
				if (!flag) {
					return;
				} else {

					var ids = [];
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i]['imgId']);
					}
					console.log(ids);
					$.ajax({
						url : rootPath + 'bookImgAction!deleteImgsByIds.action',
						method : 'post',
						data : 'imgIds=' + ids,
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$.messager.alert({
									title : '删除提示',
									msg : '删除成功！！'
								});
								$('#book_book_imgs_datagrid').datagrid('reload');
							} else {
								$.messager.alert({
									title : '删除提示',
									msg : '删除失败！！'
								});
							}
						}
					});
				}
			});

		},
		upload : function() {
			var fileFlag = false;
			$(".upFileImg[name='image']").each(function() {
				if ($(this).val() != "") {
					fileFlag = true;
					return false;
				}
			});
			var ob = $(".upFileImg[name='image']");
			console.log(ob);
			console.log("ob>>>>>>>>>>>>");
			console.log($('#fileImgs').serializeAll());
			console.log("KKK<<<<<<<<<<");
			console.log($("#fileImgs").formSerialize());
			if (!fileFlag) {
				$.messager.alert({
					title : '上传提示',
					msg : '请先选择好文件在上传！！'
				});
				return;
			}
			var options = {
				url : rootPath + 'uploadAction!uploadFile.action',
				method : 'post',
				contentType : false,
				success : function(result) {
					console.log(result);
				}
			};
			// $('#fileImgs').ajaxsubmit(options);
			// $.ajax({
			// url : rootPath + 'uploadAction!uploadFile.action',
			// data : $('#fileImgs').serializeAll(),
			// method : 'post',
			// contentType : false,
			// success : function(result) {
			// console.log(result);
			// }
			// });
			// $('#fileImgs').submit();
			// $('#fileImgs').ajax({
			// dataType : 'json',
			// success : function(result) {
			// console.log(result);
			// }
			// });
		}

	}
}();