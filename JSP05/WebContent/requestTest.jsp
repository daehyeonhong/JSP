<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 request</title>
</head>
<body>
	<ol>
		<li>getServerName[서버명]: <%=request.getServerName()%></li>
		<li>getServerPort[포트 번호]: <%=request.getServerPort()%></li>
		<li>getRemoteAddr[클라이언트 주소]: <%=request.getRemoteAddr()%></li>
		<li>getRemoteHost[클라이언트 호스트]: <%=request.getRemoteHost()%></li>
		<li>getServletPath[경로]: <%=request.getServletPath()%></li>
		<li>getServletContext[컨텍스트 정보]: <%=request.getServletContext()%></li>
		<li>getMethod[요청 방식]: <%=request.getMethod()%></li>
		<li>getRequestURI[URI정보(경로-포트 번호까지의 정보)]: <%=request.getRequestURI()%></li>
		<li>getRequestURL[URL정보]: <%=request.getRequestURL()%></li>
		<li>getContextPath[APPLICATION정보]: <%=request.getContextPath()%></li>
		<%
			int index = request.getRequestURL().lastIndexOf("/");
		String fileName = request.getRequestURL().substring(index + 1);
		%>
		<li><%=index%></li>
		<li><%=fileName%></li>
		<li><%=fileName.substring(0, fileName.indexOf("."))%></li>
	</ol>
</body>
</html>