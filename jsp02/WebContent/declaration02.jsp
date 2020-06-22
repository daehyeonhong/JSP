<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전역변수(멤버변수)선언</title>
</head>
<body>
	<!-- 전역변수 선언 -->
	<%!int data = 50;%>
	<!-- 스크립틀릿에서 출력 -->
	<%
		out.print("Value of the variable is: " + data);
	%>
</body>
</html>