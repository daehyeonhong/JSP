<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<form action="ControllerServlet" method="post">
		<label>아이디: </label>
		<input name="id" /><br />
		<label>비밀 번호: </label>
		<input type="password" name="password" /><br />
		<input type="submit" value="보내기" /><br />
	</form>
</body>
</html>