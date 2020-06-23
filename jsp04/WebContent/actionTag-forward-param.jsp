<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 first 페이지 파일입니다.</h3>
	<%
		String pwd = "1234";
	%>
	<jsp:forward page="forwarded2.jsp">
		<jsp:param value="admin" name="id" />

		<jsp:param value="<%=URLEncoder.encode(\"관리자\", \"UTF-8\")%>"
			name="name" />

		<jsp:param value="<%=pwd%>" name="password" />
	</jsp:forward>

	<%-- %EA%B4%80%EB%A6%AC%EC%9E%90 인코딩 없이 보내면 --%>
	<%-- password = 1234 --%>
</body>
</html>