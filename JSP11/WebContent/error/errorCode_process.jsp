<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Divide</title>
</head>
<body>
	<%
		String num1 = request.getParameter("num1"), num2 = request.getParameter("num2");
	int a = Integer.parseInt(num1), b = Integer.parseInt(num2), c = a / b;
	out.print(num1 + " / " + num2 + " = " + c);
	%>
</body>
</html>