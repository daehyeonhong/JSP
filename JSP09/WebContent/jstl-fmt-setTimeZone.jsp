<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl fmt:setTimeZone</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<p>
		Date in Current Zone:
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>

	<p>
		Change TimeZone to [GMT-8]
		<fmt:setTimeZone value="GMT-8" />
	</p>
	<p>
		Date in Changed Zone:
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>

	<p>
		Change TimeZone to [Hongkong]
		<fmt:setTimeZone value="Hongkong" />
	</p>
	<p>
		Date in Changed Zone:
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			dateStyle="long" />
</body>
</html>