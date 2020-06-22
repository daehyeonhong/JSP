<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- https://getbootstrap.com/ 사이트의 CSS 라이브러리 사용하기. -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- bootstrap.min.css과 bootstrap.css의 차이는 압축여부 -->
<meta charset="UTF-8">
<title>선언부: 전역변수 및 함수 선언부</title>
</head>
<body>
	<!-- 시멘틱태그 -->
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcom.jsp">Home</a>
			</div>
		</div>
	</nav>
	<%!String greeting = "Welcome to Web Shoppint Mall";
	String tagline = "Welcome to Web Marker!";%>
	<div class="jumbotron">
		<div class="container">
			<h1><%=greeting%></h1>
			<%-- <h2><%=tagline%></h2> --%>
		</div>
	</div>
	<!-- 아랫쪽 -->
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
	</div>
	<footer class="container">
		<p>&copy; WebMarket</p>
	</footer>

</body>
</html>