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
	<h3>이 페이지는 요청한 페이지 입니다.</h3>
	<jsp:include page="result.jsp">
		<jsp:param
			value='<%=URLEncoder.encode("<h3>이 페이지는 요청한 페이지 입니다.</h3>")%>'
			name="message" />
		<jsp:param value="1" name="num1" />
		<jsp:param value="2" name="num2" />
		<jsp:param value="+" name="op" />
	</jsp:include>
	<br>
	<h3>이 페이지의 끝 부분 입니다.</h3>
</body>
</html>