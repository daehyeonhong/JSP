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
	<!-- useBean을 이용한 객체 생성 -->
	<jsp:useBean id="board" class="dto.Board" scope="page" />
	<!-- 속성지정 액션 태그 -->
	<jsp:setProperty property="no" name="board" value="2" />
	<jsp:setProperty property="title" name="board" value="제목1" />
	<jsp:setProperty property="writer" name="board" value="작성자1" />
	<jsp:setProperty property="content" name="board" value="내용1" />
	<!-- 속성 출력 액션 태그 -->
	글번호:<jsp:getProperty property="no" name="board" /><br /> 제목:<jsp:getProperty
		property="title" name="board" /><br /> 작성자:<jsp:getProperty
		property="writer" name="board" /><br /> 내용:<jsp:getProperty
		property="content" name="board" /><br />
</body>
</html>