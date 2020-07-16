<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이 페이지는 nextPage입니다.</h3>
	<%
		/* 현재 페이지의 문자셋 설정 */
	String name = URLDecoder.decode(request.getParameter("name"));
	%><%=name%>
</body>
</html>