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
	<p>────────────────fmt:bundle────────────────</p>
	<fmt:bundle basename="jsp09.com.bundle.myBundle.message">
		<p>
			제목:
			<fmt:message key="title" var="title" />${title}
		</p>

		<p>
			<fmt:message key="username" var="user" />
			이름:${user}
	</fmt:bundle>

	<p>────────────────setbundle────────────────</p>
	<fmt:setLocale value="ko" />

	<fmt:setBundle basename="jsp09.com.bundle.myBundle.message"
		var="resouceBundle" />
	<p>
		제목:
		<fmt:message key="title" bundle="${resouceBundle}" />
	</p>
	<p>
		이름:
		<fmt:message key="username" bundle="${resouceBundle}" />
	</p>

	<p>────────────────fmt:bundle────────────────</p>
	<fmt:setLocale value="en" />
	<fmt:bundle basename="jsp09.com.bundle.myBundle.message">
		<p>
			제목:
			<fmt:message key="title" var="title" />${title}
		</p>

		<p>
			<fmt:message key="username" var="user" />
			이름:${user }
	</fmt:bundle>


</body>
</html>