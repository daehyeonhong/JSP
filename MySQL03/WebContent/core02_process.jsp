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
	<%
		String number = request.getParameter("number");
	%>
	<c:set var="number" value="<%=number%>" />
	<%-- 예외 처리 --%>
	<c:catch var="except">
		<%-- choose Tag --%>
		<c:choose>
			<c:when test="${number%2==0}">
				<c:out value="${number}" />은 짝수 입니다.
		</c:when>
			<c:when test="${number%2==1}">
				<c:out value="${number}" />은 홀수입니다.
		</c:when>
		</c:choose>
		<%-- <c:catch /> 태그 내에서 발생한 예외 출력 --%>
		${except}
	</c:catch>
</body>
</html>