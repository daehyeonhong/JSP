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
	<%=((MemberBean) session.getAttribute("member")).getName()%>님 여기는
	<h3>page2 페이지</h3>
	입니다.
	<h4>로그아웃 합니다.</h4>
	<%
		session.invalidate();
	%>
</body>
</html>