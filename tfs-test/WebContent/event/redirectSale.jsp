<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.efusioni.stone.utils.Param" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.*"%>
<%
	out.clear();
	response.setHeader("P3P", "CP=\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\"");

	Param param = new Param(request);

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

	String url = "http://" + request.getServerName() + "/";
	if (mobileY){
		url = "http://" + request.getServerName() + "/m/mall/index.jsp";
	}
	
%><!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="Cache-Control" content="no-cache" />
<script type="text/javascript" >
		
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-31551710-3']);
	_gaq.push(['_trackPageview']);

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();


	//setTimeout(function(){
	setInterval(function(){
		location.href = '<%=url%>';
	}, 500);
</script>
</head>
<body>
</body>
</html>

