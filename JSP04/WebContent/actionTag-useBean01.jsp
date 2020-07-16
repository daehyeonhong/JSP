<%@page import="java.net.URLEncoder"%>
<%@page import="dto.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag-useBean</title>
</head>
<body>
	<%
		MemberBean m = new MemberBean();
	m.setId(1);
	m.setName("홍길동");
	%>
	<jsp:forward page="beanResult.jsp"><jsp:param
			value="<%=m.getId()%>" name="id" />
		<jsp:param value="<%=URLEncoder.encode(m.getName())%>" name="name" /></jsp:forward>
</body>
</html>