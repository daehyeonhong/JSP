<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="page_isErrorPage_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류를 발생 시키는 페이지</title>
</head>
<body>	
	<%
		int i = 10;
	out.print(i / 0);
	%>
</body>
</html>