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
	connection = DriverManager
	.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false&user=root&password=1234");

	out.print(connection != null ? "연결 성공!" : "연결 실패!");
	out.print("<br />");

	Statement statement = connection.createStatement();

	String sql = "select*from member where id=1";

	/* 쿼리 결과 받기 */
	ResultSet resultSet = statement.executeQuery(sql);
	resultSet.next();
	out.print(resultSet.getInt(1) + ", " + resultSet.getString(2) + ", " + resultSet.getString(3) + "<br />");
} catch (Exception e) {
	e.printStackTrace();
} finally {
	connection.close();
}
%>