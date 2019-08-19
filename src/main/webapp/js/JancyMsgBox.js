/**
* Plugin Name: 3D旋转效果
* author: JancySong(宋建熙)
* mail: 2515452324@qq.com
*/
(function($) {

	$.jancyMsgBox = {};

	$.jancyMsgBox.confirm = function(options) {
		var defaults = {
			title : '提示',
			msg : '内容',
			ok : $.noop
		};
		var clientH = $(window).height();
		var cilentW = $(window).width();
		var settings = $.extend(defaults, options);
		var hs = "<div class='cm'>";
		hs += "<div class='msgbox'>";
		hs += "<div class='msg-title'>" + settings.title + "</div>";
		hs += "<div class='msg-content'>" + settings.msg + "</div>";
		hs += "<div class='msg-btn'>";
		hs += "<input class='msg-btn-cls okM' type='button' value='确定'> ";
		hs += "<input class='msg-btn-cls' type='button' value='取消'>";
		hs += "</div>";
		hs += "</div>";
		hs += "</div> ";
		$('body').append(hs);
		$('.cm').fadeIn();
		$('div.cm').css({
			"padding-top" : (clientH - $('.msgbox').height()) / 2,
			"width" : cilentW,
			"height" : clientH
		});
		$('input.msg-btn-cls').on('click', function() {
			$('.cm').fadeOut(1000, function() {
				$(this).remove();
			});
		});
		$('.okM').on('click', function() {
			settings.ok();
		});
	};

	$.jancyMsgBox.alert = function(options) {
		var defaults = {
			title : '提示',
			msg : '内容'
		};
		var clientH = $(window).height();
		var cilentW = $(window).width();
		var settings = $.extend(defaults, options);
		var hs = "<div class='cm'>";
		hs += "<div class='msgbox'>";
		hs += "<div class='msg-title'>" + settings.title + "</div>";
		hs += "<div class='msg-content'>" + settings.msg + "</div>";
		hs += "<div class='msg-btn'>";
		hs += "<input class='msg-btn-cls' type='button' value='确定'> ";
		hs += "</div>";
		hs += "</div>";
		hs += "</div> ";
		$('body').append(hs);
		$('.cm').fadeIn();
		$('div.cm').css({
			"padding-top" : (clientH - $('.msgbox').height()) / 2,
			"width" : cilentW,
			"height" : clientH
		});
		$('input.msg-btn-cls').on('click', function() {
			$('.cm').fadeOut(1000, function() {
				$(this).remove();
			});
		});
	}

})(jQuery);