<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>nextPage</h1>
	<%
		request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("name");
	%>
	<%=message%>
</body>
</html>