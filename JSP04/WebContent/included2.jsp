<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이 페이지는 포함되는 페이지 입니다.</h2>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1")), num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	int result = (op.equals("+") ? (num1 + num2) : (num1 - num2));
	out.print(result);//Browser에게 전달
	%>
</body>
</html>