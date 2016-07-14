<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>구글 애널리틱스 테스트</title>
	<script src="/event/js/jquery-1.11.1.min.js"></script>
	<script src="/event/js/jquery.jung.googleAnalytics.js"></script>
</head>
<body>
	
  <button id="event-button" class="ga-event" ga-action="버튼클릭_ie8" >
    하하하
  </button>
  <a href="googleAnalytics.jsp" class="ga-event" ga-action="버튼클릭2_ie8" ga-delay="500" >허하ㅓ허핳하하</a>

  <form name="frm" >
		<input type="submit" value="Test" class="ga-event"  ga-action="폼클릭555_ie8" ga-delay="500"/>
	</form>

</body>
</html>

