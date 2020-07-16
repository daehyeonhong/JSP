<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag</title>
</head>
<body>
	<jsp:forward page="forward1.jsp">
		<jsp:param
			value="<%=URLEncoder.encode(\"<h1>이 페이지는 첫번째 페이지 입니다.</h1>\")%>"
			name="message" />
	</jsp:forward>
</body>
</html>