<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부:전역변수 및 메소드 선언</title>
</head>
<body>
	<%
		/* a,b -> 로컬변수, 선언 및 초기화 후 사용 가능 */
	int a = 10, b = a + data;//로컬 변수
	out.println(b);
	%>
	<!-- 전역변수 흐름의 후반에 작성해도 됨,
	 초기화를 하지 않아도 데이터의 기본 값으로 초기화
	 : 전역변수 -->
	<%!int data;%>
</body>
</html>