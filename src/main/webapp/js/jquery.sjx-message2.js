/**
*@author宋建熙
*@version 2
*/
jQuery.extend({
	sjx_message:{
		alert : function(options){
	        var defaults = {
	                title:'提示',
	                content:'内容'
	            };
	            var settings = $.extend(defaults,options || {});
	            /*
	            var htmlC = "<div id='sjx-message' style='width:300px;height:120px;background:rgba(144,158,159,0.9);" +
	            		"position:absolute;right:5px;bottom:4px;border:1px #555 solid;cursor:pointer;display:none;z-index:10'>" +
	            		"<div style='width:100%;border-bottom:1px #555 solid;background:rgba(114,233,254,0.6);height:25px;'>"+settings.title+"</div>" +
	            		"<div style='width:100%;height:95px;'>"+settings.content+"</div></div>";
	            */
	            var htmlC = "";
	            var htmlArr = [];
	            htmlArr.push("<div id='sjx-message' style='width:300px;height:120px;background:rgba(144,158,159,0.9);");
	            htmlArr.push("position:absolute;right:5px;bottom:4px;border:1px #555 solid;cursor:pointer;display:none;z-index:10'>");
	            htmlArr.push("<div style='width:100%;border-bottom:1px #555 solid;background:rgba(114,233,254,0.6);height:25px;'>");
	            htmlArr.push(settings.title);
	            htmlArr.push("</div>");
	            htmlArr.push("<div style='width:100%;height:95px;'>");
	            htmlArr.push(settings.content);
	            htmlArr.push("</div></div>");
	            
	            htmlC = htmlArr.join("");

	            
	            return $('body').append(htmlC).find('#sjx-message').slideDown(1500).slideUp(1500,function(){$(this).remove();});
	        }  
	},
});