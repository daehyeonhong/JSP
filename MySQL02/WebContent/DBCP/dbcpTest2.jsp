<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP</title>
</head>
<body>
	<%
		Connection connection = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/MysqlDB");
		connection = dataSource.getConnection();
		out.print("<h3>연결에 성공하였습니다!</h3>");
	} catch (Exception e) {
		out.print("<h3>연결에 실패하였습니다!</h3>");
		e.printStackTrace();
	} finally {
		if (connection != null) {
			connection.close();
		}
	}
	%>
</body>
</html>