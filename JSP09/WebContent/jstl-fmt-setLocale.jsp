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
	<%=request.getLocale()%>

	<fmt:setLocale value="en" />
	<%=response.getLocale()%>

	<%-- <%request.setCharacterEncoding("UTF-8"); %> --%>
	<fmt:requestEncoding value="UTF-8" />
</body>
</html>