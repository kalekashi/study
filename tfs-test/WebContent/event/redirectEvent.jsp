<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.efusioni.stone.utils.Param" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%

	//String currentURL = HttpUtils.getRequestURL(request).toString();
	
	out.clear();
	response.setHeader("P3P", "CP=\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\"");

	Param param = new Param(request);

	String eventCode = param.get("eventCode", "");
	String eventId = param.get("eventId", "");
	String snsFlag = param.get("utm_source","kakaostory");

	if (eventCode.equals("") || eventId.equals("") ){
		out.print("<meta http-equiv=\"refresh\" content=\"1; url=http://www.thefaceshop.com\" />");
		return;
	}

	String url = "/mall/event/event-view.jsp?seq=" + eventCode;
	String userAgent = request.getHeader("User-Agent"); //매체 구분
	boolean mobileY = false;
	if (userAgent.indexOf("iPhone") > 0) {
		mobileY = true;
	} else if (userAgent.indexOf("iPod") > 0) {
		mobileY = true;
	} else if (userAgent.indexOf("iPad") > 0) {
		mobileY = true;
	} else if (userAgent.indexOf("Android") > 0) {
		mobileY = true;
	}

	if (mobileY){
		url = "/m/event/" + eventId + "/event.jsp";
	} 
	
%><!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta property="og:url" content="http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=<%=snsFlag%>&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161" />
<% if (snsFlag.equals("kakaostory")) { %>
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<% } else { %>
<meta property="og:title" content="심/쿵/주/의/  나를 PICK UP 해줘" />
<meta property="og:description" content="너 때문에 가슴이 두근두근 뛰잖아 ♥ 지금 당신의 심쿵템을 픽업하세요~ 픽미 픽미 픽미업! " />
<% } %>
<meta property="og:image" content="http://www.thefaceshop.com/event/20160315001/images/<%=snsFlag%>.jpg" />   
<script type="text/javascript" >
		
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-31551710-3']);
	_gaq.push(['_trackPageview']);

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();


	setTimeout(function(){
		location.href = '<%=url%>';
	}, 500);
</script>
</head>
<body>
</body>
</html>

