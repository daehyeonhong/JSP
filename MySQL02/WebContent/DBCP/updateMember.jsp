<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbcpTest.jsp"%>
<%
	try {
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"), name = request.getParameter("name"),
	passwd = request.getParameter("passwd");
	PreparedStatement preparedStatement = null;
	String sql = "";

	if (name != null && !"".equals(name)) {
		sql = "update member set name=? where id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, name);
		preparedStatement.setInt(2, Integer.parseInt(id));
		preparedStatement.executeUpdate();
	}

	if (passwd != null && !"".equals(passwd)) {
		sql = "update member set passwd=? where id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, passwd);
		preparedStatement.setInt(2, Integer.parseInt(id));
		preparedStatement.executeUpdate();
	}
%>
<script>
	alert("수정 완료!");
	location.href = 'memberDetail.jsp?id=<%=id%>';
</script>
<%
	} catch (Exception e) {
e.printStackTrace();
} finally {
connection.close();
}
%>