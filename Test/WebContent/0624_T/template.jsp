<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
body {
	margin: 0;
}

#wrap {
	width: 96%;
	min-width: 480px;
	max-width: 1024px;
	background: #ccc;
	margin: 0 auto;
	/* 중앙배치 */
}

#header {
	background: #eee;
	padding: 20px;
}

#header .logo {
	float: left;
}

#content {
	position: relative;
	height: auto;
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

#footer {
	color: #fff;
}

#mainContent {
	float: right;
	width: 75%;
	height: auto;
	position: relative;
}

#subContent {
	float: left;
	width: 20%;
	height: 100%;
	background: #ee8;
	position: absolute;
}

.clear {
	clear: both;
}

#firstContent {
	float: left;
	width: 70%;
}

#secondContent {
	float: right;
	width: 25%;
	padding: 1%;
	background: #e8e;
}

a {
	text-decoration: none;
	color: #000;
}
</style>
</head>
<%
	String pageContent = request.getParameter("pageContent");
%>
<body>
	<div id="wrap">
		<jsp:include page="/0624_T/module/top.jsp" />
		<div id="content">
			<jsp:include page="<%=pageContent%>" />
			<jsp:include page="/0624_T/module/left.jsp" />
		</div>
		<!-- content끝. -->
		<jsp:include page="/0624_T/module/bottom.jsp" />
	</div>
</body>
</html>