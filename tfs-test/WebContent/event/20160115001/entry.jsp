<%@page import="com.lgcare.ecm.db.ConnectionResource"%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
			java.net.*,
			java.sql.*,
			com.efusioni.stone.utils.*,
			com.efusioni.stone.common.*,
			com.efusioni.stone.exception.*,
			com.thefaceshop.front.service.event.*,
			com.thefaceshop.front.common.*" %>
<%@ page import="org.json.simple.*"%>
<%
	out.clear();
	response.setHeader("P3P", "CP=\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\"");
	if (!request.getServerName().equals("dev.thefaceshop.com")) {
		response.setHeader("Access-Control-Allow-Origin", "http://www.thefaceshop.com/");
	}
	//response.setHeader("Access-Control-Allow-Origin", "http://dev.thefaceshop.com/");

	JSONObject resultObject = new JSONObject();
	
	resultObject.put("result", new Boolean(false));
	resultObject.put("message", "");


	ConnectionResource	connResource	=	null;	
	Connection 			connection 		= null;
	PreparedStatement 	pstmt 			= null;
	ResultSet				rs				= null;			
	Param	param	=	new Param(request);

	resultObject.put("_xsid", param.get("_xsid"));

	String channel = param.get("channel", "web");
	String facebook = param.get("facebook", "");
	String kakaotalk = param.get("kakaotalk", "");
	String kakaostory = param.get("kakaostory", "");

	String product = param.get("product", "");
	String name = param.get("name", "");
	String mobile = param.get("mobile", "");
	String addressType = param.get("addressType" , "");
	String zipcode = param.get("zipcode", "");
	String address = param.get("address", "");
	String address2 = param.get("address2", "");
	String adagree = param.get("chkbox_agree3", "N");

	String userIP =	request.getHeader("X-Forwarded-For");
	if(userIP == null || "".equals(userIP)){
		userIP = request.getRemoteAddr();
	}	


	if (channel.equals("") || product.equals("") || name.equals("") ||  mobile.equals("") || addressType.equals("") || zipcode.equals("") || address.equals("") || address2.equals("") ){
		resultObject.put("message", "데이터가 정확하지 않습니다.");
		out.println(resultObject);
		return;
	}

	StringBuffer query = new StringBuffer();    

	try {
		connResource = new ConnectionResource();
		
		connection = connResource.getConnection();

		connection.setAutoCommit(false);

		query.setLength(0);
		query.append(" INSERT INTO T_EVENT_20160115(num, channel, name, mobile, addressType, zipcode, address, address2, adagree, product, facebook, kakaotalk, kakaostory, userip, regdate) ");
		query.append(" VALUES( SEQ_EVENT_20160115.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate) \n");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
		int idx = 1;
		pstmt.setString(idx++, channel);
		pstmt.setString(idx++, name);
		pstmt.setString(idx++, mobile);
		pstmt.setString(idx++, addressType);
		pstmt.setString(idx++, zipcode);
		pstmt.setString(idx++, address);
		pstmt.setString(idx++, address2);
		pstmt.setString(idx++, adagree);
		pstmt.setString(idx++, product);
		pstmt.setString(idx++, facebook);
		pstmt.setString(idx++, kakaotalk);
		pstmt.setString(idx++, kakaostory);		
		pstmt.setString(idx++, userIP);		
		if (pstmt.executeUpdate() > 0) {
			resultObject.put("result", new Boolean(true));
			resultObject.put("message", "응모가 완료되었습니다. 감사합니다");
		}

		pstmt.close();
		pstmt=null;


		/*
		query.setLength(0);
		query.append(" select count(*) cnt from T_EVENT_20160115 ");
		pstmt = connection.prepareStatement(query.toString());
				
		rs = pstmt.executeQuery();
		if (rs.next()) {
			out.println(rs.getInt("cnt"));
		}
		pstmt.close();
		rs.close();
		pstmt = null;
		rs = null;
		*/

		connection.commit();

		connection.close();
				
	} catch(Exception e){
		resultObject.put("message", e.toString());		
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
		origin: 'http://<%=request.getServerName()%>/',
		originPath: '/event/xSubmit/xChannel.jsp'
	});
	$.xSubmit.postMessage(data);
});
</script>
			