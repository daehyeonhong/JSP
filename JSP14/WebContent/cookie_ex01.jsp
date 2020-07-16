<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		/* 쿠키 생성 new Cookie(name, value); */
	Cookie cookie = new Cookie("name", URLEncoder.encode("홍길동", "UTF-8"));
	/* 브라우저로 쿠키 전송 addCookie(cookie); */
	response.addCookie(cookie);
	%>
	<span>쿠키의 이름: </span>
	<%=cookie.getName()%>
	<br />
	<span>쿠키의 값: </span>
	<%=URLDecoder.decode(cookie.getValue(), "UTF-8")%>
</body>
</html>