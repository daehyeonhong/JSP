<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="16kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buffer 사이즈 지정</title>
</head>
<body>
	Today is:
	<%=new Date()%><br>
	<%=out.getBufferSize()%><!-- 페이지의 지정 버퍼사이즈 출력 -->
</body>
</html>