<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청 페이지 입니다.</h1>
	<%
		/* 오류메시지를 강제로 전송 sendError(상태코드, 메세지); */
	response.sendError(404, "요청 페이지를 찾을 수 없습니다.");
	%>
</body>
</html>