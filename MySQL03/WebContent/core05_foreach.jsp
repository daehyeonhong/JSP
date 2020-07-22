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
	<%-- 배열을 저장하는 변수 선언 --%>
	<c:set var="intArray" value="<%=new int[] { 10, 5, 53, 24, 3 }%>" />
	<c:forEach var="i" items="${intArray}" begin="2" end="4"
		varStatus="status">
		<%-- status.index:index_Number, status.count:실행 횟수, ${i} index 번호에 해당하는 객체의 값 --%>
		<%-- status.first:첫번째인지 여부(true/false) --%>
		<%-- status.last:마지막인지 여부(true/false) --%>
		<%-- status.current:현재 값인지 여부(true/false) --%>
		${status.index} - ${status.count} -[${i}]-${status.first}-${status.last}-${status.current}<br />
	</c:forEach>
</body>
</html>