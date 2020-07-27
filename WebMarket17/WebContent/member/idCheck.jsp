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
		String id = request.getParameter("id").trim();
	System.out.print(id);
	%>
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false" user="root"
		password="1234" />
	<sql:query var="resultSet" dataSource="${dataSource}">
	select*from member where id=?
	<sql:param value="<%=id%>" />
	</sql:query>
	<c:forEach var="row" items="${resultSet.rows}">
		<c:if test="${row!=null}">
			<!-- DB접속 Member_Table에서 조회 -->
			<script type="text/javascript">
				let id = window.opener.document.newMember.id.value.trim();
				alert("[" + id + "] 이미 존재하는 ID입니다.");
				/* opener: 팝업 창을 오픈한 부모 window */
				window.opener.document.newMember.id.value = ""; /* 부모창의 요소에 값 설정 */
				window.opener.document.newMember.id.focus();
				/* 부모창 요소에 focus()처리 */
				window.close(); /* 팝업창 닫기 */
			</script>
		</c:if>
	</c:forEach>
	<script type="text/javascript">
		let id = window.opener.document.newMember.id.value.trim();
		alert("[" + id + "] 사용할 수 있는 ID입니다.");
		window.opener.document.newMember.id.value = id.trim();
		window.opener.document.newMember.chkId.setAttribute("type", "hidden");
		window.opener.document.newMember.id
				.setAttribute("readonly", "readonly");
		window.opener.document.newMember.updId.setAttribute("type", "button");
		window.opener.document.newMember.submitBtn.removeAttribute("disabled");
		window.close(); /* 팝업창 닫기 */
	</script>
</body>
</html>