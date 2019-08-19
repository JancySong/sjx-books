<%@ page language="java" pageEncoding="UTF-8"%>
<div id="chart_order_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div id="orderChartContainer" style="width: 600px;height:440px;border:1px solid #BBB;float:left;margin:2px;"></div>
	<div id="orderChartGroupContainer" style="width: 550px;height:440px;border:1px solid #AAA;float:left;margin:2px;"></div>
</div>
<script type="text/javascript">

var loadOrder = function(){
	$.ajax({
		 url:'${pageContext.request.contextPath}/chartAction!chart.action',
		 dataType:'json',
		 success:function(result){
			 $('#orderChartContainer').SjxChartShow({
				 	type:"pie",
	    			data:result,
	    			title:"订单情况",
	    			subTitle:""
			 });
		 }
	  });
};
var loadOrderGroup = function(){
	$.ajax({
		 url:'${pageContext.request.contextPath}/chartAction!chartGroup.action',
		 dataType:'json',
		 success:function(result){
			 $('#orderChartGroupContainer').SjxChartShow({
				 	type:"bar",
	    			data:result,
	    			title:"订单情况",
	    			subTitle:""
			 });
		 }
	  });
};
var chart;
var chartGroup;
$(function($) {
	loadOrder();
	loadOrderGroup();
	chart = setInterval("loadOrder()",1000*10);
	chartGroup = setInterval("loadOrderGroup()",1000*10);
	  
});
</script>