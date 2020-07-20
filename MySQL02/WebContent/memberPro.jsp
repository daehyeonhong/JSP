<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 처리</title>
</head>
<body>
	<%
		/* 문자셋 한글 설정 */
	request.setCharacterEncoding("UTF-8");
	/* 1. 드라이버 로딩 */
	Connection connection = null;
	try {
		String name = request.getParameter("name"), passwd = request.getParameter("passwd");
		Class.forName("com.mysql.jdbc.Driver");

		/* 2. 연결 객체 생성 */
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", user = "root", password = "1234";
		connection = DriverManager.getConnection(url, user, password);

		/* 3. 쿼리 객체 생성 */
		Statement statement = connection.createStatement();

		/* 4. 쿼리문 실행 및 결과 받기 */
		/* 4-1. 데이터 입력 쿼리 */
		String sql = "insert member(name,passwd)values('" + name + "','" + passwd + "');";
		System.out.printf("쿼리문: %s%n", sql);

		/* 4-2. 입력 처리 excuteUpdate()의 결과는 반영된 행의 수 */
		int result = statement.executeUpdate(sql);

		/* 5. 결과 처리 */
		if (result > 0) {
			out.print("<script>alert('입력 성공!');");
			out.print("</script>");
		} else {
			out.print("<script>alert('입력 실패!');history.back();");
			out.print("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	/* 6. 자원 해제 */
	connection.close();
	%>
</body>
</html>