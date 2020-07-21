<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="dbcpTest.jsp"%>
<%
	String sql = "select*from member order by id";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
ResultSet resultSet = preparedStatement.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
		</tr>
		<%
			while (resultSet.next()) {
			int id = resultSet.getInt(1);
			String name = resultSet.getString(2), password = resultSet.getString(3);
			out.print("<tr><td><a href='memberDetail.jsp?id=" + id + "'>" + id + "</a></td><td>" + name + "</td><td>" + password
			+ "</td></tr>");
		}
		%>
	</table>
</body>
</html>