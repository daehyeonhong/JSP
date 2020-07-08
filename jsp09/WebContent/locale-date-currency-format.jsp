<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>현재 로케일의 국가, 날짜, 통화</h3>
	<%
		Locale locale = request.getLocale();
	Date currentDate = new Date();
	DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL, locale);
	NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
	%>
	<h4>
		국가:
		<%=locale.getDisplayCountry()%>
	</h4>
	<h4>
		날짜:
		<%=dateFormat.format(currentDate)%>
	</h4>
	<h4>
		숫자:
		<%=numberFormat.format(12345.67)%>
	</h4>
</body>
</html>