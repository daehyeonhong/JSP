<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="fruit" class="f.dto.Fruit" scope="request" />

	<%-- <jsp:setProperty property="kind" name="fruit" param="kind" />
	<jsp:setProperty property="price" name="fruit" param="price" /> --%>
	<jsp:setProperty property="*" name="fruit" />
	<jsp:getProperty property="kind" name="fruit" /><br />
	<jsp:getProperty property="price" name="fruit" /><br />
</body>
</html>