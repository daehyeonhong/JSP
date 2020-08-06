<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatDate</title>
</head>
<body>
	<%-- <%Date now = new Date();%> --%>
	<jsp:useBean id="now" class="java.util.Date" />
	<p>
		데이트 타임 형식:
		<fmt:formatDate value="${now}" type="both" />
	</p>

	<!-- "날짜 형태의 문자열"을 Date로 변환 -->
	<%-- <%String date = "20-10-2020";%> --%>
	<c:set value="20-10-2020" var="date" />
	<fmt:parseDate value="${date}" var="parsedDate" pattern="dd-MM-yyyy" />

	<%-- <%=Date().toString()%> --%>
	<p>
		parsed Date:
		<c:out value="${parsedDate}"></c:out>
	</p>
</body>
</html>