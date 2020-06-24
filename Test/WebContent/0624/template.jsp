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
<link rel="stylesheet" href="/test/0624/module/css/mystyle.css">
</head>
<%
	//String pageTitle = (String) request.getAttribute("PAGETITLE");
String contentPage = request.getParameter("CONTENTPAGE");
%>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="top.jsp" />
		</div>
		<!-- header끝. -->
		<div id="content">
			<jsp:include page="<%=contentPage%>" />
			<!-- 메인끝. -->
			<div id="subContent">
				<jsp:include page="left.jsp" />
			</div>
			<!-- 서브끝. -->
			<div class="clear"></div>
			<!-- float 속성 제거 -->
		</div>
		<!-- content끝. -->
		<div id="footer">
			<jsp:include page="bottom.jsp" />
		</div>
		<!-- footer끝. -->
	</div>
</body>
</html>