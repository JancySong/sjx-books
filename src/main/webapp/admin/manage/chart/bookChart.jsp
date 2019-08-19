<%@ page language="java" pageEncoding="UTF-8"%>
<div id="chart_book_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div id="bookChartContainer" style="width: 600px;height:440px;border:1px solid #BBB;float:left;margin:2px;"></div>
</div>
<script type="text/javascript">
var loadData = function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/chartAction!bookChart.action',
		dataType:'json',
		success:function(result){
			$('#bookChartContainer').SjxChartShow({
				type:"pie",
				data:result,
				title:"销售量前十情况",
				subTitle:""
			});
		}
	});  
};
var bookCart;
$(function($) {
		loadData();
		bookCart = setInterval("loadData()",1000*10);
});
</script>