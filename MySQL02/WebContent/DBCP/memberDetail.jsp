<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbcpTest.jsp"%>
<%
	try {
	request.setCharacterEncoding("UTF-8");
	String sql = "select*from member where id=?";
	String id_ = request.getParameter("id");
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setInt(1, Integer.parseInt(id_));
	ResultSet resultSet = preparedStatement.executeQuery();
	if (resultSet.next()) {
		int id = resultSet.getInt(1);
		String name = resultSet.getString(2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateMember.jsp" method="post">
	<label>아이디: </label><input type="text" name="" disabled="disabled" value="<%=id%>" />
	<input type="hidden" name="id" value="<%=id%>" />
	<label>이름: </label><input type="text" name="name" value="<%=name%>"/>
	<label>비밀번호: </label><input type="password" name="passwd" id="passwd" />
	<label>비밀번호 확인: </label><input type="password" name="passwd2" id="passwd2" />
	<input type="submit" value="수정" onclick="return check()" />
	<input type="reset" value="취소" />
	<input type="button" value="리스트로" onclick="goList()" />
	<input type="button" value="삭제" onclick="isDelete(<%=id%>)" />
	</form>
</body>
<script type="text/javascript">
	function goList() {
		location.href = 'memberListDBCP.jsp';
	}
	function check() {
		let pwd1 = document.getElementById("passwd").value;
		let pwd2 = document.getElementById("passwd2").value;
		if (pwd1.length > 0) {
			if (pwd1 != pwd2) {
				document.getElementById("passwd").focus();
				alert("비밀번호가 서로 다릅니다.")
				return false;
			}
		}
	}
	function isDelete(id) {
		let yesNo = confirm(id + "를 삭제할까요?");
		if (yesNo) {
			location.href = 'memberDelete.jsp?id=' + id;
		}
	}
</script>
</html>
<%
	}
} catch (Exception e) {
e.printStackTrace();
} finally {
connection.close();
}
%>