<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식에 함수 호출</title>
</head>
<body>
	<p>
		<!-- 함수의 호출 결과 출력 -->
		Today's Date:<%=new Date()%><!-- Date().toString() -->
	</p>
</body>
</html>