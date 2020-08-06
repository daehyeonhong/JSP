<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>에러가 발생하였습니다.</h4>
	<h5>Exception 내장 객체 변수</h5>
	<%
		exception.printStackTrace(new PrintWriter(out));
	%>
</body>
</html>