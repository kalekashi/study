<%@page import="effi.com.lgcare.ecm.db.ConnectionResource"%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/mall/error/error.jsp"
	import="com.efusioni.stone.utils.*,
			java.sql.*,
			java.net.*,
			java.util.*,
			java.io.*,
			com.thefaceshop.front.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.*"%>
<%
	out.clear();

	response.setHeader("Cache-Control", "no-store");   
	response.setHeader("Pragma", "no-cache");   
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1")) { 
		response.setHeader("Cache-Control", "no-cache");
	}	
	
	if (request.getServerName().equals("www.thefaceshop.com")) {
		response.setHeader("Access-Control-Allow-Origin", "http://www.thefaceshop.com");
	}

	Param	param	=	new Param(request);

	// json setting
	JSONObject resultObject = new JSONObject();
	resultObject.put("result", new Boolean(false));
	resultObject.put("message", "");
	resultObject.put("_xsid", param.get("_xsid",""));

	String eventId = "20160315001";
	
	String channel = param.get("channel", "");

	String product = param.get("product", "");
	String name = param.get("name","");
	String mobile = param.get("mobile","");
	String zipcode = param.get("zipcode","");
	String addressType = param.get("addressType","");
	String address = param.get("address","");
	String address2 = param.get("address2","");
	String adAgree = param.get("chkbox_agree3", "N");

	int seq = 0;
	String userIP =	request.getHeader("X-Forwarded-For");
	if(userIP == null || "".equals(userIP)){
		userIP = request.getRemoteAddr();
	}

	// 이벤트 종료처리
	String today = Utils.getTimeStampString("yyyyMMdd");
	String endday = "20160405";

	boolean eventEndDay = false;
	/*
	if (today.compareTo(endday) > 0){
		resultObject.put("message", "이벤트가 종료되었습니다. 감사합니다.");
		out.println(resultObject);
		return;
	}
	*/
	

	if (channel.equals("") || name.equals("") || mobile.equals("") || addressType.equals("") ||  zipcode.equals("") || address.equals("") || address2.equals("") || product.equals("")){	
		resultObject.put("message", "올바른 경로로 접근해주세요");
		out.println(resultObject);
		return;
	}

	ConnectionResource	connResource	=	null;	
	Connection 			connection 		= null;
	PreparedStatement 	pstmt 			= null;
	ResultSet				rs				= null;			
	StringBuffer query = new StringBuffer();

	try {
		resultObject.put("messaget", "connection");
		connResource	=	new ConnectionResource();		
		connection	=	connResource.getConnection();
		resultObject.put("messaget", "connection end ");
		//key 가져오기
		query.setLength(0);
		query.append(" SELECT SEQ_EVENT_" + eventId + ".nextval seq ");
		query.append(" FROM dual  ");
		pstmt = connection.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		if (rs.next()) {
			seq = rs.getInt("seq");
		}
		pstmt.close();
		pstmt=null;
		rs.close();
		rs=null;
		
		resultObject.put("messaget", "connection select");

		//데이터 저장
		query.setLength(0);
		query.append(" INSERT INTO T_EVENT_" + eventId + "(num, channel, product, name, mobile, addressType, zipcode, address, address2, adAgree, userip, regdate ) ");
		query.append(" VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate ) \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		int idx = 1;
		pstmt.setInt(idx++, seq);
		pstmt.setString(idx++, channel);
		pstmt.setString(idx++, product);
		pstmt.setString(idx++, name);
		pstmt.setString(idx++, mobile);
		pstmt.setString(idx++, addressType);
		pstmt.setString(idx++, zipcode);
		pstmt.setString(idx++, address);
		pstmt.setString(idx++, address2);
		pstmt.setString(idx++, adAgree);
		pstmt.setString(idx++, userIP);		
		if (pstmt.executeUpdate() > 0) {
			resultObject.put("result", new Boolean(true));
			resultObject.put("message", "응모가 완료되었습니다.");
			resultObject.put("TFSXEventNum", seq);
		}
		pstmt.close();
		pstmt=null;
				
		connection.close();
				
	} catch(SQLException se){
		resultObject.put("message", "데이터 처리시 오류가 발생하였습니다.");		
		//resultObject.put("err-message", se.getMessage());		
	} catch(Exception e){
		resultObject.put("message", e.getMessage());		
	} finally {
		if ( rs != null) { rs.close(); }
		if ( pstmt != null) { pstmt.close(); }
		if ( connection != null) { connection.close(); }
		if ( connResource != null) { connResource.release(); }	
	}
	
	//out.println(resultObject);
%><script type="text/javascript" src="/event/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/event/js/jquery.shy4blue.xSubmit.js?<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="/event/js/json2.js"></script>
<script type="text/javascript">
var data = <%=resultObject%>;
$(function() {	
	$.xSubmit.load({
		origin: 'http://<%=request.getServerName()%>:9090/',
		originPath: '/event/xSubmit/xChannel.jsp'
	});
	$.xSubmit.postMessage(data);
});
</script>
			