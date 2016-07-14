<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta property="og:url" content="http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=inkJelStick&eventId=20160315001&eventCode=134" />
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="og:image" content="http://www.thefaceshop.com/event/20160315001/images/kakaostory.jpg" />  
<title>더페이스샵</title>
<script type="text/javascript" src="/event/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/event/js/jquery.shy4blue.placeholder.js"></script>
<script type="text/javascript"></script>
<script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', 'UA-74998370-1', 'auto');
//ga('require', 'autotrack');
ga('send', 'pageview');



var hitData = {count: 0};
  ga('set', 'sendHitTask', function(model) {

	  console.log('a');
    hitData[hitData.count] = {
      eventCategory: model.get('eventCategory'),
      eventAction: model.get('eventAction'),
      eventLabel: model.get('eventLabel'),
      eventValue: model.get('eventValue'),
      devId: model.get('&did')
    };
    hitData.count++;
  });

</script>
</head>
<body>
	<button data-event-category="testEventName" data-event-action="button Click">Play</button>


	<script async src='https://www.google-analytics.com/analytics.js'></script>
	<script async src='/event/js/autotrack.js'></script>
</body>
</html>
