/*!
 * jQuery xSubmit Plugin
 * Copyright (c) 2014 shy4blue
 * Version: 0.01
 * Requires: jQuery, jQuery Form Plugin(http://malsup.com/jquery/form/)
 */

;(function($){
	$.xSubmit = {};
	$.xSubmit.load = function(opts) {	
		$.xSubmit.opts = opts;
	};

	$.xSubmit.postMessage = function(data) {	
		
		if (!!window.postMessage) {
			parent.postMessage(JSON.stringify(data), $.xSubmit.opts['origin']);
		} else {
			var $f = $('<form action="' + $.xSubmit.opts['origin'] + '" method="post" />').appendTo('body');
			var $i = $('<input type="hidden" name="_data" value="" />').appendTo($f[0]);
			$i.val(JSON.stringify(data));
			$f.attr('action', $.xSubmit.opts['origin'] + $.xSubmit.opts['originPath']);
			$f[0].submit();
		}
	};

	$.xSubmit.success = {};
	$.xSubmit.error = {};

	$.fn.xSubmit = function(options) {
		var opts = $.extend({
			dataType: 'json',
			success: function(data, textStatus, jqXHR) {
			},
			error: function(jqXHR, textStatus, errorThrown) {
			}
		}, options || {});

		// url
		return this.each(function(i, e) {
			var url = opts.url;
			if (!url) {
				url = e.action;
			}
			

			// action value have to be set an absolute url.
			if (! /^https?\:\/\//.test(url)) {
				alert('action value have to be set an absolute url.');
				return;
			}
			

			var origin = url.match(/^https?\:\/\/[^\/]+/)[0];
							
			var id = 'xs' + new Date().getTime();
			
			var $io = $('<iframe name="' + id + '" src="about:blank" />');
			$io.css({ position: 'absolute', top: '-1000px', left: '-1000px' });
			$io.appendTo('body');
			var optInputs = [];
			optInputs.push($('<input type="hidden" name="_xsid">').val(id).appendTo(e)[0]);
			this.target = id;

			$.xSubmit.success[id] = opts.success;
			
			
			// postMessage 를 지원하면 핸들러 추가
			if (!!window.postMessage) {
				$(window).on("message." + id, function(e) {
					if (origin != e.originalEvent.origin) {
						return;
					}
					
					var data = $.parseJSON(e.originalEvent.data);
					if (id == data._xsid) {
						$.xSubmit.success[id](data);
					}
					$(window).off("message." + id); // release binding
				});
			}
				
			this.submit();
			setTimeout(function() {
				$(optInputs).remove();
			}, 10);
			
		});
	}

})(jQuery);
