;(function($){

	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	
	var pageTracker = null;

	$.ga = function(analyticsCode, category, page){ //appData > ���̽������̺�Ʈ�� ��üƮ��ŷ ����
		//google Analytics �����ڵ� loading
		$.getScript(gaJsHost + "google-analytics.com/ga.js", function(){
			try {
				pageTracker = _gat._getTracker(analyticsCode); //���� �񵿱� ����
				if (page){
					pageTracker._trackPageview(page);
				}else{
					pageTracker._trackPageview();
				}
			} catch(err) {}
		});
	};

	function trackEvent(category, e) {
		//var dataCategory = $(this).attr('data-category');
		var action = $(e).attr('data-action');
		if ( action == '' || action == null ){
			action = $(e).attr('title');
			if ( action == '' || action == null ){
				action = $(e).attr('alt');
			}
		}
		var label = $(e).attr('data-label');
		pageTracker._trackEvent( category , action  ,label);
	}

	$.fn.tracking = function(category){ //analyticsCode : ���� �ֳθ�ƽ�� tracking key , category : catagory
		//alert(category);

		return this.each(function() {
			var $this = $(this);
			var tagName = this.tagName;
			//alert(tagName);
			switch (tagName.toLowerCase()) {
				case 'a':
				case 'img':
				case 'area':
					//$this.click(function(e){
					$this.on('click', function(e){
						trackEvent(category, this);
						//�����̰� ������
						var delay = $this.attr('data-delay');
						var href = this.href;
						if (delay) {
							delay = parseInt(delay);
							e.preventDefault();
							setTimeout(function() {								
								document.location.href = href;
							}, delay);
						}
					});
					break;
				case 'input':
					if ($this.is('[type=button]') || $this.is('[type=image]')) {
						//$this.click(function(e){
						$this.on('click', function(e){
							trackEvent(category, this);
							//�����̰� ������
							var delay = $this.attr('data-delay');
							var href = this.href;
							if (delay) {
								delay = parseInt(delay);
								e.preventDefault();
								setTimeout(function() {									
									document.location.href = href;
								}, delay);
							}
						});
					}
					break;
				case 'form':
					$this.submit(function(e){
						e.preventDefault();
						trackEvent(category, this);
					});
					break;
			
			}
		});

	};

	$.ga.logAction = function(category, action, label){	
		if (label == '' || label == null){
			pageTracker._trackEvent( category , action);
		}else{
			pageTracker._trackEvent( category , action , label);
		}
	};

})(jQuery);