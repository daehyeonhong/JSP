<%@page import="java.sql.PreparedStatement"%>
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
		/* Java_Program default autocommit */
		connection.setAutoCommit(false);
		/* 3. 쿼리 객체 생성 */
		String sql = "delete from member where id=?";
		System.out.printf("SQL: %s", sql);
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, Integer.parseInt(id));
		/* 4. 실행 및 결과 처리 */
		int result = preparedStatement.executeUpdate();/* [AutoCommit_False]DB에 반영X, 메모리상의 처리 */

		if (result > 0) {
			connection.commit();/* DB에 반영 처리 */
			out.print("<script>alert('삭제 성공!');location.href='memberList.jsp'</script>");
		} else {
			out.print("<script>alert('삭제 실패!');history.back();</script>");
		}
	} catch (Exception e) {
		connection.rollback();/* 되돌리기 */
		e.printStackTrace();
	} finally {
		/* Default값으로 초기화 */
		connection.setAutoCommit(true);
	}
	%>
</body>
</html>