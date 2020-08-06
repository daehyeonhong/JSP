<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
		<!-- 출력페이지 데이터 크기가 513바이트 보다 작으면 IE인 경우, IE자체 메시지 출력 -->
	<p>요청 처리 과정에서 예외가 발생하였습니다.</p>
	<p>빠른 시간내에 문제를 해결하도록 하겠습니다..</p>
	<p>에러 타입: <%=exception.getClass().getName()%></p>
	<p>에러 메시지: <%=exception.getMessage()%></p>
	<p>예외 유형: <%=exception.toString()%></p>
</body>
</html>