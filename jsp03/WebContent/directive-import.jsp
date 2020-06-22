<%@page import="java.util.Calendar"%><!-- import 속성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	오늘은
	<%=cal.get(Calendar.YEAR)%>월
	<%=cal.get(Calendar.MONTH) + 1%>월
	<!-- 월+1 -->
	<%=cal.get(Calendar.DATE)%>일
</body>
</html>