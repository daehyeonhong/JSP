<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DB연결 모듈만 include해서 실행 -->
<%@include file="dbcpTest.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name"), passwd = request.getParameter("passwd");

	String sql = "insert into member(name,passwd)values(?,?)";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, passwd);

	int result = preparedStatement.executeUpdate();
	if (result > 0) {
		out.print("<script>alert('입력 성공!');location.href='memberListDBCP.jsp';</script>");
	} else {
		out.print("<script>alert('입력 실패!');history.back();</script>");
	}
	%>
</body>
</html>