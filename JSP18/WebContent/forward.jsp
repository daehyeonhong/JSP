<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORWARD</title>
</head>
<body>
	<%
		request.setAttribute("message", "Forward.jsp Page에서 이동 했어요");
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("forwarded.jsp");
	requestDispatcher.forward(request, response);
	%>
</body>
</html>