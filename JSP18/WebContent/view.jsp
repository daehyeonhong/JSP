<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
	<%
		String message = (String) request.getAttribute("message");
	%>
	<%=message%>
</body>
</html>