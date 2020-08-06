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
		String id = request.getParameter("id"), passwd = request.getParameter("passwd");
	%>
	<p>
		입력된 ID값:
		<%=id%>
	</p>
	<p>
		입력된 비밀번호:
		<%=passwd%>
	</p>
</body>
</html>