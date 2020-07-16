<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부:전역변수 및 함수 선언</title>
</head>
<body>
	<!-- 두개의 정수를 입력 받아서 덧셈 결과를 출력하는 add()Method -->
	<!-- 두개의 정수를 입력 받아서 뺄셈 결과를 출력하는 sub()Method -->
	<!-- 두 변수는 전역 변수로 선언하고 첫번째 값은 10, 두번째 값은 20으로 초기화 한다 -->
	<!-- 선언하고, 스크립틀릿에서 결과를 출력 -->
	<%
		out.print(add(a, b) + "<br>");
	out.print(sub(a, b));
	%>
	<%!int a = 10, b = 20;

	public int add(int a, int b) {
		return a + b;
	}

	public int sub(int a, int b) {
		return a - b;
	}%>
</body>
</html>