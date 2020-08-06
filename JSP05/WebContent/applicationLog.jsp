<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그 메시지 기록</title>
</head>
<body>
	<%
		application.log("로그메시지 기록");
	%>
	<h4>로그 메시지를 기록합니다.</h4>
	<%
		log("로그메시지 기록2");
	%>
</body>
</html>