<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id"), user_pw = request.getParameter("passwd");

	if (user_id.equals("admin") && user_pw.equals("1234")) {
		/* 쿠키에 정보를 저장 */

		/* 1. 쿠키 생성 */
		Cookie cookie_id = new Cookie("userID", user_id);
		Cookie cookie_pw = new Cookie("userPW", user_pw);

		/* 2. 클라이언트에 쿠키 저장(전송) */
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);

		out.print("쿠키 생성 성공!<br />");

		out.print(user_id + "님 환영합니다.");
	} else {
		out.print("로그인 실패!");
	}
	%>
</body>
</html>