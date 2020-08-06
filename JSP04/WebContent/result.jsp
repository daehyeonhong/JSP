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
	<h3>이 페이지는 결과 페이지입니다.</h3>
	<!-- 현재 페이지의 맞도록 문자셋 설정 -->
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%=URLDecoder.decode((request.getParameter("message")))%>
	<%=request.getParameter("num1")%>
	<%=request.getParameter("op")%>
	<%=request.getParameter("num2")%>
	<%="="%>
	<%=Integer.parseInt(request.getParameter("num1")) + Integer.parseInt(request.getParameter("num2"))%>
</body>
</html>