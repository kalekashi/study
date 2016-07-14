<%@page import="com.lgcare.ecm.db.ConnectionResource"%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/mall/error/error.jsp"
	import="com.efusioni.stone.utils.*,
			java.sql.*,
			com.thefaceshop.front.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.*"%>
<%
	out.clear();
	
	Param	param	=	new Param(request);

	// json setting
	JSONObject resultObject = new JSONObject();
	resultObject.put("result", new Boolean(false));
	resultObject.put("message", "");

	String eventId = "20160315001";
	
	String snsType = param.get("snsType","");
	String snsId = param.get("snsId","");
	String snsName = param.get("snsName","");
	String scrapURL = param.get("scrapURL","");
	int eventSeq = param.getInt("eventSeq", 0);

	String userIP =	request.getHeader("X-Forwarded-For");
	if(userIP == null || "".equals(userIP)){
		userIP = request.getRemoteAddr();
	}
	
	if (snsType.equals("") || scrapURL.equals("") || eventSeq == 0) {
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
		connResource	=	new ConnectionResource();		
		connection	=	connResource.getConnection();
	

		//참여 확인
		query.setLength(0);
		query.append(" SELECT COUNT(*) cnt FROM T_EVENT_" + eventId + " WHERE num = ? ");
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1 , eventSeq);
		rs = pstmt.executeQuery();
		if (rs.next() && rs.getInt("cnt") <= 0) {
			throw new Exception("이벤트 응모 후 이용해주세요");
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;
		
		//데이터 저장
		query.setLength(0);
		query.append(" INSERT INTO T_EVENT_" + eventId + "_SNS(num, eventNum, sns, snsId, snsName, scrapURL, userip, regDate) ");
		query.append(" VALUES(SEQ_EVENT_" + eventId + "_SNS.nextval, ?, ?, ?, ?, ?, ?, sysdate) \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		int idx = 1;
		pstmt.setInt(idx++, eventSeq);
		pstmt.setString(idx++, snsType);
		pstmt.setString(idx++, snsId);
		pstmt.setString(idx++, snsName);
		pstmt.setString(idx++, scrapURL);
		pstmt.setString(idx++, userIP);
		if (pstmt.executeUpdate() > 0) {
			resultObject.put("result", new Boolean(true));
			resultObject.put("message", "다른 SNS로도 공유해주세요!^^");
		}
		pstmt.close();
		pstmt=null;
		
		connection.close();
				
	} catch(SQLException se){
		resultObject.put("message", "데이터 처리시 오류가 발생하였습니다.");		
		//resultObject.put("err-message", se.getMessage());		
	} catch(Exception e){
		resultObject.put("message", e.getMessage());		
	}  finally {
		if ( rs != null) { rs.close(); }
		if ( pstmt != null) { pstmt.close(); }
		if ( connection != null) { connection.close(); }
		if ( connResource != null) { connResource.release(); }	
	}

	out.println(resultObject);
%>