<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>V2</title>
</head>
<body>
	<h2>메롱</h2>
	<%-- 스크립틀릿 --%>
	<%
		String message = (String) request.getAttribute("message");
	%>
	<%-- <%=message%> --%>
	<label>인삿말: </label>${message}<br />
	<%-- EL 표현식 --%>
	<label>현재 시간: </label>${now}
</body>
</html>