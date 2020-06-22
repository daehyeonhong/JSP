<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 100까지의 합 출력하기</title>
</head>
<body>
	<!-- 스크립틀릿 부분은 서버에서 처리 되는 부분 최종 HTML에는 보이지 않음. -->
	<%
		int sum = 0;//합 출력변수 선언
	for (int i = 1; i <= 100; i++) {
		sum += i;
	}
	%>

	<!-- 표현식 -->
	1부터 100까지의 합은
	<%=sum%>입니다.
</body>
</html>