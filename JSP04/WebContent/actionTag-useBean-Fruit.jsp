<%@page import="dto.Fruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Fruit fruit1 = new Fruit();
	fruit1.setKind("Apple");
	fruit1.setPrice(2000);
	%>

	<%=fruit1.getKind()%><br />
	<%=fruit1.getPrice()%><br />

	<h3>actionTag 사용</h3>

	<!-- Bean 생성 -->
	<jsp:useBean id="fruit2" class="dto.Fruit" />

	<!-- 속성에 값 입력 -->
	<jsp:setProperty property="kind" value="포도" name="fruit2" />
	<jsp:setProperty property="price" value="7000" name="fruit2" />

	<!-- 속성 출력 -->
	<jsp:getProperty property="kind" name="fruit2" /><br />
	<jsp:getProperty property="price" name="fruit2" /><br />

	<h3>actionTag 값 출력</h3>
	<!-- 스크립틀릿으로 생성한 객체는 actionTag의 getProperty로 읽지 못함 -->
	<%-- <jsp:getProperty property="kind" name="fruit1" /> --%>

	<!-- 액션태그 useBean으로 생성한 객체는 표현식으로 읽을 수 있음 -->
	<%=fruit2.getKind()%><br />
</body>
</html>