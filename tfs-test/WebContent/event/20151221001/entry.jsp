<%@page import="com.lgcare.ecm.db.ConnectionResource"%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/mall/error/error.jsp"
	import="com.efusioni.stone.utils.*,
			java.sql.*,
			com.thefaceshop.front.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.*"%>
<%
	out.clear();

	if (request.getServerName().equals("www.thefaceshop.com:343")) {
		response.setHeader("Access-Control-Allow-Origin", "http://www.thefaceshop.com");
	}

	Param	param	=	new Param(request);

	// json setting
	JSONObject resultObject = new JSONObject();
	resultObject.put("result", new Boolean(false));
	resultObject.put("message", "");

	String eventId = "20151221001";
	
	String channel = param.get("channel", "");
	String worryType = param.get("worryType", "");	
	String name = param.get("name","");
	String mobile = param.get("mobile","");
	String zipcode = param.get("zipcode","");
	String address1 = param.get("address1","");
	String address2 = param.get("address2","");
	String addressType = param.get("addressType", "");
	String isAgreeAgent = param.get("isAgreeAgent", "N");

	int seq = 0;
	String userIP =	request.getHeader("X-Forwarded-For");
	if(userIP == null || "".equals(userIP)){
		userIP = request.getRemoteAddr();
	}

	ConnectionResource	connResource	=	null;	
	Connection 			connection 		= null;
	PreparedStatement 	pstmt 			= null;
	ResultSet				rs				= null;			
	StringBuffer query = new StringBuffer();

	try {
		connResource	=	new ConnectionResource();		
		connection	=	connResource.getConnection();

		if (channel.equals("") || worryType.equals("") || name.equals("") || mobile.equals("") || zipcode.equals("") || address1.equals("") || address2.equals("") || addressType.equals("")){	
			throw new Exception("올바른 경로로 접근해주세요..");
		}
				
		//key 가져오기
		query.setLength(0);
		query.append(" SELECT SEQ_EVENT_20151221001.nextval seq ");
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

		//데이터 저장
		query.setLength(0);
		query.append(" INSERT INTO T_EVENT_20151221001(num, channel, worryType, name, mobile, zipcode, address1, address2, addressType, isAgreeAgent, userIP, regDate) ");
		query.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate) \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		int idx = 1;
		pstmt.setInt(idx++, seq);
		pstmt.setString(idx++, channel);
		pstmt.setString(idx++, worryType);
		pstmt.setString(idx++, name);
		pstmt.setString(idx++, mobile);
		pstmt.setString(idx++, zipcode);
		pstmt.setString(idx++, address1);
		pstmt.setString(idx++, address2);
		pstmt.setString(idx++, addressType);
		pstmt.setString(idx++, isAgreeAgent);
		pstmt.setString(idx++, userIP);		
		if (pstmt.executeUpdate() > 0) {
			resultObject.put("result", new Boolean(true));
			resultObject.put("message", "신청이 완료되었습니다. SNS공유시 당첨 확률이 높아집니다!");
			session.setAttribute("event20151221001", seq+"");
		}
		pstmt.close();
		pstmt=null;
				
		connection.close();
				
	} catch(Exception e){
		resultObject.put("message", e.getMessage());		
	} finally {
		if ( rs != null) { rs.close(); }
		if ( pstmt != null) { pstmt.close(); }
		if ( connection != null) { connection.close(); }
		if ( connResource != null) { connResource.release(); }	
	}
	
	out.println(resultObject);
%>