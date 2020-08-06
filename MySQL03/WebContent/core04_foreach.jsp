<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<>();
	list.add("홍길동");
	list.add("일지매");
	list.add("임꺽정");
	%>
	<%-- set으로 변수 선언 --%>
	<c:set var="list" value="<%=list%>" />
	<%-- 반복문 set으로 선언한 변수를 다시 l에 저장 후 반복처리 --%>
	<c:forEach var="l" items="${list}">
		${l}
	</c:forEach>
</body>
</html>