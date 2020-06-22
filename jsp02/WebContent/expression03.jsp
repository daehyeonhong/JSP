<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세 수의 합 출력하기:표현식</title>
</head>
<body>
	<!-- 스크립틀릿에서 선언 -->
	<%
		int a = 1, b = 2, c = 3;
	%>
	<!-- 표현식에서 출력 -->
	세 변수의 합:<%=a + b + c%>
</body>
</html>