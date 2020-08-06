<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>
	<fmt:setLocale value="ko" />
	<p>───────────fmt:bundle──────────</p>
	<fmt:bundle basename="jsp09.com.bundle.myBundle.message">
		<p>
			제목:
			<fmt:message key="title" var="title" />
			${title}
		</p>
		<p>
			이름:
			<fmt:message key="username" var="userMsg" />
			${userMsg}
		</p>
		<p>
			패스워드:
			<fmt:message key="password" var="password" />
			${password}
		</p>
	</fmt:bundle>
	<p>ko_</p>
	<br />
	<fmt:setLocale value="en" />
	<p>───────────fmt:bundle──────────</p>
	<fmt:bundle basename="jsp09.com.bundle.myBundle.message">
		<p>
			제목:
			<fmt:message key="title" var="title" />
			${title}
		</p>
		<p>
			이름:
			<fmt:message key="username" var="userMsg" />
			${userMsg}
		</p>
		<p>
			패스워드:
			<fmt:message key="password" var="password" />
			${password}
		</p>
		<p>default</p>
	</fmt:bundle>
</body>
</html>