/**
* Plugin Name: 3D旋转效果
* author: JancySong(宋建熙)
* mail: 2515452324@qq.com
*/
(function($) {
	$.fn.jancyRotate3D = function(options) {
		var defaults = {
			currentIndex : 0,
			isClicked : false,
			totalImgs : 1,
			currentPosition : 0
		};
		var $options = $.extend(defaults, options);
		$options.totalImgs = $('.3dimgs').size();
		$('.3dimgs:eq(' + ($options.currentIndex) + ')').removeClass("hiddenImg");
		return this.each(function() {
			var $obj = $(this);
			$obj.on('mousedown', function(event) {
				$options.currentPosition = event.pageX;
				$options.isClicked = true;
				return false;
			});
			$obj.on('mouseup', function() {
				$options.isClicked = false;
			});
			$obj.on("mouseleave", function() {
				$options.isClicked = false;
			});
			$obj.on('mousemove', function(event) {
				if ($options.isClicked) {
					var pageX = event.pageX;
					var moveDis = 5;
					var subDis = $options.currentPosition - pageX;
					if (Math.abs(subDis) > moveDis) {
						if (subDis > 0) {
							$('.3dimgs:eq(' + $options.currentIndex + ')').addClass("hiddenImg");
							$options.currentIndex++;
							if ($options.currentIndex > $options.totalImgs - 1) {
								$options.currentIndex = 0;
							}
							$('.3dimgs:eq(' + $options.currentIndex + ')').removeClass("hiddenImg");
						} else {
							$('.3dimgs:eq(' + $options.currentIndex + ')').addClass("hiddenImg");
							$options.currentIndex--;
							if ($options.currentIndex < 0) {
								$options.currentIndex = $options.totalImgs - 1;
							}
							$('.3dimgs:eq(' + $options.currentIndex + ')').removeClass("hiddenImg");
						}
						$options.currentPosition = pageX;
					}
				}
			});
		});
	};
})(jQuery);