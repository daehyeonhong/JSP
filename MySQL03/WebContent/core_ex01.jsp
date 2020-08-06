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
	Browser 변수 값 설정
	<c:set var="browser" value="${header['User-Agent']}" />
	<br />
	<%-- 변수 출력: <c:out value="값" /> --%>
	<c:out value="${browser}" />

	<p>
		browser변수 값 제거 후
		<c:remove var="browser" />
		<c:out value="${browser}" />
</body>
</html>