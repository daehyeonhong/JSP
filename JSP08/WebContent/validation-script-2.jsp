<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validation</title>
<script>
	/* 요소의 id접근 - direct 접근 */
	function checkForm() {
		var id = document.getElementById("name").value;
		var pwd = document.getElementById("pwd").value;
		/* alert(id + ", " + pwd); */
		/* 입력 값이 비어있는지 확인 요소의 값 == "" */
		/* == 연산자로 문자열 값 비교 */
		if (id == "") {
			alert("ID를 입력하세요!!");
			document.getElementById("name").focus();
			return false;/* 진행 정지 */
		}
		if (pwd == "") {
			alert("비밀번호를 입력하세요!!");
			document.getElementById("pwd").focus();
			return false;/* 진행 정지 */
		}
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<form action="" name="loginForm">
		<p>
			아이디: <input type="text" name="id" id="name" />
		</p>
		<p>
			비밀번호: <input type="password" name="password" id="pwd" />
		</p>
		<!-- 자바스크립트 함수 실행 후 결과를 받을 경우 onclick = "return function()" 처리 -->
		<input type="submit" name="" id="" value="로그인"
			onclick="return checkForm()" />
	</form>
</body>
</html>
