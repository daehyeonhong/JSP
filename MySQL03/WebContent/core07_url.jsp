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
	<c:url value="../shopping.do" var="url1" />
	<c:url value="/shopping.do" var="url2">
		<c:param name="Add" value="isdn-001" />
	</c:url>
	<%-- 이동할 URL경로 지정 --%>
	<a href="${url2}">${url2}</a>
	<c:url var="url3" value="http://localhost:6465/MySQL03/core06_gugu.jsp" />
	<%-- 지정 결로로 이동 할 링크택의 HreF 값으로 사용 --%>
	<a href="${url3}">${url3}</a>
</body>
</html>