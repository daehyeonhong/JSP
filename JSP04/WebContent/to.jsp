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
		/* request의 속성으로 Object가 name=value(Object); 형태로 전달
	객체를 얻기 위해서 (Type) request.getAttribute(name); */
	String name = (String) request.getAttribute("name");
	String age = (String) request.getAttribute("age");
	%>
	<%=name%><br />
	<%=age%><br />
</body>
</html>