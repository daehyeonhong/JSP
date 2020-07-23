<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
PreparedStatement preparedStatement = null;
try {
	connection.setAutoCommit(false);
	String categoryName = request.getParameter("categoryName"), description = request.getParameter("description");
	String sql = "insert into category(categoryName,description)values(?,?)";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, categoryName);
	preparedStatement.setString(2, description);
	int result = preparedStatement.executeUpdate();

	if (result > 0) {
		out.print("<script>alert('" + categoryName + " 추가 완료!');</script>");
		connection.commit();
	} else {
		out.print("<script>alert('카테고리 추가 실패!');</script>");
		connection.rollback();
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	connection.setAutoCommit(true);

	if (preparedStatement != null) {
		preparedStatement.close();
	}

	if (connection != null) {
		connection.close();
	}
}
out.print("<script>location.href='addCategory.jsp'</script>");
%>