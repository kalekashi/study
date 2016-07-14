(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-74998370-1', 'auto');
ga('send', 'pageview');

$(function(){
	$('.ga-event').on('click', function(e){
		e.stopPropagation();
		var category = $(this).attr('ga-category') || $(document).attr('title');
		var action = $(this).attr('ga-action');
		var label = $(this).attr('ga-label');
		var delay = $(this).attr('ga-delay');

		if (category == '' || action == ''){
			return 'err';
		}
		
		if (delay !== ''){
			ga('send', 'event', category, action, label);
		} else {
			setTimeout(function(){
				ga('send', 'event', category, action, label);
			}, delay);
		}

	});
});
