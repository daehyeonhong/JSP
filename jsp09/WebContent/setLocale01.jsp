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
		<%=response.getLocale()%>
	</p>
	<fmt:setLocale value="ko" />
	<p>
		<%=response.getLocale()%>
	</p>
	<fmt:setLocale value="ja" />
	<p>
		<%=response.getLocale()%>
	</p>
	<fmt:setLocale value="en" />
	<p>
		<%=response.getLocale()%>
	</p>
</body>
</html>