<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    
    <title>My JSP 'head_nav_ad.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	
	<style type="text/css">
	.ad-container{width: 1110px;height: 320px;position: relative;}
	.ad-container .ad-ul{list-style: none;}
	.ad-style{width: 1110px;float: left;display: block;height: 320px;margin: 0px;padding: 0px;opacity: 1;display: none;
	}
	.ad-show{display: block;-webkit-animation: myfirst 10s ;}

	.ad-node{list-style: none;position: absolute;right: 10px;bottom: 10px;height:30px;margin: 0px;padding: 0px;}
	.ad-node .ad-node-off{width: 30px;height: 30px;float: left;background-color: gray;margin-left: 8px;
		border-radius: 15px;line-height: 30px;text-align: center;color: #FFF;}
	.ad-node .ad-node-on{background-color: red;}

	.list-con{width: 180px;height: 100%;background: rgba(80,80,90,.5);position: absolute;z-index: 2;color: #FFF;font-weight: 700;}

	.list-item{list-style: none;width: 100%;height: 30px;line-height: 30px;text-align: center;cursor: pointer;margin-top: 5px;}
	.list-item:hover{background: rgba(240,0,0,0.9)}

img{margin: 0px;padding: 0px;}

	@-webkit-keyframes myfirst
	{
	0%   {opacity: 0}
	10%  {opacity: 0.1}
	20%  {opacity: 0.2}
	25%  {opacity: 0.3}
	35%  {opacity: 0.6}
	45%  {opacity: 0.8}
	55%  {opacity: 1}
	60%  {opacity: 1}
	70%  {opacity: 1}
	75%  {opacity: 1}
	80%  {opacity: 0.8}
	85%  {opacity: 0.6}
	90%  {opacity: 0.4}
	95%  {opacity: 0.2}
	100% {opacity: 0.05}
	}


</style>
	
  </head>
  
  <body>
<div class="ad-container">

	<div class="list-con">
		<ul>
			<li class="list-item">文学</li>
			<li class="list-item">青春</li>
			<li class="list-item">小说</li>
			<li class="list-item">励志</li>
			<li class="list-item">生活</li>
			<li class="list-item">科技</li>
		</ul>
	</div>


	<ul class="ad-ul">
		<li class="ad-li ad-style ad-show"><a href="##"><img src="${pageContext.request.contextPath}/images/adver/1.jpg"></a></li>
		<li class="ad-li ad-style"><a href="##"><img src="${pageContext.request.contextPath}/images/adver/2.jpg"></a></li>
		<li class="ad-li ad-style"><a href="##"><img src="${pageContext.request.contextPath}/images/adver/3.jpg"></a></li>
		<li class="ad-li ad-style"><a href="##"><img src="${pageContext.request.contextPath}/images/adver/4.jpg"></a></li>
	</ul>
</div>

<script type="text/javascript">
	$(function(){
		// alert($('.ad-li ').size());
		var sizeOfImg = $('.ad-li ').size();
		
		var nodeHtml="<ul class='ad-node'>";
		for(var i = 0;i<sizeOfImg;i++){
			if(i!=0){
				nodeHtml+="<li class='ad-node-off'>"+(i+1)+"</li>";
			}else{
				nodeHtml+="<li class='ad-node-off ad-node-on'>"+(i+1)+"</li>";
			}
		}
		nodeHtml+="</ul>";
		$('.ad-container').append(nodeHtml);
		
		var count = 1;
		setInterval(function(){
			var index = count % sizeOfImg;
			$('.ad-li:eq('+index+')').addClass('ad-show').siblings().removeClass('ad-show');
			$('.ad-node .ad-node-off:eq('+index+')').addClass('ad-node-on').siblings().removeClass('ad-node-on');
			count++;
		},1000*10);

		$('.ad-node .ad-node-off').hover(function(){
			 count = $(this).index();
		$('.ad-li:eq('+count+')').addClass('ad-show').siblings().removeClass('ad-show');
			$('.ad-node .ad-node-off:eq('+count+')').addClass('ad-node-on').siblings().removeClass('ad-node-on');
		},function(){});
	});
</script>


  </body>
</html>
