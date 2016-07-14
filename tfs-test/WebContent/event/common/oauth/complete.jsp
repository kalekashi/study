<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
				java.net.*,
				java.io.*,
				javax.net.ssl.HttpsURLConnection,
				com.efusioni.stone.utils.*,
				com.thefaceshop.front.common.*" %>
<%@ page import="org.json.simple.*"%>
<%
	/*
		kakaotalk api 적용 (2016.03.10)
		by jjung
	*/

	String kakaoKey = "3e31a77ccfa90808c4a9a0ddb9193bca";
	String redirectURL = "http://" + request.getServerName() + "/event/common/oauth/complete.jsp";

	Param param = new Param(request);
	String code = param.get("code", "");
	boolean result = false;
	String resultMessage = "";

	if( !code.equals("") ){
		String returnAccessToken = "https://kauth.kakao.com/oauth/token";
		String paramString = "client_id=" + URLEncoder.encode(kakaoKey) + "&grant_type=authorization_code&code=" +  URLEncoder.encode(code) + "&redirect_uri=" + URLEncoder.encode(redirectURL);
		try {
			URLConnection urlConnection = new URL(returnAccessToken).openConnection();
			HttpsURLConnection connection = (HttpsURLConnection)urlConnection;
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
			BufferedWriter buffWriter = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
			
			buffWriter.write(paramString);
			buffWriter.flush();
			buffWriter.close();

			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String data = "";
			while ((data = br.readLine()) != null){
				sb.append(data);
			}

			JSONObject responseJSON = (JSONObject)JSONValue.parse(sb.toString());
			String access_token = (String)responseJSON.get("access_token");
			session.setAttribute("kakao_accessToken" , access_token);
			result = true;
		} catch (Exception e){
			resultMessage = e.toString();
		} finally{
		
		}

	}

%>

<%	if (result){ %>
	<script>
		opener.loginComplete();
		self.close();
	</script>
<%	}  %>