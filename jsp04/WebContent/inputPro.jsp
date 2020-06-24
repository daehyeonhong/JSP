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
		/* HTML에서 전송되는 InputData_String으로 전달:Parameter */
	/* getParameter(name) */
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	%>
	<%=name%><br />
	<%=age%><br />
</body>
</html>