<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="dto.MemberBean" scope="session" />
	<jsp:setProperty property="id" name="member" value="1" />
	<jsp:setProperty property="name" name="member" value="hong" />
	<jsp:forward page="page1.jsp" />
</body>
</html>