<%@page import="java.util.Arrays"%>
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
		String id = request.getParameter("id");
	String name = request.getParameter("name");
	/* String hobby = request.getParameter("hobby"); */
	String[] hobbies = request.getParameterValues("hobby");
	%>
	<ul>
		<li>id: <%=id%>
		</li>
		<li>name: <%=name%>
		</li>
		<li>hobby: <%=Arrays.toString(hobbies)%>
		</li>
	</ul>
</body>
</html>