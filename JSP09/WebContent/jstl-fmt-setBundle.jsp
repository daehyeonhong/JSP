<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization(i18n)</title>
</head>
<body>
	<p>────────────────── 기본 로케일 ──────────────────</p>
	<fmt:setBundle basename="jsp09.com.bundle.myBundle.message"
		var="resourceBundle" />
	<p>
		제목:
		<fmt:message key="title" bundle="${resourceBundle}" />
	</p>
	<p>
		<fmt:message key="username" var="userMsg" bundle="${resourceBundle}" />
		이름: ${userMsg}
	</p>
	<p>
		<fmt:message key="password" var="pwd" bundle="${resourceBundle}" />
		비밀번호: ${pwd}
	</p>

	<p>

		──────────────────영문 로케일──────────────────
		<fmt:setLocale value="en" />
		<fmt:setBundle basename="jsp09.com.bundle.myBundle.message"
			var="resourceBundle" />
	<p>
		제목:
		<fmt:message key="title" bundle="${resourceBundle}" />
	</p>
	<p>
		<fmt:message key="username" var="userMsg" bundle="${resourceBundle}" />
		이름: ${userMsg}
	</p>
	<p>
		<fmt:message key="password" var="pwd" bundle="${resourceBundle}" />
		비밀번호: ${pwd}
	</p>

	──────────────────한글 로케일──────────────────
	<fmt:setLocale value="kr" />
	<fmt:setBundle basename="jsp09.com.bundle.myBundle.message"
		var="resourceBundle" />
	<p>
		제목:
		<fmt:message key="title" bundle="${resourceBundle}" />
	</p>
	<p>
		<fmt:message key="username" var="userMsg" bundle="${resourceBundle}" />
		이름: ${userMsg}
	</p>
	<p>
		<fmt:message key="password" var="pwd" bundle="${resourceBundle}" />
		비밀번호: ${pwd}
	</p>
</body>
</html>