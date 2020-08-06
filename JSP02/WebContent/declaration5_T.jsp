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
	<%!int add(int a, int b) {
		int result = a + b;
		return result;
	}%>
	<!-- 두개의 정수를 입력 받아서 뺄셈 결과를 출력하는 sub()Method -->
	<%!int sub(int a, int b) {
		int result = a - b;
		return result;
	}%>
	<!-- 두 변수는 전역 변수(멤버 변수)로 선언하고 첫번째 값은 10, 두번째 값은 20으로 초기화 한다 -->
	<%!int a = 10, b = 20;%>
	<!-- 스크립틀릿에서 결과를 출력 -->
	<%
		out.print(add(a, b) + "<br>");//HTML의 줄바꿈 태그
	%>
	<%
		out.print(sub(a, b));
	%><br><%=add(a, b)%>
	<br><%=sub(a, b)%>
</body>
</html>