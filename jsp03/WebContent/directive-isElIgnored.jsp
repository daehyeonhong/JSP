<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!-- EL 기능 무력화하는 태그 [isELIgnored = true] -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestAttribute</title>
</head>
<body>
	<%
		request.setAttribute("RequestAttribute", "A 내장 객체");
	%>
	<!-- EL(Expression language) -> 표현식 -->
	<%-- ${} -> 출력 기능 <%= %>와 같은 기능 --%>
	${requestScope.RequestAttribute }
</body>
</html>