<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function checkMember() {
		var regExpId = "";
		var regExpName = "";
		var regExpPassword = "";
		var regExpPhone = "";
		var regExpEmail = "";
		var form = document.member;
		var id = form.id.value;
		var name = form.name.value;
		var password = form.password.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-"
				+ form.phone3.value;
		var email = form.email.value;

		/* ID는 문자로 시작해주세요. */
		regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		/* 이름은 한글만 입력하세요. */
		regExpName = /^[가-힣]*$/;
		/* 비밀번호는 숫자만 입력하세요. */
		regExpPassword = /^[0-9]*$/;
		/* 연락처 입력을 확인하세요. */
		regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		/* E-Mail을 확인하세요. */
		regExpEmail = /[a-z0-9A-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (!regExpId.test(id)) {
			alert("아이디는 문자로 시작해주세요");
			form.id.select();
			return;
		}

		if (!regExpPassword.test(password)) {
			alert("비밀번호는 숫자만 입력하세요.");
			form.password.select();
			return;
		}

		if (!regExpName.test(name)) {
			alert("이름은 한글만 입력해주세요.");
			form.name.select();
			return;
		}
		if (!regExpPhone.test(phone)) {
			alert("연락처를 확인하세요.");
			form.phone2.select();
			return;
		}

		if (!regExpEmail.test(email)) {
			alert("E-Mail을 확인하세요.");
			form.email.select();
			return;
		}
		form.submit(); /* 이상 없으면 전송 */
	}
</script>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<body>
	<form action="" name="member">
		<p>
			아이디: <input type="text" name="id" />
		</p>
		<p>
			비밀번호: <input type="password" name="password" />
		</p>
		<p>
			이름: <input type="text" name="name" />
		</p>
		<p>
			연락처: <select name="phone1" id="">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2" /> - <input
				type="text" maxlength="4" size="4" name="phone3" />
		</p>
		<p>
			E-Mail <input name="email" />
		</p>
		<input type="button" value="가입하기" onclick="checkMember()" />
	</form>
</body>
</html>
