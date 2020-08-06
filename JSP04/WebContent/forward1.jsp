<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward1</title>
</head>
<body>
	<h2>이 페이지는 forward된 페이지 입니다.</h2>
	<%=URLDecoder.decode(request.getParameter("message"))%>
</body>
</html>