<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>기상청</title>
<!-- <link rel="stylesheet" href="resources/css/weather.css" /> -->
<style type="text/css">
header {
	background: #009ae1;
	height: 53px;
}

.header {
	position: relative;
	padding: 10px;
}

.header img {
	width: 35px;
	height: 35px;
	float: left;
}

.header h3 {
	position: relative;
	color: #fff;
	bottom: 12.5px;
}

footer {
	background: #e3e3e3;
	font-size: 12px;
	text-align: center;
}

footer a {
	text-decoration: none;
	color: #000;
	height: 15px;
	line-height: 15px;
}

footer span {
	margin-top: 5px;
	padding: 0 10px;
	color: #595959;
	font-size: 12px;
}

nav {
	height: 50px;
	padding: 4px;
}

.navbar a {
	display: inline-block;
	border: 0.5px solid #666;
	border-radius: 25px;
	width: 50px;
	height: 30px;
	font-size: 15px;
	text-align: center;
	text-decoration: none;
	line-height: 20px;
	background: #fff;
	color: #666;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="navbar.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>
