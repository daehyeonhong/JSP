<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="f.dto.Person" scope="request" />
	<p>
		ID:<%=person.getId()%>
	</p>
	<p>
		NAME:<%=person.getName()%>
	</p>
	<%
		person.setId(20182005);
	person.setName("일지매");
	%>
	<jsp:include page="actionTag-useBean031.jsp"></jsp:include>
</body>
</html>