<%@page import="dto.Fruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Fruit fruit1 = (Fruit) request.getAttribute("fruit1");
	%>
	<h5>
		과일명:
		<%=fruit1.getKind()%>
	</h5>
	<h5>
		가격:
		<%=fruit1.getPrice()%>
	</h5>
</body>
</html>