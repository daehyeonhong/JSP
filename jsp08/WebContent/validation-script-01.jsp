<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validation</title>
<script>
	function checkForm() {
		var id = document.loginForm.id.value;
		var pwd = document.loginForm.pwd.value;
		alert(id + ", " + pwd);
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<form action="" name="loginForm">
		<p>
			아이디: <input type="text" name="id" id="" />
		</p>
		<p>
			비밀번호: <input type="password" name="password" id="" />
		</p>
		<input type="submit" name="" id="" value="로그인" onclick="checkForm()" />
	</form>
</body>
</html>
