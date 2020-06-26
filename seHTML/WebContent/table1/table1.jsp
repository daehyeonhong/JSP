<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
}

a {
	text-decoration: none;
}

#wrap {
	width: 960px;
	background: #fff;
	position: relative;
	left: 50%;
	margin-left: -480px;
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

#header {
	background: #eee;
	padding: 20px;
}

#header .logo {
	float: left;
}

#content {
	padding: 20px;
}

#content img {
	width: 100%;
}

#footer {
	background: #000;
	height: 50px;
	text-align: center;
	padding: 20px;
}

#footer span {
	color: #fff;
}

.movieTable {
	width: 100%;
	border-spacing: 0;
}

.movieTable th {
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #999;
}

.movieTable .poster {
	width: 8%;
}

.movieTable .director {
	width: 15%;
}

.movieTable .date {
	width: 10%;
}

.movieTable td {
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.movieTable .number {
	text-align: center;
	padding-left: 0px;
}

.movieTable tbody td.director {
	background: #eee;
}

.movieTable .odd {
	background: #eee;
}

.movieTable .odd .director {
	background: #ccc;
}

.movieTable tbody tr:hover {
	background: #ddd;
}

.movieTable tfoot td {
	color: #ddd;
	background: #333;
	border-bottom: 2px solid #ccc;
}
</style>
</head>

<body>
	<div id="wrap">
		<jsp:include page="module/header.jsp" />
		<jsp:include page="module/content.jsp" />
		<jsp:include page="module/footer.jsp" />
	</div>
</body>

</html>