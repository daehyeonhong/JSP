<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이 페이지는 첫번째 페이지 입니다.</h1>
	<jsp:include page="included2.jsp">
		<jsp:param value="10" name="num1" />
		<jsp:param value="20" name="num2" />
		<jsp:param value="+" name="op" />
	</jsp:include>
</body>
</html>