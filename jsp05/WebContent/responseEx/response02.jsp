<%@page import="dto.WorldTime"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>이 페이지는 5초마다 새로고침 됩니다.</span>
	<%
		response.setIntHeader("Refresh", 2);
	%>
	<p><%=new Date()%></p>

	<%
		WorldTime worldtime = new WorldTime();
	%>
</body>
</html>