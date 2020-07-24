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
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false" user="root"
		password="1234" />
	<sql:query var="resultSet" dataSource="${dataSource}">
	select*from member where id=?
	<sql:param value="<%=id%>" />
	</sql:query>
	<c:forEach var="row" items="${resultSet.rowsByIndex}">
		<c:forEach items="${row}" var="column">
			<c:if test="${row!=null}">
				<c:if test="${column!=null}">
					<c:if test="${column==0}">
						<script type="text/javascript">
							alert("사용할 수 있는 ID입니다.");
							window.opener.document.newMember.id.setAttribute(
									"readonly", "readonly");
							window.opener.document.newMember.changeId
									.setAttribute("type", "button");
							window.close(); /* 팝업창 닫기 */
						</script>
					</c:if>
					<c:if test="${column!=0}">
						<!-- DB접속 Member_Table에서 조회 -->
						<script type="text/javascript">
							alert("이미 존재하는 ID입니다.");
							/* opener: 팝업 창을 오픈한 부모 window */
							window.opener.document.newMember.id.value = ""; /* 부모창의 요소에 값 설정 */
							window.opener.document.newMember.id.focus();
							/* 부모창 요소에 focus()처리 */
							window.close(); /* 팝업창 닫기 */
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
</body>
</html>