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
	
	String snsType = param.get("sns","");
	String snsId = param.get("snsId","");
	String snsName = param.get("snsName","");
	String scrapURL = param.get("scrapURL","");
	String num = (String)session.getAttribute("event20151221001");
	int eventNum = 0;
	int seq = 0;

	String userIP =	request.getHeader("X-Forwarded-For");
	if(userIP == null || "".equals(userIP)){
		userIP = request.getRemoteAddr();
	}	
	ConnectionResource connResource = null;	
	Connection 			connection 		= null;
	PreparedStatement 	pstmt 			= null;
	ResultSet				rs				= null;			
	StringBuffer query = new StringBuffer();

	int count = 0;
	try {
		connResource	=	new ConnectionResource();		
		connection	=	connResource.getConnection();
		
		if (num.equals("") || snsType.equals("")){	
			throw new Exception("올바른 경로로 접근해주세요.");
		}
		eventNum = Integer.parseInt(num);

		//페이스북
		if (snsType.equals("facebook") && (snsId.equals("") || snsName.equals("") || scrapURL.equals(""))) {
			throw new Exception("올바른 경로로 접근해주세요..");
		}

		//카카오스토리
		if (snsType.equals("kakaostory") && (snsId.equals("") || scrapURL.equals(""))) {
			throw new Exception("올바른 경로로 접근해주세요..");
		}

		//참여 확인
		query.setLength(0);
		query.append(" SELECT COUNT(*) cnt FROM T_EVENT_" + eventId + " WHERE num = ? ");
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1 , eventNum);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			count = rs.getInt("cnt");
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;

		if (count <= 0){
			throw new Exception("새로고침 후 다시 이용해 주세요.");
		}
		
		//key 가져오기
		query.setLength(0);
		query.append(" SELECT SEQ_EVENT_20151221001_SNS.nextval seq ");
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
		query.append(" INSERT INTO T_EVENT_20151221001_SNS(num, eventNum, sns, snsId, snsName, scrapURL, regDate) ");
		query.append(" VALUES(?, ?, ?, ?, ?, ?, sysdate) \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		int idx = 1;
		pstmt.setInt(idx++, seq);
		pstmt.setInt(idx++, eventNum);
		pstmt.setString(idx++, snsType);
		pstmt.setString(idx++, snsId);
		pstmt.setString(idx++, snsName);
		pstmt.setString(idx++, scrapURL);
		if (pstmt.executeUpdate() > 0) {
			resultObject.put("result", new Boolean(true));
			resultObject.put("message", "다른 SNS로도 공유해주세요!^^");
		}
		pstmt.close();
		pstmt=null;

		//공유수 확인
		int fbCount = 0;
		int ksCount = 0;
		int ktCount = 0;
		int totalSharingCount = 0;
		query.setLength(0);
		query.append(" SELECT COUNT(*) cnt FROM T_EVENT_20151221001_SNS WHERE eventNum = ? and sns = ? ");

		//페이스북
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1 , eventNum);
		pstmt.setString(2 , "facebook");
		rs = pstmt.executeQuery();
		if (rs.next()) {
			fbCount = rs.getInt("cnt");
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;
		//카스
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1 , eventNum);
		pstmt.setString(2 , "kakaostory");
		rs = pstmt.executeQuery();
		if (rs.next()) {
			ksCount = rs.getInt("cnt");
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;
		//카톡
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1 , eventNum);
		pstmt.setString(2 , "kakaotalk");
		rs = pstmt.executeQuery();
		if (rs.next()) {
			ktCount = rs.getInt("cnt");
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;

		totalSharingCount = fbCount + ksCount + ktCount;

		//카운트 업데이트
		query.setLength(0);
		query.append(" UPDATE T_EVENT_20151221001 SET sharingCount = ?, fbSharingCount = ?, ksSharingCount = ?, ktSharingCount = ? WHERE num = ?  \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		pstmt.setInt(1, totalSharingCount);
		pstmt.setInt(2, fbCount);
		pstmt.setInt(3, ksCount);
		pstmt.setInt(4, ktCount);
		pstmt.setInt(5, eventNum);
		if (pstmt.executeUpdate() > 0) {
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