<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부:declaration -->
	<%!/* 매개변수 2개 받고, 곱한 결과를 정수로 리턴하는 함수 */
	public int multiply(int a, int b) {
		int result = a * b;
		return result;
	}%>
	2와 3의 곱한 결과는:<%=multiply(2, 3)%><!-- 표현식에서 2와 3을 곱한 결과를 출력 -->
</body>
</html>