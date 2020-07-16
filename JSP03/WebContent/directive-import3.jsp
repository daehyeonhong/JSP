<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 데이터 출력</title>
</head>
<body>
	<%@ page import="java.util.Date"%><!-- import 속성은 사용	직전에 표기 가능 -->
	Today is
	<%=new Date()%>
</body>
</html>