<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
String categoryName = /* request.getParameter("categoryName") */"a",
		description = /* request.getParameter("description") */"b";
%>

<script type="text/javascript">
	function checkAdd(categoryName, description) {
		let checkAddCate = confirm(('정말 ' + categoryName
				+ '을(를) 추가 하시겠습니까?\n\r설명:' + description));
		if (!checkAddCate) {
			alert('location.href전');
			location.href = "./addCategory.jsp";
			return;
			alert('location.href후');
		}
	}
</script>
<%
	out.print("<script>checkAdd('" + categoryName + "','" + description + "');</script>");
PreparedStatement preparedStatement = null;
try {
	connection.setAutoCommit(false);
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