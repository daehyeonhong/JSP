<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/DBConnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	String sql = "select count(*)from member where id=?";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, id);

	ResultSet resultSet = preparedStatement.executeQuery();
	while (resultSet.next()) {
		if (resultSet.getString(1).equals("0")) {
	%>
	<script type="text/javascript">
		alert("사용할 수 있는 ID입니다.");
		window.opener.document.newMember.id
				.setAttribute("readonly", "readonly");
		window.opener.document.newMember.changeId
				.setAttribute("type", "button");
		window.opener.document.newMember.submit1.removeAttribute("disabled");
		window.close(); /* 팝업창 닫기 */
	</script>
	<%
		} else {
	%>
	<!-- DB접속 Member_Table에서 조회 -->
	<script type="text/javascript">
		alert("이미 존재하는 ID입니다.");
		/* opener: 팝업 창을 오픈한 부모 window */
		window.opener.document.newMember.submit1
				.setAttribute("disalbed=\"disabled\"");
		window.opener.document.newMember.id.value = ""; /* 부모창의 요소에 값 설정 */
		window.opener.document.newMember.id.focus();
		/* 부모창 요소에 focus()처리 */
		window.close(); /* 팝업창 닫기 */
	</script>
	<%
		}
	}
	%>
</body>
</html>