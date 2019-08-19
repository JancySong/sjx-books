<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var rootPath = '${pageContext.request.contextPath}/';
$('#book_book_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/bookBaseInfoAction!findBooksByCondition.action',
	fit : true,
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'bid',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : false,
	selectOnCheck : false,
	frozenColumns : [ [ {
		field : 'bid',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'bookName',
		title : '书名',
		width : 100,
		sortable : true,
		formatter : function(value, row, index) {
			return '<span title="'+value+'">'+value+'</span>';
		}
	} ] ],
	columns : [ [ {
		field : 'author',
		title : '作者',
		width : 100
	},{
		field : 'bookType',
		title : '类型',
		width : 100
	}, {
		field : 'price',
		title : '价格',
		width : 60,
		sortable : true
	}, {
		field : 'totalPages',
		title : '总页数',
		width : 50,
		sortable : true
	}, {
		field : 'publishDate',
		title : '出版时间',
		width : 125,
		sortable : true
	}, {
		field : 'press',
		title : '出版社',
		width : 130,
		sortable : true
	} , {
		field : 'coverImage',
		title : '封面图',
		width : 120,
		formatter : function(value, row, index) {
			var imgUrl = jancy.imgServerPath + value;
			var res = "<a href='javascript:void(0)' onclick='BookManager.uploadCover("+"\""+row.bid+"\""+")'>上传</a>&nbsp;&nbsp;";
			res += "<a href='javascript:void(0)' onclick='BookManager.showBookCover("+"\""+imgUrl+"\""+")'>查看封面</a>";
			return res;
		}
	}, {
		field : 'introduction',
		title : '简介',
		width : 130,
		formatter : function(value, row, index) {
			if( value == "" || typeof(value) == 'undefined'){
				return "<span>暂无简介</span>";
			}
			return "<span title='"+value+"'>"+value+"</span>";
		}
	}, {
		field : 'book',
		title : '图书全视角图',
		width : 120,
		formatter : function(value, row, index) {
			var res = "<a href='javascript:void(0)' onclick='BookManager.showUploadBookImgPanel("+"\""+row.bid+"\""+")'>上传</a>";
			res+="<span style='width:50px'>&nbsp;&nbsp;</span><a href='javascript:void(0)' class='easyui-linkbutton' data-options='iconCls:\'icon-search\'' onclick='BookManager.bookImgsShow("+"\""+row.bid+"\""+")'>查看图片</a>"
			return res;
		}
	}   ] ],
	toolbar : [ {
		text : '增加',
		iconCls : 'icon-add',
		handler : function() {
			BookManager.addBook();
		}
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
		}
	}, '-', {
		text : '修改',
		iconCls : 'icon-edit',
		handler : function() {
			BookManager.modifyBook();
		}
	}, '-' ]
});

