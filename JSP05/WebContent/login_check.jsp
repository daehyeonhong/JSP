<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogInCheck</title>
</head>
<body>
	<%
		String id = request.getParameter("id"), pw = request.getParameter("pw");

	if (id.equals("hong") & pw.equals("1234")) {
		response.sendRedirect("success.jsp");
	} else {
		response.sendRedirect("fail.jsp");
	}
	%>
</body>
</html>