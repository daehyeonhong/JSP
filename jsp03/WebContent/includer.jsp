<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드 디렉티브</title>
</head>
<body>
	<%
		int number = 10;
	%>
	<!-- 디렉티브를 이용한 파일 병합: 컴파일시 병합된 형태로 생성. -->
	<%@ include file="includee.jsp"%>
	공통변수 DATAFOLDER="<%=dataFolder%>"
</body>
</html>