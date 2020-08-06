<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL</title>
</head>
<body>
	<%-- 수정처리 --%>
	<%
		request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"), passwd = request.getParameter("passwd"), name = request.getParameter("name");
	%>
	<%-- 연결 맺기 --%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/JSPBookDB?useSSL=false"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />

	<%-- 수정처리 --%>
	<sql:update dataSource="${dataSource}" var="resultSet">
		update member set name=? where id=? and passwd=?
		<sql:param value="<%=name%>" />
		<sql:param value="<%=id%>" />
		<sql:param value="<%=passwd%>" />
	</sql:update>
	<%-- 결과 보기 --%>
	<c:import url="sql_Ex01.jsp" var="url" />
	${url}
</body>
</html>