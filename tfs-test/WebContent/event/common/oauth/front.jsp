<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page 	import="java.util.*,
			java.net.*,
			com.efusioni.stone.utils.*,
			com.thefaceshop.front.common.*" %>
<%
	/*
		kakaotalk api Àû¿ë (2016.03.10)
		by jjung
	*/
	String kakaoKey = "3e31a77ccfa90808c4a9a0ddb9193bca";
	String redirectURL = "http://" + request.getServerName() + "/event/common/oauth/complete.jsp";
	
	response.sendRedirect("https://kauth.kakao.com/oauth/authorize?client_id=" + URLEncoder.encode(kakaoKey) + "&redirect_uri=" + URLEncoder.encode(redirectURL) + "&response_type=code"); 	
%>