<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action Tag</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>
	<jsp:forward page="second.jsp" /><!-- 단독 태그 -->
	<p>===first.jsp의 페이지===</p>
</body>
</html>