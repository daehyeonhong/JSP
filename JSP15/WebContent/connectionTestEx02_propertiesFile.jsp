<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection connection = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String path = "/dbconnection.properties", realPath = application.getRealPath(path);
	out.print(realPath + "<br />");
	File file = new File(realPath);
	FileReader read = new FileReader(file);
	Properties properties = new Properties();
	properties.load(read);
	/*
	 * properties.put("user", "root"); properties.put("password", "1234");
	 */
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB", properties);
	out.println(connection != null ? "연결 성공!" : "연결 실패!");
} catch (Exception e) {
	e.printStackTrace();
} finally {
	connection.close();
}
%>