$('#bookCategory1').combobox({
    url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategory.action',
    valueField:'value',
    textField:'name',
    onChange:function(n,o){
    	
    	console.info(n);
		console.info(o);
    	
    	var myOptValue = $("#bookCategory1").combobox("getValue");
    	$("#bookCategory2").combobox("destroy");
    	$('#categ').append("<input id='bookCategory2' name='cid2'>");
    	$("#bookCategory2").combobox({
    		 url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategory.action?pid='+myOptValue,
    		 valueField:'value',
    		 textField:'name',
    		 onLoadSuccess:function(){
    			 var data = $('#bookCategory2').combobox('getData');
    			 if(data.length==0){
    				 $("#bookCategory2").combobox("destroy");
    			 }else{
	    			 $("#bookCategory2").combobox('select',data[0].value);
    			 }
    			 $.ajax({
    				 url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategoryById.action',
    				 data:$('#bookInfo').serialize(),
    				 success:function(data){
    					 
    				 }
    			 });
    		}
    	});
    }
});
$("#bookCategory2").combobox({
	 url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategory.action?pid=2',
	 valueField:'value',
	 textField:'name',
	 onLoadSuccess:function(){
		 var data = $('#bookCategory2').combobox('getData');
		 if(data.length==0){
			 $("#bookCategory2").combobox("destroy");
		 }else{
			 $("#bookCategory2").combobox('select',data[0].value);
		 }
	}
});
$('#totalPage').numberspinner({
    min: 1,
    max: 9999
});
$('#price').numberbox({
    min:0,
    precision:2
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/book/BookManager.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/book/bookModel.js"></script>
<div id="book_book_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:100,hidden:true">
		<form id="book_book_searchForm">
			<div style="margin-top:5px;height:25px;">
				<div style="width:260px;float:left;text-align:right;">
					书名：<input class="easyui-textbox" name="bookName" /> 
				</div>
				<div style="width:260px;float:left;text-align:right;">
					作者：<input class="easyui-textbox" name="author" />
				</div>
				<div style="width:260px;float:left;text-align:right;">
					出版社：<input class="easyui-textbox" name="press" />
				</div>
			</div>
			<div style="margin-top:5px;height:25px;">
				<div style="width:260px;float:left;text-align:right;">
					出版时间从：<input id="publishDateFrom" class="easyui-datebox" name="publishDateFrom" />
				</div>
				<div style="width:260px;float:left;text-align:right;">
					出版时间到：<input id="publishDateTo" class="easyui-datebox" name="publishDateTo" />
				</div>
				<div style="width:260px;float:left;text-align:right;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="BookManager.search()">查询</a> 
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'sjx-icon-trash'" onclick="BookManager.clear()">清空</a>
				</div>
			</div>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="book_book_datagrid"></table>
	</div>
</div>
<div id="showBookCover">
	<div style="width:90%;height:90%;text-align:center;line-height:500px;">
		<img id="imgShow" width="300" height="300" src="" alt="图片信息"/>
	</div>
</div>
<style>
<!--
 .alignCls{width:550px;clear: both;margin:5px 0;height:30px;}
 .labelCls{width:80px;margin-left:80px;float:left;}
 .inCls{width:370px;float:right;}
 #addBook{padding-top:20px;}
 .cssImg{width:100%;height:41px;}
-->
</style>
<div id="addBook">
	<form id="bookInfo">
		<input type="hidden" name="bid" />
	<div id="bookCategoryPanle" class="alignCls">
		<div class="labelCls">
	        <label for="name">类别:</label>
		</div>
		<div class="inCls" id="categ">
	        <input id="bookCategory1" name="cid" value="2">
	        <input id="bookCategory2" name="cid2">
		</div>
    </div>
	<div class="alignCls">
		<div class="labelCls">
        	<label for="name">书名:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-textbox clearInfo" type="text" name="bookName" data-options="required:true" />
        </div>
    </div>
    <div class="alignCls">
	    <div class="labelCls">
	        <label for="name">作者:</label>
	    </div>
	    <div class="inCls">
	        <input class="easyui-textbox clearInfo" type="text" name="author" data-options="required:true" />
	    </div>
    </div>
    <div class="alignCls">
    	<div class="labelCls">
	        <label for="name">价格:</label>
    	</div>
    	<div class="inCls">
	        <input id="price" class="easyui-numberbox clearInfo" type="text" name="price" data-options="required:true" />
    	</div>
    </div>
    <div class="alignCls">
	    <div class="labelCls">
	        <label for="name">页数:</label>
	    </div>
	    <div class="inCls">
	        <input id="totalPage" class="easyui-numberspinner clearInfo" type="text" name="totalPages" data-options="required:true" />
	    </div>
    </div>
     <div class="alignCls">
	    <div class="labelCls">
	        <label for="name">出版社:</label>
	    </div>
	    <div class="inCls">
	        <input class="easyui-textbox clearInfo" type="text" name="press" data-options="required:true" />
	    </div>
    </div>
    <div class="alignCls">
	    <div class="labelCls">
	        <label for="name">出版时间:</label>
	    </div>
	    <div class="inCls">
	        <input class="easyui-datebox clearInfo" type="text" name="publishDate" data-options="required:true" />
	    </div>
    </div>
    <div class="alignCls">
	    <div class="labelCls">
	        <label for="name">简介:</label>
	    </div>
	    <div class="inCls">
	        <textarea class="clearInfo" name="introduction" rows="5" cols="45"></textarea>
	    </div>
    </div>
    
    </form>
   <div class="alignCls">
	    <div class="labelCls">
	    	<label></label>
	    </div>
	    <div class="inCls">
		    <a id="saveBookBaseInfo" href="javascript:BookManager.saveBook()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	    </div>
    </div>
</div>

	<div id="uploadBookImgPanel">
	<div style="width:200px;float:left;">
		<form id="fileImgs"  method ="post" enctype ="multipart/form-data">
			<input id="ida" type="hidden" name="bookId">
			<div style="width:350px;height:50px;line-height:50px;text-align:center;">请按顺序上传图片，以免后期排序的麻烦</div>
			<div id="filelist" style="width:350px;"></div>
			<div id="btnContainer" style="width:350px;height:50px;line-height:50px;text-align:center;">
				<a id="addImgsBtn" class="easyui-linkbutton" href="javascript:void(0)" data-options="iconCls:'icon-add'">选择文件</a>
				<a id="uploadImgsBtn" class="easyui-linkbutton" href="javascript:void(0)" data-options="iconCls:'sjx-icon-upload'">上传</a>
			</div>
		</form>
	</div>
	<div style="width:400px;height:400px;border:1px solid red;padding:2px;float:right;">
		<img id="imgPrevSrc" alt="" src="" width="100%" height="100%">
	</div>
</div>


<div id="bookImgsShow">
	<table id="book_book_imgs_datagrid"></table>
</div>

<div id="uploadBookCoverPanel" style="padding:30px;">
	<input id="idOfCover" type="hidden" />
	<div id="coverfile" style="width:280px;"></div>
	<div id="btnCoverContainer" style="width:350px;height:50px;line-height:50px;text-align:center;">
		<a id="addCoverBtn" class="easyui-linkbutton" href="javascript:void(0)" data-options="iconCls:'icon-add'">选择文件</a>
		<a id="uploadCoverBtn" class="easyui-linkbutton" href="javascript:void(0)" data-options="iconCls:'sjx-icon-upload'">上传</a>
	</div>
	 <div id="prevCover" style="width:500px;height:300px;border:1px solid red;padding:2px;">
	 	<img id="imgSrc" alt="" src="" width="100%" height="100%">
	 </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript">
$("#imgFile").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	console.log(this.files) ;
	console.log(this.files[0]) ;
	if (objUrl) {
		$('#imgSrc').attr("src",objUrl);
		//$("#prevCover").css({"background-image":"url('"+objUrl+"')","background-repeat":"no-repeat"});
	}
}) ;
$(".upFileImg").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$('#imgPrevSrc').attr("src",objUrl);
	}
});
function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}
</script>

<script type="text/javascript">
function previewImage(file,callback){//file为plupload事件监听函数参数中的file对象,callback为预览图片准备完成的回调函数
	if(!file || !/image\//.test(file.type)) return; //确保文件是图片
	if(file.type=='image/gif'){//gif使用FileReader进行预览,因为mOxie.Image只支持jpg和png
		var fr = new mOxie.FileReader();
		fr.onload = function(){
			callback(fr.result);
			fr.destroy();
			fr = null;
		}
		fr.readAsDataURL(file.getSource());
	}else{
		var preloader = new mOxie.Image();
		preloader.onload = function() {
			//preloader.downsize( 300, 300 );//先压缩一下要预览的图片,宽300，高300
			var imgsrc = preloader.type=='image/jpeg' ? preloader.getAsDataURL('image/jpeg',80) : preloader.getAsDataURL(); //得到图片src,实质为一个base64编码的数据
			callback && callback(imgsrc); //callback传入的参数为预览图片的url
			preloader.destroy();
			preloader = null;
		};
		preloader.load( file.getSource() );
	}	
}
</script>




