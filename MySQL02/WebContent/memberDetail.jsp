<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbcpTest.jsp"%>
<%
	try {
	request.setCharacterEncoding("UTF-8");
	String sql = "select*from member where id=?";
	String id = request.getParameter("id");
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setInt(1, Integer.parseInt(id));
	ResultSet resultSet = preparedStatement.executeQuery();
	if (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateMember.jsp" method="post">
	<label>아이디: </label><input type="text" name="" disabled="disabled" value="<%=resultSet.getInt(1)%>" />
	<input type="hidden" name="id" value="<%=resultSet.getInt(1)%>" />
	<label>이름: </label><input type="text" name="name" value="<%=resultSet.getString(2)%>"/>
	<label>비밀번호: </label><input type="password" name="passwd" id="passwd" />
	<label>비밀번호 확인: </label><input type="password" name="passwd2" id="passwd2" />
	<input type="submit" value="수정" onclick="return check()" />
	<input type="reset" value="취소" />
	<input type="button" value="리스트로" onclick="goList()" />
	</form>
</body>
<script type="text/javascript">
	function goList() {
		location.href = 'memberList.jsp';
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