<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10이하의 정수 중 짝수</title>
</head>
<body>
	<!-- HTML페이지에 JavaCode -> ScriptLet -->
	<%
		for (int i = 0; i <= 10; i++) {
		if ((i != 0) && ((i % 2) == 0)) {
			out.print(i + "&nbsp;&nbsp;");/* 출력객체 out */
		}
	}

	for (int i = 0; i <= 10; i++) {
		out.println(((i != 0) && (i % 2) == 0) ? (i + "&nbsp;&nbsp;") : "");
	}
	%>
</body>
</html>