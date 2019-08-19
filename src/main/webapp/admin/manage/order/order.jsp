<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/Constants.js"></script>
<script type="text/javascript">
	var rootPath = '${pageContext.request.contextPath}/';
$('#order_order_search_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/bookOrder2Action!findBookOrdersByCondition.action',
	fit : true,
	/*fitColumns : true,*/
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'orderId',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	/*pagePosition : 'both',*/
	checkOnSelect : false,
	selectOnCheck : false,
	frozenColumns : [ [ {
		field : 'orderId',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'showOrderId',
		title : '订单号',
		width : 100,
		formatter:function(value,row,index){
			return "<span title='"+row.orderId+"'>"+row.orderId+"</span>";
		}
	}, {
		field : 'username',
		title : '用户名',
		width : 100
	} ] ],
	columns : [ [ {
		field : 'status',
		title : '订单状态',
		width : 100,
		formatter: function(value,row,index){
			if(value == Constants.ORDER_UNCONFIRMED){
				return "未确认";
			}else if(value == Constants.ORDER_CONFIRMED){
				return "已确认";
			}else if(value == Constants.ORDER_DISTRIBUTOIN){
				return "已配货";
			}else if(value == Constants.ORDER_SHIPPED){
				return "已发货";
			}else if(value == Constants.ORDER_RECEIVE){
				return "已收货";
			}else if(value == Constants.ORDER_END){
				return "已完成";
			}
		}
	}, {
		field : 'orderTime',
		title : '下单时间',
		width : 130,
		sortable : true
	}, {
		field : 'total',
		title : '总金额',
		width : 50,
		sortable : true
	}, {
		field : 'address',
		title : '地址',
		width : 200
	} , {
		field : 'info',
		title : '查看详细',
		width : 80,
		formatter:function(value,row,index){
			var res = "<a href='javascript:void(0)' onclick='OrderManage.showDetails("+"\""+row.orderId+"\""+")'>查看详细</a>";
			return res;
		}
	}  ] ],
	toolbar : [ {
		text : '配货',
		iconCls : 'sjx-icon-dis',
		handler : function() {
			OrderManage.distribution();
		}
	}, '-', {
		text : '发货',
		iconCls : 'sjx-icon-shipped',
		handler : function() {
			OrderManage.shipped();
		}
	}, '-', {
		text : '图表',
		iconCls : 'sjx-icon-chart',
		handler : function() {
			
		}
	} ],
	rowStyler:function(index,row){ 
		/*
		if(row.status == Constants.ORDER_UNCONFIRMED){
			return 'background-color:#99ff88;'; 
		}else if(row.status == Constants.ORDER_CONFIRMED){
			return 'background-color:#33ff22;';
		}else if(row.status == Constants.ORDER_DISTRIBUTOIN){
			return 'background-color:#ffdd88;';
		}else if(row.status == Constants.ORDER_SHIPPED){
			return 'background-color:#99ffee;';
		}else if(row.status == Constants.ORDER_RECEIVE){
			return 'background-color:#ffaabb;';
		}else if(row.status == Constants.ORDER_END){
			return 'background-color:#ccddcc;';
		}
		*/
		if(row.status == Constants.ORDER_CONFIRMED){
			return 'background-color:#99ff88;';
		}else if(row.status == Constants.ORDER_DISTRIBUTOIN){
			return 'background-color:#77ccff;';
		}
	}
});
var orderStatusOptionsHtml ="";
orderStatusOptionsHtml += "<option value='0'>--请选择--</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_UNCONFIRMED+"'>未确认</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_CONFIRMED+"'>已确认</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_DISTRIBUTOIN+"'>已配货</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_SHIPPED+"'>已发货</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_RECEIVE+"'>已收货</option>";
orderStatusOptionsHtml += "<option value='"+Constants.ORDER_END+"'>已完成</option>";
$("#order_order_status_select").append(orderStatusOptionsHtml);

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/order/OrderManage.js"></script>
<div id="order_order_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:80,hidden:true">
		<form id="order_order_search_condition_form">
			<div style="width:100%;text-align:center;padding:13px 0px;">
				订单状态:<select id="order_order_status_select" class="easyui-combobox" name="status"></select>
				订单时间从：<input id="orderTimeFrom" class="easyui-datebox dateDisableFromNow" name="orderTimeFrom" data-options="required:true,formatter:myformatter,parser:myparser" />
				订单时间到：<input id="orderTimeTo" class="easyui-datebox dateDisableFromNow"  name="orderTimeTo" data-options="required:true,formatter:myformatter,parser:myparser" />
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="OrderManage.searchOrder()">查询</a>
			</div>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="order_order_search_datagrid"></table>
	</div>
</div>
<script type="text/javascript">
function myformatter(date){  
    var y = date.getFullYear();  
    var m = date.getMonth()+1;  
    var d = date.getDate();  
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);  
}  
          
function myparser(s){  
    if (!s) return new Date();  
    var ss = (s.split('-'));  
    var y = parseInt(ss[0],10);  
    var m = parseInt(ss[1],10);  
    var d = parseInt(ss[2],10);  
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){  
        return new Date(y,m-1,d);  
    } else {  
        return new Date();  
    }  
}  
$(function () {
	var now = new Date();
//	$("#orderTimeFrom").datebox("setValue",'6/1/2012');
//	$("#orderTimeTo").datebox("setValue",myformatter(now));
});
</script>
<div id="bookOrderDetailShow">
	<table id="order_order_show_details"></table>
</div>