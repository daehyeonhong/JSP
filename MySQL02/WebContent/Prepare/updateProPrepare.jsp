<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"), name = request.getParameter("name"), passwd = request.getParameter("passwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id%><br />
	<%=name%><br />
	<%=passwd%><br />
	<%
		/* 1. 드라이버 로딩 */
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		/* 2. 연결 맺기 */
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", user = "root", password = "1234";
		connection = DriverManager.getConnection(url, user, password);

		/* 3. 쿼리객체 생성 */
		String sql = "update member set name=?,passwd=? where id=?";
		System.out.printf("SQL: %s%n", sql);
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, passwd);
		preparedStatement.setInt(3, Integer.parseInt(id));
		/* 4. 쿼리 실행 및 결과 처리 */
		int result = preparedStatement.executeUpdate();
		if (result > 0) {
			out.print("<script>alert('수정 완료!');</script>");
			out.print("<script>location.href='updateFormPrepare.jsp?id=" + id + "'</script>");
		} else {
			out.print("<scritp>alert('수정 실패!');</script>");
			out.print("<scritp>history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>