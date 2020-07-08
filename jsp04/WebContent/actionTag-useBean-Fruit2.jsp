<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="fruit1" class="f.dto.Fruit" scope="request" />
	<jsp:setProperty property="kind" name="fruit1" value="망고" />
	<jsp:setProperty property="price" name="fruit1" value="5000" />
	<jsp:forward page="next2.jsp" />
</body>
</html>