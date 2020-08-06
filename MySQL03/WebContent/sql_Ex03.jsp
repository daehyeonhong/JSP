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
<%-- 한 건을 DB에서 가져와서 form에 출력하기 --%>
<%
	String id = request.getParameter("id");
%>
<%-- 한 건을 DB에서 가져와서 form에 출력하기 --%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/JSPBookDB?useSSL=false"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<%-- 조회 결과 가져오기 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
		select name from member where id=?
		<sql:param value="<%=id%>" />
</sql:query>
<body>
	<c:forEach var="row" items="${resultSet.rowsByIndex}">
		<c:forEach var="column" items="${row}">
			<form action="sql_Ex03_process.jsp">
				<div>
					<label>아이디: </label><input type="text" name="id" value="<%=id%>"
						readonly="readonly" />
				</div>
				<div>
					<label>비밀번호: </label><input type="password" name="passwd" />
				</div>
				<div>
					<label>이름: </label><input type="text" name="name" value="${column}" />
				</div>
				<div>
					<input type="submit" value="전송" />
				</div>
			</form>
		</c:forEach>
	</c:forEach>
</body>
</html>