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
	<h1>구구단2->2</h1>
	<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td width="100">${i}*${j}=${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<h1>구구단2->9</h1>
	<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td width="100">${j}*${i}=${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>