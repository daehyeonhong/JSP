<%@page import="java.net.URLEncoder"%>
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
		/* name = hong */
	String name = request.getParameter("name");
	%>
	<!-- name = 홍길동 -->
	<jsp:forward page="nextPage.jsp">
		<jsp:param value='<%=URLEncoder.encode("홍길동")%>' name="name" />
	</jsp:forward>
</body>
</html>