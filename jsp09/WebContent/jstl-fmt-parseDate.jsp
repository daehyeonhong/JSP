<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl fmt:parseDate Tag</title>
</head>
<body>
	<h3>Date Parsing:</h3>
	<c:set var="now" value="20-10-2020" />
	<c:out value="${now}" />
	<fmt:parseDate value="${now}" var="parsedEmpDate" pattern="dd-MM-yyyy" />
	<p>
		Parsed Date:
		<c:out value="${parsedEmpDate}" />
	</p>

	<%
		DateTimeFormatter formatter;
	LocalDate localDate;

	formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	localDate = LocalDate.parse("20-10-2020", formatter);
	%>
	<%=localDate%>

	<br />

	<p>
		<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss">2020-05-05 16:41:56</fmt:parseDate>
	</p>
	<br />
	<c:set var="nowtemp" value="2020-08-14 16:51:44.2" />
	<fmt:parseDate var="dateTempParse" value="${nowtemp}"
		pattern="yyyy-MM-dd HH:mm:ss.S" />
	<c:out value="${dateTempParse}" />
</body>
</html>