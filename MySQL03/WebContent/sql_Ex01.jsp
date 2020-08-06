<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL</title>
</head>
<body>
	<%-- 연결 맺기 --%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/JSPBookDB?useSSL=false"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<%-- 쿼리 객체 생성 --%>
	<sql:query var="resultSet" dataSource="${dataSource}">
		select*from member
	</sql:query>
	<%-- 결과 출력하기 --%>
	<table border="1">
		<tr>
			<th>순번</th>
			<%-- resultSet.columnNames 속성:Meta_Data_ColumnName --%>
			<c:forEach var="columnName" items="${resultSet.columnNames}">
				<th width="100"><c:out value="${columnName}" /></th>
			</c:forEach>
		</tr>
		<%-- rowsByIndex 순서대로 저장된 행의 값 속성 --%>
		<c:forEach var="row" items="${resultSet.rowsByIndex}" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<c:forEach var="column" items="${row}" varStatus="j">
					<td><c:if test="${column!=null}">
							<c:if test="${j.index==0}">
								<a href="sql_Ex03.jsp?id=${column}">${column}</a>
							</c:if>
							<c:if test="${j.index!=0}">
								<c:out value="${column}" />
							</c:if>
						</c:if> <c:if test="${column==null}">
							&nbsp;
						</c:if></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>