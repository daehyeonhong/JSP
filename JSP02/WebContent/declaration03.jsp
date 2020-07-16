<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부:전역변수 및 Method 선언</title>
</head>
<body>
	<%!/* 전역변수 선언 */
	int count = 3;

	/* 메소드 선언 */
	String makeItLower(String data) {
		return data.toLowerCase();
	}%>
	<%
		for (int i = 0; i <= count; i++) {
		out.print("Java Server Pages " + i + "<br>");
	}
	%>
	<%
		out.println(makeItLower("Hello World!"));
	%>
</body>
</html>