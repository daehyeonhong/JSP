<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestEelements</h1>
	<%
		request.setCharacterEncoding("UTF-8");
	Enumeration<String> paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String name = paramNames.nextElement();
		out.print(name + " = " + request.getParameter(name) + "<br/ >");
	}
	%>
</body>
</html>