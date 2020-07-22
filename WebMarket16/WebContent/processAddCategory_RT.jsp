<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
String categoryName = request.getParameter("categoryName"), description = request.getParameter("description");
String sql = "insert into category(categoryName,description)values(?,?)";
PreparedStatement preparedStatement = connection.prepareStatement(sql);

preparedStatement.setString(1, categoryName);
preparedStatement.setString(2, description);

int result = preparedStatement.executeUpdate();

preparedStatement.close();
connection.close();
response.sendRedirect("./products.jsp");
%>