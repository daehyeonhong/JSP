<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장객체 메소드</title>
</head>
<body>
	<%
		/* 내장객체에 저장하기 setAttribute(이름, 객체);
	request, session, application, page*/
	session.setAttribute("message", "하이영");
	%>
	
	<!-- 내장객체에 저장된 객체 출력 getAttribute(이름); -->
	<%=session.getAttribute("message")%>
	
	<%
		/* 내장객체에 저장된 객체들의 이름 출력하기 getAttributeNames() */
	Enumeration<String> names = session.getAttributeNames();
	out.print("<br/ >");
	while (names.hasMoreElements()) {
		String name = names.nextElement();
		out.print(name + " = " + session.getAttribute(name) + "<br />");
	}
	%>
	
	<%
		/* 내장객체에 저장된 객체 제거 removeAttribute(이름) */
	session.removeAttribute("message");
	%>
	
	<%=session.getAttribute("message")%>
</body>
</html>