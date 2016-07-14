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

	JSONObject resultObject = new JSONObject();
	resultObject.put("result", new Boolean(false));
	resultObject.put("product", new Integer(0));
	resultObject.put("productImg", "result_chia1"); // 1: chia 2: mango 3: oil
	resultObject.put("productDetailImg", "result_chia_txt");
	resultObject.put("productURL", "AF004021");
	resultObject.put("productURLImg", "btn_detail_chia");
	resultObject.put("message", "실패");


	int productNum = (int)(Math.random() * 3 ) + 1;
	int DetailNum = (int)(Math.random() * 3 ) + 1;
	// 1: chia 2: mango 3: oil
	if (productNum == 1){
		resultObject.put("result", new Boolean(true));
		resultObject.put("product", new Integer(productNum));
		resultObject.put("productImg", "result_chia" + DetailNum); 
		resultObject.put("productDetailImg", "result_chia_txt");
		resultObject.put("productURL", "AF004021");
		resultObject.put("productURLImg", "btn_detail_chia");
		resultObject.put("message", "완료");
	} else if (productNum == 2){
		resultObject.put("result", new Boolean(true));
		resultObject.put("product", new Integer(productNum));
		resultObject.put("productImg", "result_mango" + DetailNum); 
		resultObject.put("productDetailImg", "result_mango_txt");
		resultObject.put("productURL", "AF003113");
		resultObject.put("productURLImg", "btn_detail_mango");
		resultObject.put("message", "완료");
	} else if (productNum == 3){
		resultObject.put("result", new Boolean(true));
		resultObject.put("product", new Integer(productNum));
		resultObject.put("productImg", "result_oil" + DetailNum); 
		resultObject.put("productDetailImg", "result_oil_txt");
		resultObject.put("productURL", "AF004020");
		resultObject.put("productURLImg", "btn_detail_oil");
		resultObject.put("message", "완료");
	}

	out.println(resultObject);

	/*ConnectionResource	connResource	=	null;	
	Connection 			connection 		= null;
	PreparedStatement 	pstmt 			= null;
	ResultSet				rs				= null;			
	Param	param	=	new Param(request);

	StringBuffer query = new StringBuffer();    
	boolean result = false;
	int resultNum = 1;
	int randomNum = 0;

	try {
		connResource = new ConnectionResource();
		
		connection = connResource.getConnection();

		connection.setAutoCommit(false);

		query.setLength(0);
		query.append(" SELECT MOD(count(*), 3) result FROM T_EVENT_20160115 ");
		//out.println(query.toString());
		pstmt = connection.prepareStatement(query.toString());
				
		rs = pstmt.executeQuery();
		if ( rs.next()) {
			resultNum = rs.getInt("result");
			randomNum = (int)(Math.random() * 3 ) + 1;
			result = true;
		}

		rs.close();
		rs=null;
		pstmt.close();
		pstmt=null;


		connection.commit();

		connection.close();

		resultObject.put("result", new Boolean(true));
		resultObject.put("product", new Integer(resultNum) + 1);
		resultObject.put("message", "정상 처리되었습니다.");
				
	} catch(Exception e){
		resultObject.put("message", e.toString());		
	} finally {
		if ( rs != null) { rs.close(); }
		if ( pstmt != null) { pstmt.close(); }
		if ( connection != null) { connection.close(); }
		if ( connResource != null) { connResource.release(); }	
	}

	if (result){
		// 1: chia 2: mango 3: oil
		if (resultNum == 0){
			resultObject.put("productImg", "result_chia" + randomNum); 
			resultObject.put("productDetailImg", "result_chia_txt");
		} else if (resultNum == 1){
			resultObject.put("productImg", "result_mango" + randomNum); 
			resultObject.put("productDetailImg", "result_mango_txt");
		} else {
			resultObject.put("productImg", "result_oil" + randomNum); 
			resultObject.put("productDetailImg", "result_oil_txt");
		}
	}

	*/


%>