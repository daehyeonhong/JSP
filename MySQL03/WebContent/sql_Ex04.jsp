<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL</title>
</head>
<body>
	<form action="sql_Ex04_process.jsp" method="post">
		<div>
			<label>아이디: </label><input type="text" name="id" />
		</div>
		<div>
			<label>비밀번호: </label><input type="password" name="passwd" />
		</div>
		<div>
			<input type="submit" value="전송">
		</div>
	</form>
</body>
</html>