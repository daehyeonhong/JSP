<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 -->
	<%
		Board board = new Board();
	board.setNo(1);
	board.setTitle("제목1");
	board.setWriter("작성자1");
	board.setContent("내용1");
	%>
	<!-- 표현식 : expression -->
	글번호:<%=board.getNo()%><br /> 글제목:<%=board.getTitle()%><br /> 글저자:<%=board.getWriter()%><br />
	글내용:<%=board.getContent()%><br />
</body>
</html>