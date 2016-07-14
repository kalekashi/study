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
	
	response.setHeader("Access-Control-Allow-Origin", "*");
%><!DOCTYPE html>

<html>
<body>
  <h2>XDomainRequest</h2>
  <input type="text" id="tbURL" value="https://www.thefaceshop.com:343/m/event/20160226001/entry.jsp" style="width: 300px"><br>
  <input type="text" id="tbTO" value="10000"><br>
  <input type="button" onclick="mytest()" value="Get">&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="stopdata()" value="Stop">&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="readdata()" value="Read">
  <br>
  <div id="dResponse"></div>
  <script>
    var xdr;
    function readdata()
    {
      var dRes = document.getElementById('dResponse');
      dRes.innerText = xdr.responseText;
      alert("Content-type: " + xdr.contentType);
      alert("Length: " + xdr.responseText.length);
    }
    
    function err()
    {
      alert("XDR onerror");
    }

    function timeo()
    {
      alert("XDR ontimeout");
    }

    function loadd()
    {
      alert("XDR onload");
      alert("Got: " + xdr.responseText);
    }

    function progres()
    {
      alert("XDR onprogress");
      alert("Got: " + xdr.responseText);
    }

    function stopdata()
    {
      xdr.abort();
    }

    function mytest()
    {
      var url = document.getElementById('tbURL');
      var timeout = document.getElementById('tbTO');
      if (window.XDomainRequest)
      {
        xdr = new XDomainRequest();
        if (xdr)
        {
          xdr.onerror = err;
          xdr.ontimeout = timeo;
          xdr.onprogress = progres;
          xdr.onload = loadd;
          xdr.timeout = tbTO.value;
          xdr.open("post", tbURL.value);
          xdr.send();
        }
        else
        {
          alert("Failed to create");
        }
      }
      else
      {
        alert("XDR doesn't exist");
      }
    }
  </script>
</body>
</html>

