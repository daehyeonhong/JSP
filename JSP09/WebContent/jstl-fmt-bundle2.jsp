<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FMT_Bundle</title>
</head>
<body>
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
			비밀번호:
			<fmt:message key="password" var="pwd" />
			${pwd }
		</p>
	</fmt:bundle>
	<br />
	<fmt:bundle basename="jsp09.com.bundle.myBundle.message_kr">
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
			비밀번호:
			<fmt:message key="password" var="pwd" />
			${pwd }
		</p>
	</fmt:bundle>
</body>
</html>