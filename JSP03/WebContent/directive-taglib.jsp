<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jstl 라이브러리를 이용한 반복 출력 -->
	<!-- var -> 변수 선언, begin -> 시작 값 end -> 종료 값, varStatus -> 상태 표시 변수 -->
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.count}<br>
	</c:forEach>
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.index}<br>
	</c:forEach>
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.first}<br>
	</c:forEach>
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.last}<br>
	</c:forEach>
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.begin}<br>
	</c:forEach>
	<c:forEach var="k" begin="1" end="10" step="1" varStatus="i">
		<c:out value="${k}" />-${i.end}<br>
	</c:forEach>

	<!-- 반복 step 증가치 -->
	<c:forEach var="k" begin="1" end="10" step="2">
		<c:out value="${k}" />&nbsp; &nbsp;
	</c:forEach>
	<br>

	<c:forEach var="k" begin="1" end="10">
		<c:if test="${k%2==0 }">
			<c:out value="${k }" />
		</c:if>
	</c:forEach>
</body>
</html>