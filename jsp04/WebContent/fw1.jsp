<%@page import="f.dto.MemberBean"%>
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
		/* MemberBean member = (MemberBean) request.getAttribute("member"); */
	/* MemberBean member = (MemberBean) session.getAttribute("member"); */
	MemberBean member = (MemberBean) application.getAttribute("member");
	%>
	<%=member.getId()%>
	<br />
	<%=member.getName()%>
	<br />
</body>
</html>