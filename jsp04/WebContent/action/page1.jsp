<%@page import="dto.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=((MemberBean) session.getAttribute("member")).getName()%>님 환영합니다.
	<a href="page2.jsp">page2로 이동</a>
	<br />
</body>
</html>