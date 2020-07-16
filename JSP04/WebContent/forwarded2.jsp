<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forwarded2</title>
</head>
<body>
	<p>
		<!-- request객체는 페이지간 객체를 전송하는 객체 -->
		아이디:
		<%=request.getParameter("id")%>
	</p>
	<p>
		<%
			String name = request.getParameter("name");
		%>
	</p>
	<p>
		이름:
		<%=URLDecoder.decode(name, "UTF-8")%>
	</p>
	<p>
		패스워드:<%=request.getParameter("password")%>
</body>
</html>