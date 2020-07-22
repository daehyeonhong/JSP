<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection connection = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", "root", "1234");
} catch (Exception e) {
	out.print("<h3>DATABASE 연결 실패!</h3>");
	out.print("<em>SQLException: " + e.getMessage() + "</em>");
}
%>