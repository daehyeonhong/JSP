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
		request.setAttribute("id", "hong");
	RequestDispatcher rd = request.getRequestDispatcher("responseHeader.jsp");
	rd.forward(request, response);
	%>
</body>
</html>