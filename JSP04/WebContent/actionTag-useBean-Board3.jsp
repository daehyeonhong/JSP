<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Board board = new Board(); -->
	<jsp:useBean id="board" class="dto.Board" />
	<jsp:setProperty property="no" name="board" />
	<jsp:setProperty property="title" name="board" param="subject" />
	<jsp:setProperty property="writer" name="board" />
	<jsp:setProperty property="content" name="board" />

	글번호:
	<jsp:getProperty property="no" name="board" /><br /> 제목:
	<jsp:getProperty property="title" name="board" /><br /> 작성자:
	<jsp:getProperty property="writer" name="board" /><br /> 내용:
	<jsp:getProperty property="content" name="board" /><br />
</body>
</html>