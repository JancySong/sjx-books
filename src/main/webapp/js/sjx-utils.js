(function($) {
	$.jancySong = {};
	/**
	 * 表单序列化成对象
	 */
	$.jancySong.serializeForm2Object = function(form) {
		var object = {};
		$.each(form.serializeArray(), function(index) {
			if (object[this['name']]) {
				object[this['name']] = object[this['name']] + "," + this['value'];
			} else {
				object[this['name']] = this['value'];
			}
		});
		return object;
	};

	$.fn.serializeAll = function() {
		var rselectTextarea = /^(?:select|textarea)/i;
		var rinput = /^(?:color|date|datetime|datetime-local|email|file|hidden|month|number|password|range|search|tel|text|time|url|week)$/i;
		var rCRLF = /\r?\n/g;

		var arr = this.map(function() {
			return this.elements ? jQuery.makeArray(this.elements) : this;
		}).filter(function() {
			return this.name && !this.disabled && (this.checked || rselectTextarea.test(this.nodeName) || rinput.test(this.type));
		}).map(function(i, elem) {
			var val = jQuery(this).val();

			return val == null ? null : jQuery.isArray(val) ? jQuery.map(val, function(val, i) {
				return {
					name : elem.name,
					value : val.replace(rCRLF, "\r\n")
				};
			}) : {
				name : elem.name,
				value : val.replace(rCRLF, "\r\n")
			};
		}).get();

		return $.param(arr);
	}

})(jQuery);