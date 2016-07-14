<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
				java.net.*,
				java.io.*,
				javax.net.ssl.HttpsURLConnection,
				com.efusioni.stone.utils.*,
				com.thefaceshop.front.common.*" %>
<%@ page import="org.json.simple.*"%>
<%
	out.clear();

	/*
		kakaotalk api 적용 (2016.03.10)
		by jjung

		content 와 image(이미지 클릭시 링크X)
	*/

	response.setHeader("Cache-Control", "no-store");   
	response.setHeader("Pragma", "no-cache");   
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1")) { 
		response.setHeader("Cache-Control", "no-cache");
	}

	// json setting
	JSONObject resultObject = new JSONObject();
	resultObject.put("result", new Boolean(false));
	resultObject.put("message", "");
	
	String accessToken = (String)session.getAttribute("kakao_accessToken");
	
	Param	param	=	new Param(request);
	String imgData = param.get("scrapImg", "");
	String contentData = param.get("scrapContent", "");

	if (imgData.equals("") || contentData.equals("")){
		resultObject.put("message", "스크랩할 이미지 또는 내용이 없습니다.");
		out.println(resultObject);
		return;
	}


	if( accessToken != null){
		
		try {

			String scrapImg = "[\"" + imgData + "\"]";
			String scrapContent = contentData;

			String imgUploadURL = "https://kapi.kakao.com/v1/api/story/post/photo";
			String paramString = "image_url_list=" + URLEncoder.encode(scrapImg) + "&content=" + URLEncoder.encode(scrapContent);

			URLConnection  urlConnection = new URL(imgUploadURL).openConnection();
			HttpsURLConnection connection = (HttpsURLConnection)urlConnection;
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setUseCaches(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization" , "Bearer " + accessToken);
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			BufferedWriter buffWriter = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
			
			buffWriter.write(paramString);
			buffWriter.flush();
			buffWriter.close();

			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String data = "";
			StringBuffer sb = new StringBuffer();
			while ((data = br.readLine()) != null){
				sb.append(data);
			}

			JSONObject responseJSON = (JSONObject)JSONValue.parse(sb.toString());
			String scrapId = (String)responseJSON.get("id");
			if (!scrapId.equals("")){
				resultObject.put("result", new Boolean(true));
				resultObject.put("message", "정상처리 되었습니다");
				resultObject.put("postId", scrapId);
			}

		} catch (Exception e){
			resultObject.put("message", e.toString());
		} finally{
		
		}

	} else { 
		resultObject.put("message", "카카오 로그인 후 이용해주세요");	
	}

	out.println(resultObject);
	return;

%>