<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<title>타이틀2</title>
<body>
 
<script src='/event/js/jquery-1.11.1.min.js'></script>
<script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', 'UA-74998370-1', 'auto');
ga('require', 'autotrack');
ga('send', 'pageview');
ga('require', 'outboundLinkTracker');
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
<script async src='/event/js/autotrack.js'></script>
<script>
	$(function(){
		$('input, button, form a').attr('ga-event-category','');

		/*
		$('a').click(function(e){
			e.preventDefault();
			history.pushState({}, 'a', $(this).attr('href'));
		});
		*/
	});

</script>

  <button
    id="event-button">
    Click
  </button>

  <button
    id="event-button-some-fields"
    ga-event-action="테스트">
    Click
  </button>

  <button
    id="event-button-missing-fields"
    ga-event-action="버튼클릭">
    Click
  </button>

<a id="outbound-link" href="http://www.naㅇㅇㅇveeer.com" ga-event-action="아웃바운드">Outbound</a>
  <a id="local-link" href="/test/blank.html">Local</a>

  <script>

  </script>

</body>
</html>