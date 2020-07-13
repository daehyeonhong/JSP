<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

main {
	background: #345aa3;
	color: #fff;
	min-height: 170px;
	height: 300px;
}

main .wrap {
	min-width: 900px;
	background: #345aa3;
	color: #fff;
}

main .wrap .firstContent #selectLoc #loc {
	background: #345aa3;
	color: #fff;
}

main .wrap .firstContent #selectLoc .btn {
	background: #345aa3;
	width: 27px;
	height: 27px;
}

#locBtn {
	background: #345aa3;
	width: 15px;
	height: 15px;
	margin: 0px;
	padding: 0px;
}

#selectLoc button {
	margin: 0px;
	padding: 0px;
}

#currentWeather {
	border: 0.2px solid #fff;
}

#warning {
	position: relative;
	float: right;
	background: #800;
	color: #fff;
}

#warningIcon {
	background: #800;
}

.firstContent .presentWrap {
	width: 190px;
	height: 180px;
	float: left;
	font-size: 14px;
	text-align: center;
	border: 1px solid #fff;
}

.firstContent .presentWrap img {
	width: 43px;
	height: 43px;
}

.firstContent .presentWrap .weatherIcon {
	width: 13px;
	height: 11px;
}

.firstContent .presentWrap .temperature {
	font-size: 35px;
	font-weight: bold;
}

.presentWeatherWrap span {
	display: block;
}

#currentTime {
	display: block;
}

.clear {
	clear: both;
}

#currentTime {
	float: right;
}

#icon_refresh {
	width: 12px;
	height: 12px;
}
</style>
<script>
	var curTime = new Date();
	var curMonth = curTime.getMonth() + 1;
	var curDay = curTime.getDay();
	curDay = (curDay == 0 ? "일" : curDay == 1 ? "월" : curDay == 2 ? "화"
			: curDay == 3 ? "수" : curDay == 4 ? "목" : curDay == 5 ? "금" : "토");
	var curHours = curTime.getHours();
	var curMinutes = curTime.getMinutes();
	curMinutes = curMinutes < 30 ? "00" : 30;

	function today() {
		document.write(curTime.getFullYear() + "." + curMonth + "."
				+ curTime.getDate() + "(" + curDay + ")" + curHours + ":"
				+ curMinutes)
	}

	function currentTime(plus) {
		if (plus == 0) {
			document.write("현재");
		} else {
			document.write((curHours > 24 ? curHours - 24 : curHours) + plus
					+ "시");
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="navbar.jsp" />
	<jsp:include page="content.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>
