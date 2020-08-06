<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		숫자:
		<fmt:formatNumber value="3200100" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" type="number" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" type="number" groupingUsed="false" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" type="currency" groupingUsed="true" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" type="currency" currencySymbol="&" />
	</p>
	<p>
		<fmt:formatNumber value="0.45" type="percent" />
	</p>
	<p>
		<fmt:formatNumber value="3200100" minIntegerDigits="10"
			minFractionDigits="2" />
	</p>

	<!-- 사용자 정의 패턴 pattern 속성 -->

	<p>
		<fmt:formatNumber value="3200100.45" pattern=".000" />
	</p>
	<p>
		<fmt:formatNumber value="3200100.45" pattern="#,###.00#" />
	</p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
</body>
</html>