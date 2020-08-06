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
		String hostValue = request.getHeader("host");
	String alValue = request.getHeader("accept-language");
	%>
	<span>호스트 명: <%=hostValue%><br /></span>
	<span>설정 언어:<%=alValue%><br /></span>
</body>
</html>