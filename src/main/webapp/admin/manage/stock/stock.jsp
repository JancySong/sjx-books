<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/Constants.js"></script>
<script type="text/javascript">
var rootPath = '${pageContext.request.contextPath}/';
$('#stock_book_stock_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/bookStockAction!getBookStock.action',
	fit : true,
	border : false,
	pagination : true,
	singleSelect: true,
	pagePosition:'bottom',
	idField : 'bid',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : true,
	selectOnCheck : true,
	frozenColumns : [ [ {
		field : 'bid',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'bookName',
		title : '书名',
		width : 100
	} ] ],
	columns : [ [ {
		field : 'author',
		title : '作者',
		width : 100
	},{
		field : 'bookStock',
		title : '库存数量',
		width : 100
	}] ],
	toolbar : [ {
		text : '调整库存数量',
		iconCls : 'icon-edit',
		handler : function() {
			StockManager.adjustStock();
		}
	}, '-' ],
	rowStyler:function(index,row){
		if(row.bookStock < 20){
			return 'background-color:#ffbbcc;';
		}
	}
});
$('.bstock').numberspinner({
    min: 1,
    max: 9999
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/stock/StockManager.js"></script>
<div id="stock_book_stock_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:100,hidden:true">
		<form id="stock_book_stockr_searchForm">
			<div style="text-align:left;margin-top:10px;height:25px;">
				<div style="width:330px;float:left;text-align:right;">
					书名： <input class="easyui-textbox" name="bookName" />
				</div>
				<div style="width:330px;float:left;text-align:right;">
					作者： <input class="easyui-textbox" name="author" />
				</div>
				<div style="width:246px;float:left;text-align:right;">
				</div>
			</div>
			<div style="text-align:left;margin-top:5px;height:25spx;">
				<div style="width:330px;float:left;text-align:right;">
					库存数量从：<input class="easyui-numberspinner bstock" name="bookStockFrom" />
				</div>
				<div style="width:330px;float:left;text-align:right;">
					库存数量到：<input class="easyui-numberspinner bstock" name="bookStockTo" />
				</div>
				<div style="width:330px;float:left;text-align:right;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="StockManager.search()">查询</a> 
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'sjx-icon-trash'" onclick="StockManager.clear()">清空</a>
				</div>
			</div>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="stock_book_stock_datagrid"></table>
	</div>
</div>

<style>
<!--
 .alignCls{width:430px;clear: both;margin:5px 0;height:30px;}
 .labelCls{width:80px;margin-left:50px;float:left;}
 .inCls{width:280px;float:right;}
 .disableIN{background-color: rgba(128,128,128,.5)}
-->
</style>

<div id="adjustStockPanel">
<form id="adjustStockForm">
<div style="width:460px;height:120px;margin:30px 0px;">
	<input type="hidden" name="bid"/>
	<div class="alignCls">
		<div class="labelCls">
        	<label for="name">书名:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-textbox disableIN" readonly="readonly" name="bookName"/>
        </div>
    </div>
    <div class="alignCls">
		<div class="labelCls">
        	<label for="name">作者:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-textbox disableIN" readonly="readonly" name="author"/>
        </div>
    </div>
    <div class="alignCls">
		<div class="labelCls">
        	<label for="name">库存数量:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-numberspinner bstock" name="bookStock"/>
        </div>
    </div>
    <div class="alignCls">
		<div class="labelCls">
        	<label for="name"></label>
        </div>
        <div class="inCls">
        	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="StockManager.saveBookStock()">保存</a>
        </div>
    </div>
</div>
</form>
</div>
