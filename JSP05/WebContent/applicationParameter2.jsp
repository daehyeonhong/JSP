<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 application</title>
</head>
<body>
	<%
		Enumeration<String> enums = application.getInitParameterNames();
	%>

	<%
		while (enums.hasMoreElements()) {
		out.print(enums.nextElement() + "<br />");
	}
	%><br />
	<%
		enums = application.getInitParameterNames();
	while (enums.hasMoreElements()) {
		String key = enums.nextElement();
		String value = application.getInitParameter(key);
		out.print(key + " = " + value + "<br />");
	}
	%>
</body>
</html>