<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
	String sql = "select id,name,passwd from member order by id;";
	ResultSet resultSet = statement.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
		</tr>
		<%
			while (resultSet.next()) {
			out.print("<tr><td><a href='updateForm.jsp?id=" + resultSet.getInt(1) + " '>" + resultSet.getInt(1)
			+ "</a></td><td>" + resultSet.getString(2) + "</td><td>" + resultSet.getString(3) + "</td></tr>");
		}
		%>
	</table>

</body>
</html>
<%
	} catch (Exception e) {
e.printStackTrace();
} finally {
connection.close();
}
%>