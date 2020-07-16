<%@page import="dto.MemberBean"%>
<%@page import="java.net.URLDecoder"%>
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
		MemberBean member = new MemberBean();
	member.setId(Integer.parseInt(request.getParameter("id")));
	member.setName(URLDecoder.decode(request.getParameter("name")));
	%>
	<%=member.getId()%><br />
	<%=member.getName()%><br />
</body>
</html>