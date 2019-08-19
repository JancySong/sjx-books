(function($) {
	$.fn.sjx_focus_Clear = function(options) {

		var defaultConfig = {
			sjx_equalValue : "用户名",
			sjx_showFontColor : "black",
			sjx_hideErrorTips : ".login_user .tip .u",
			sjx_inType : "text",
			sjx_borderStyle : "1px #F00 solid"
		};

		var settings = $.extend(defaultConfig, options || {});

		return $(this).on("focus", function() {
			var value = $(this).val();

			if (value == settings.sjx_equalValue) {
				$(this).attr("type", settings.sjx_inType);
				$(this).val("");
				$(this).css("color", settings.sjx_showFontColor);
				$(this).css("border", settings.sjx_borderStyle);
				$(settings.sjx_hideErrorTips).css("display", "none");
			}
		});
	};

	$.fn.sjx_blur_Show = function(options) {

		var defaultConfig = {
			sjx_not_equalValue : "用户名",
			sjx_showFontColor : "gray",
			sjx_hideErrorTips : ".login_user .tip .u",
			sjx_inType : "text",
			sjx_borderStyle : "1px #0a3 solid"
		};

		var settings = $.extend(defaultConfig, options || {});

		return $(this).on("blur", function() {
			var value = $(this).val();
			if (value == "") {
				$(this).attr("type", settings.sjx_inType);
				$(this).val(settings.sjx_not_equalValue);
				$(this).css("color", settings.sjx_showFontColor);
				$(this).css("border", "1px gray solid");
				$(settings.sjx_hideErrorTips).css("display", "block");
			} else if (value != "" || value != settings.sjx_not_equalValue) {
				$(this).css("border", settings.sjx_borderStyle);
			}
		});
	};

})(jQuery);

/**
 * @author JancySong
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
// var easyuiPanelOnMove = function(left, top) {
// var l = left;
// var t = top;
// if (l < 1) {
// l = 1;
// }
// if (t < 1) {
// t = 1;
// }
// var width = parseInt($(this).parent().css('width')) + 14;
// var height = parseInt($(this).parent().css('height')) + 14;
// var right = l + width;
// var buttom = t + height;
// var browserWidth = $(window).width();
// var browserHeight = $(window).height();
// if (right > browserWidth) {
// l = browserWidth - width;
// }
// if (buttom > browserHeight) {
// t = browserHeight - height;
// }
// $(this).parent().css({/* 修正面板位置 */
// left : l,
// top : t
// });
// };
// $.fn.dialog.defaults.onMove = easyuiPanelOnMove;
// $.fn.window.defaults.onMove = easyuiPanelOnMove;
// $.fn.panel.defaults.onMove = easyuiPanelOnMove;
