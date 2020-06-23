<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action Tag</title>
</head>
<body>

	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E요일)");
	String sDate = sdf.format(new Date());
	%>
	<h2>
		오늘은
		<%=sDate%>
		입니다.
	</h2>
</body>
</html>