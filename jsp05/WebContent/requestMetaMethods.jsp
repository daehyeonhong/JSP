<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestMetaMethod</title>
</head>
<body>
	<%=request.getServerName()%><br />
	<!-- localhost -->

	<%=request.getServerPort()%><br />
	<!-- 8181 -->

	<%=request.getServletPath()%><br />
	<!-- /requestMetaMethods.jsp -->

	<%=request.getRemoteAddr()%><br />
	<!-- /jsp05/requestMetaMethods.jsp -->

	<%=request.getRequestURL()%><br />
	<!-- <!-- http://localhost:8181/jsp05/requestMetaMethods.jsp -->

	<%=request.getRequestURI()%><br />

	<%=request.getContextPath()%><br />
	<!-- /jsp05 -->

	<%
		int index = request.getServletPath().lastIndexOf('.');
	String commandName = request.getServletPath().substring(1, index);
	%><br />

	<%=commandName%>
</body>
</html>