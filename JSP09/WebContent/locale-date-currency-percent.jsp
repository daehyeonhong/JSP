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
<title>지역 정보 출력</title>
</head>
<body>
	<%
		Locale locale = request.getLocale();
	String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL, locale).format(new Date());

	NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
	NumberFormat percent = NumberFormat.getPercentInstance(locale);

	String fCurrency = currency.format(1234567);
	String fPercent = percent.format(0.12);
	%>
	<p>
		locale의 날짜 형식:
		<%=date%></p>
	<p>
		locale의 통화 형식:
		<%=fCurrency%>
	</p>
	<p>
		locale의 % 형식:
		<%=fPercent%></p>
</body>
</html>