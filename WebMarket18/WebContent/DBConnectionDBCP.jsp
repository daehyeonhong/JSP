<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection connection = null;
try {
	Context initCtx = new InitialContext(), ctx = (Context) initCtx.lookup("java:comp/env");
	DataSource dataSource = (DataSource) ctx.lookup("jdbc/MysqlDB");
	connection = dataSource.getConnection();
} catch (Exception e) {
	out.print("<h3><em>DATABASE 연결 실패!</em></h3>");
	out.print("SQLException: " + e.getMessage());
}
%>