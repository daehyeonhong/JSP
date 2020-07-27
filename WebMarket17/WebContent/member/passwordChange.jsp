<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<%
		String id = request.getParameter("id"),
					 oldPassword = request.getParameter("oldPassword"),
				   newPassword = request.getParameter("newPassword"),
				   newPasswordConfirm = request.getParameter("newPasswordConfirm");
	if (id == null) {
		out.print("<script>alert('정상적인 접근이 아닙니다.');");
		out.print("self.close();</script>");
	}
	%>
	<form name="passwordChange">
		<label>ID: </label>
		<input name="id" id="id" value="<%=id%>"/><br />
		<label>기존 비밀번호: </label>
		<input type="password" id="oldPassword" name="oldPassword" autofocus="autofocus" required="required"/><br />
		<label>새 비밀번호: </label>
		<input type="password" id="newPassword" name="newPassword" required="required"/><br />
		<label>비밀번호 확인: </label>
		<input type="password" id="newPasswordConfirm" name="newPasswordConfirm" required="required"/><br />
		<input type="submit" value="변경" />
		<input type="button" value="닫기" onclick="javascript:self.close();" />
	</form>
	
	<c:set var="id" value="<%=id%>" />
	<c:set var="oldPassword" value="<%=oldPassword%>" />
	<c:set var="newPassword" value="<%=newPassword%>" />
	<c:set var="newPasswordConfirm" value="<%=newPasswordConfirm%>" />

	<c:if test="${(id != null) and (oldPassword != null) and (newPassword != null)}">
	
	<sql:setDataSource
		var="dataSource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
		user="root"
		password="1234" />
			<c:catch var="ex">
				<sql:query var="resultSet" dataSource="${dataSource}">
					select*from member where id=? and password=?
					<sql:param value="<%=id%>" />
					<sql:param value="<%=oldPassword%>" />
				</sql:query>
			</c:catch>
			${ex}
			<c:forEach items="${resultSet.rows}">
				<sql:update var="result" dataSource="${dataSource}">
					update member set password=? where id=?
					<sql:param value="${newPassword}" />
					<sql:param value="${id}" />
				</sql:update>
				<script type="text/javascript">
					alert('비밀번호 변경 성공!');
				</script>
			</c:forEach>
			<c:if test="${empty resultSet.rows}">
				<script type="text/javascript">
					alert('비밀번호를 확인해주세요!');
				</script>
			</c:if>
	</c:if>
</body>
</html>