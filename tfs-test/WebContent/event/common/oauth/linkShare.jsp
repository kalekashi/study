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

		content 와 image, image title, description (이미지 클릭시 링크로 이동)
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
	
	Param param	= new Param(request);
	String contentData = param.get("scrapContent", ""); // 상단 content
	String urlData = param.get("scrapURL", ""); // image click landing url(trackingURL)
	String requested_urlData = param.get("requested_url", ""); // eventPage url
	String imageData = param.get("scrapImg", ""); //img full url(http://dn-l0-story.kakao.co.kr/dn/cQaWbq/hyiTV0laxs/VMcNaH2PkyBqwq4c7CKCp0/img.jpg?height=316&width=632) :: 링크정보를 얻어오는 api호출이 필요함. 거기서 생성된 이미지 url을 넣어야하네...
	String descriptionData = param.get("scrapDescription", ""); // scrap description

	if (contentData.equals("") || urlData.equals("") || requested_urlData.equals("") || imageData.equals("") || descriptionData.equals("")){
		resultObject.put("message", "데이터가 정합하지 않습니다.");
		out.println(resultObject);
		return;
	}

	
	if( accessToken != null){
		
		try {

			StringBuffer link_Info = new StringBuffer();
			link_Info.append("{ \"url\": \"" + urlData + "\",");
			link_Info.append("  \"requested_url\": \"" + requested_urlData + "\"," );
			link_Info.append("  \"host\": \"www.thefaceshop.com\", ");
			link_Info.append("  \"title\": \"더페이스샵\", ");
			link_Info.append("  \"image\": [\"" + imageData + "\"], ");
			link_Info.append("  \"description\": \"" + descriptionData  + "\",");
			link_Info.append("  \"type\": \"website\", \"section\": \"\" }");

			String scrapContent = contentData;

			String linkPostURL = "https://kapi.kakao.com/v1/api/story/post/link";
			String paramString = "link_info=" + URLEncoder.encode(link_Info.toString()) + "&content=" + URLEncoder.encode(scrapContent);

			URLConnection  urlConnection = new URL(linkPostURL).openConnection();
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