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
	<%
		request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"), passwd = request.getParameter("passwd"), name = request.getParameter("name");
	%>

	<%-- DB 저장하기 --%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/JSPBookDB?useSSL=false"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />

	<%-- 입력처리 --%>
	<sql:update dataSource="${dataSource}" var="result">
		insert into member(id,passwd,name)values(?,?,?)
		<sql:param value="<%=id%>" />
		<sql:param value="<%=passwd%>" />
		<sql:param value="<%=name%>" />
	</sql:update>

	<%-- 결과 페이지 보이기 --%>
	<c:import url="sql_Ex01.jsp" var="url" />
	${url}
</body>
</html>