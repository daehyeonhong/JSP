<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<c:out value="<" escapeXml="true" />
	<c:out value=">" escapeXml="true" />
	<c:out value="&" escapeXml="true" />
	<c:out value="'" escapeXml="true" />
	<c:out value='""' escapeXml="true" />
	<br />
</body>
</html>