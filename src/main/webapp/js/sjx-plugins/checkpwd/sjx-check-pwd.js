/**
 * 这里是一个密码强度的验证小插件
 * 验证的正则是采用网络上的现成的
 * 我把他们封装为一个插件方便使用
 * @author 宋建熙
 * 
 */
(function($) {
	
	 $.fn.sjx_check_pwd = function(options) {

	        var defaultConfig = {
	        	/**
	        	 * 这里不用传参数。。。
	        	 */
	            sjx_check_input:"",
	            /**
	             * 检查的信息要显示的容器
	             */
	            sjx_check_show:""
	        };
	        var sjx_html = "<div id='level' class='pw-strength'>"          	
				+"<div class='pw-bar'></div>"
				+"<div class='pw-bar-on'></div>"
				+"<div class='pw-txt'>"
				+"<span>弱</span>"
				+"<span>中</span>"
				+"<span>强</span>"
				+"</div>"
				+"</div>";
	        var settings = $.extend(defaultConfig, options || {});

	        return $(this).ready(function(){
	        	$(settings.sjx_check_show).html(sjx_html);
	        }).keyup(function () { 
	    		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
	    		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
	    		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	    	
	    		if (false == enoughRegex.test($(this).val())) { 
	    			$('#level').removeClass('pw-weak'); 
	    			$('#level').removeClass('pw-medium'); 
	    			$('#level').removeClass('pw-strong'); 
	    			$('#level').addClass(' pw-defule'); 
	    			 //密码小于六位的时候，密码强度图片都为灰色 
	    		} 
	    		else if (strongRegex.test($(this).val())) { 
	    			$('#level').removeClass('pw-weak'); 
	    			$('#level').removeClass('pw-medium'); 
	    			$('#level').removeClass('pw-strong'); 
	    			$('#level').addClass(' pw-strong'); 
	    			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
	    		} 
	    		else if (mediumRegex.test($(this).val())) { 
	    			$('#level').removeClass('pw-weak'); 
	    			$('#level').removeClass('pw-medium'); 
	    			$('#level').removeClass('pw-strong'); 
	    			$('#level').addClass(' pw-medium'); 
	    			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
	    		} 
	    		else { 
	    			$('#level').removeClass('pw-weak'); 
	    			$('#level').removeClass('pw-medium'); 
	    			$('#level').removeClass('pw-strong'); 
	    			$('#level').addClass('pw-weak'); 
	    			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
	    		} 
	    		return true; 
	    	}); 
	    };
	
})(jQuery);
