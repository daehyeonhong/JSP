<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	let yesNo = confirm(
<%=id%>
	+ "을(를) 정말 삭제하시겠습니까?");
	if (yesNo) {
		//삭제처리
		alert("삭제합니다.");
	} else {
		history.back();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* 1. Driver Load */
	Connection connection = null;
	try {
		/* 2. DB연결 객체 생성 */
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", user = "root", password = "1234";
		connection = DriverManager.getConnection(url, user, password);
		/* 3. 쿼리 객체 생성 */
		String sql = "delete from member where id=" + id;
		System.out.printf("SQL: %s%n", sql);
		Statement statement = connection.createStatement();
		/* 4. 실행 및 결과 처리 */
		int result = statement.executeUpdate(sql);

		if (result > 0) {
			out.print("<script>alert('삭제 성공!');</script>");
			out.print("<script>location.href='memberList.jsp'</script>");
		} else {
			out.print("<script>alert('삭제 실패!');</script>");
			out.print("<script>history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		connection.close();
	}
	%>
</body>
</html>