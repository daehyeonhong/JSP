<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!/* 선언부 :전역 변수, 메소드 선언 */
	int pageCount = 0;

	void addCount() {
		pageCount++;
	}%>
	<%
		addCount(); /* 메소드 호출 */
	%>
	<p>
		이 사이트 방문은
		<%=pageCount%>번째 입니다.
		<!-- 값 출력 -->
	</p>
</body>
</html>