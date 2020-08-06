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
	<jsp:useBean id="now" class="java.util.Date" />
	<p>
		Date in Current Zone:
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>

	<p>
		Date in Change Zone:
		<fmt:setTimeZone value="GMT-8" />
	</p>
	<p>
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>
</body>
</html>