<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
/* 1. DB 드라이버 로딩 */
Connection connection = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	/* 2. 연결 맺기 */
	String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", user = "root", password = "1234";
	connection = DriverManager.getConnection(url, user, password);
	/* 3. Statement문 생성 */
	Statement statement = connection.createStatement();
	/* 4. Query 실행 및 결과 처리 */
	String sql = "select id,name,passwd from member where id=" + id;
	ResultSet resultSet = statement.executeQuery(sql);
	if (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updatePro.jsp" method="post">
	<!-- disabled의 값은 전송 불가 -->
	<!-- hidden_Tag에 태워서 전송 -->
		<label>아이디</label> <input type="text" name="id" value="<%=resultSet.getInt(1)%>" disabled="disabled" /><br />
		<input type="hidden" name="id" value="<%=resultSet.getInt(1)%>" />
		<label>이름</label> <input type="text" name="name" value="<%=resultSet.getString(2)%>" /><br />
		<label>비밀번호</label> <input type="password" name="passwd" value="<%=resultSet.getString(3)%>" /><br />
		<input type="submit" value="전송" />
		<input type="reset" value="취소" />
		<input type="button" onclick="javascript:location.href='memberList.jsp'" value="리스트로" />
	</form>
	<input type="button" value="삭제" onclick="isDelete(<%=resultSet.getInt(1)%>)" />
</body>
<script>
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
}
%>