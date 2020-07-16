<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- useBean을 객체 생성, scope=page - default -->
	<jsp:useBean id="bean" class="dto.Calculator" />
	<%
		int m = bean.process(5);
	out.print("5^3= " + m);
	%><br />
</body>
</html>