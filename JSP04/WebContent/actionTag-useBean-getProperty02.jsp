<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="dto.Person" />
	<!-- setProperty 속성 id의 타입 int타입 value="숫자 -> 자동으로 int 타입으로 설정 -->
	<jsp:setProperty property="id" name="person" value="2020001" />
	<jsp:setProperty property="name" name="person" />
	<jsp:getProperty property="id" name="person" />
	<jsp:getProperty property="name" name="person" />
	<br />
</body>
</html>