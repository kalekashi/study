<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
				java.net.*,
				java.io.*,
				javax.net.ssl.HttpsURLConnection,
				com.efusioni.stone.utils.*,
				com.thefaceshop.front.common.*" %>
<%@ page import="org.json.simple.*"%>
<html>
<head>
<script src="/event/js/jquery-1.11.1.min.js"></script>
<script src="/event/js/commonSNS.js"></script>
<script>
	function loginComplete(){
		var data = {};
		/*
		data.imgData = '/boqXDv/hyiX3c1LIj/5wzKkbEsnWh4ntcBeDoqA0/img.jpg?width=632&height=316';
		data.contentData = '흐흐흐';
		kakaoApiPhotoShare(data);
		*/

		data.scrapContent = '히히히',
		data.scrapURL = 'http://dev.thefaceshop.com/?',
		data.requested_url = 'http://dev.thefaceshop.com',
		data.scrapImg = 'http://dn-l0-story.kakao.co.kr/dn/cQaWbq/hyiTV0laxs/VMcNaH2PkyBqwq4c7CKCp0/img.jpg?height=316&width=632'
		data.scrapDescription = '디스크립숀'
		kakaoApiLinkShare(data);

	}
</script>
</head>
<body></body>
</html>