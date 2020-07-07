<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
</head>
<body>
	<%@include file="menu.jsp"%>
	<!-- 전역변수(멤버 변수, global변수, field) -->
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.", tagline = "Welcome to Web Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting%></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%
				response.setIntHeader("Refresh", 1);
			Date day = new Date();
			String am_pm, CT;
			int hour = day.getHours(), minute = day.getMinutes(), second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			DecimalFormat df1 = new DecimalFormat("00");
			CT = df1.format(hour) + ":" + df1.format(minute) + ":" + df1.format(second) + " " + am_pm;
			out.print("접속 시각: " + CT + "<br/>");
			%>
		</div>
		<hr />
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>