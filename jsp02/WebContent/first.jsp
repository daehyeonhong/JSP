<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 지시부(Directive): 페이지의 구성을 표시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML문서의 제목</title>
</head>
<body>
	<!-- 스크립틀릿 -->
	<!-- 는 JSP 주석 -->
	<%
		String bookTitle = "홍길동전";
	String author = "허균";
	%>
	<!-- 출력 표현식(Expression) -->
	<%=author%>의<%=bookTitle%>
</body>
</html>