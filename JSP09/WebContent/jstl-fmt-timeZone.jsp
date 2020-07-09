<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeZone</title>
</head>
<body>
	<c:set var="now" value="<%=new Date()%>" />
	<c:out value="${now}" />

	<br />
	<fmt:timeZone value="Hongkong">
		<fmt:formatDate value="${now}" type="both" dateStyle="medium"
			timeStyle="full" />
	</fmt:timeZone>

	<br />
	<fmt:timeZone value="Beijing">
		<fmt:formatDate value="${now}" type="both" dateStyle="short"
			timeStyle="full" />
	</fmt:timeZone>
</body>
</html>