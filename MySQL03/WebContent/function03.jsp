<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- String[] texts = {"Hello,", "Java", "Server", "Pages!"} --%>
	<c:set var="texts"
		value="${fn:split('Hello, Java Server Pages!', ' ')}" />
	<table border="1">
		<c:forEach var="i" begin="0" end="${fn:length(texts)-1}"
			varStatus="status">
			<tr>
				<td>
					Text[${i}]=${texts[i]}-${status.first}-${status.last}-${status.current}-${status.index}-${status.count}
				</td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<c:out value="${fn:join(texts,'-')}" />
	</p>
</body>
</html>