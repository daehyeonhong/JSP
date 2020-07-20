<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection connection = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", "root", "1234");
	out.println(connection != null ? "연결 성공!" : "연결 실패!");
	out.print("<br />");

	Statement statement = connection.createStatement();
	String sql = "select name,passwd from member order by name desc";
	ResultSet resultSet = statement.executeQuery(sql);
	out.print("<table border='1'>");
	out.print("<tr><th>이름</th><th>비밀번호</th></tr>");
	while (resultSet.next()) {
		out.print("<tr><td>" + resultSet.getString(1) + "</td><td>" + resultSet.getString(2) + "</td></tr>");
	}
	out.print("</table>");
} catch (Exception e) {
	e.getStackTrace();
} finally {
	connection.close();
}
%>