<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="board" class="dto.Board" />
	<!-- Parameter로 넘어오는 값들이 속성에 맞게 설정 -->
	<jsp:setProperty property="*" name="board" />
	<!-- 출력 -->
	<div>
		글번호:
		<jsp:getProperty property="no" name="board" />
	</div>
	<div>
		제목:
		<jsp:getProperty property="title" name="board" />
	</div>
	<div>
		작성자:
		<jsp:getProperty property="writer" name="board" />
	</div>
	<div>
		내용:
		<jsp:getProperty property="content" name="board" />
	</div>
</body>
</html>