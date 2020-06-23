<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag-include</title>
</head>
<body>
	<h3>이 파일은 first.jsp파일 입니다.</h3>
	<%@include file="second.jsp"%>
	<jsp:include page="second.jsp" />
	<p>Java Server Page</p>
</body>
</html>