<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkForm() {
		/* var regExp = /Java/i; */
		var regExp = new RegExp('java', 'i');
		/* 'i'ignoreCase(대소문자 구분X) */
		var str = document.frm.title.value;
		var result = regExp.exec(str);/* 문자열 내에서 해당 패턴을 찾아서 리턴 */
		alert(result[0]);
	}
</script>
<body>
	<form action="" name="frm">
		<p>
			제목: <input type="text" name="title" />
		</p>
		<input type="submit" value="전송" onclick="checkForm()" />
	</form>
</body>
</html>