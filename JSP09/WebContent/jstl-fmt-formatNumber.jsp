<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatNumber</title>
</head>
<body>
	<p>
		숫자:
		<fmt:formatNumber value="3200100" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" type="currency" groupingUsed="true" />
	</p>
	<p>
		<fmt:formatNumber value="3200100.45" pattern=".000" />
	</p>
	<p>
		<fmt:formatNumber value="3200100.456" pattern=".0#" />
	</p>

	<!-- 숫자형 문자열 => 숫자형 -->
	<p>
		<fmt:parseNumber value="1,100.12" pattern="0,000.00" var="num"
			integerOnly="true" />
		정수만 출력: parse결과->${num}<br />
	</p>
</body>
</html>