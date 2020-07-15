<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	if (id == null) {
	%>
	<script type="text/javascript">
		alert("로그인 하세요!");
		history.back;
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("로그인 성공!");
	</script>
	<%
		}
	%>
</body>
</html>