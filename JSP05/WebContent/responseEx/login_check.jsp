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
		String id = request.getParameter("idname");
	String pw = request.getParameter("pw");
	if (id.equals("hong") & pw.equals("1234")) {
		response.sendRedirect("success.jsp");
		session.setAttribute("id", "hong");
	} else {
		response.sendRedirect("fail.jsp");
	}
	%>
</body>
</html>