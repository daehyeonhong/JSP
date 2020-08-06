<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<%-- DB접속 [Member_Table]에서 조회--%>
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB" user="root"
		password="1234" />
	<%-- 조회 --%>
	<sql:query var="resultSet" dataSource="${dataSource}">
	select*from member where id=?
	<sql:param value="<%=id%>" />
	</sql:query>
	<%-- 회원 ID가 존재하면 처리 --%>
	<c:forEach var="row" items="${resultSet.rows}">
		<script type="text/javascript">
			alert("이미 사용중인 ID입니다.");
			opner.newMember.id.value = '';
			opner.newMember.id.focus();
			self.close();
		</script>
	</c:forEach>
	<%-- 회원 ID가 존재하지 않으면 --%>
	<script type="text/javascript">
		alert("사용가능한 아이디 입니다.");
		opner.newMember.id.readOnly = true;
		opner.newMember.password.focus();
		self.close();
	</script>
</body>
</html>