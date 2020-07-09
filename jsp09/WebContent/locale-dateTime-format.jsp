<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocaleDateTime</title>
</head>
<body>
	<%
		Locale locale = request.getLocale();
	String date = DateFormat.getDateTimeInstance(DateFormat.FULL/* 날짜 */, DateFormat.FULL/* 시간 */, locale/* 지역 정보 */)
			.format(new Date());

	/* 통화 */
	NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
	String fcurrency = currency.format(123456);
	%>
	<p>Lacale의 날짜 형식-></p>
	<p><%=locale%></p>
	<p><%=date%></p>
	<p><%=fcurrency%></p>
</body>
</html>