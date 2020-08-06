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
	<jsp:forward page="result.jsp">
		<jsp:param
			value='<%=URLEncoder.encode("<h3>이 페이지는 요청 페이지입니다.</h3>")%>'
			name="message" />
		<jsp:param value="1" name="num1" /><jsp:param value="2" name="num2" /><jsp:param
			value="+" name="op" /></jsp:forward>
</body>
</html>