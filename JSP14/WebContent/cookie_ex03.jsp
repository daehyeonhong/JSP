<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie 정보 삭제</title>
</head>
<body>
	<%
		/* 클라이언트로부터 넘어온 request 객체에서 Cookie얻기 */
	Cookie[] cookies = request.getCookies();

	/* 개별 Cookie별로 유효시간을 0으로 처리 cookie.setMaxAge(0); */
	for (int i = 0; i < cookies.length; i++) {
		cookies[i].setMaxAge(0);
		/* setMaxAge(0) -> Client가 response를 받은 즉시 삭제 */
		/* setMaxAge(-n) -> Browser가 종료되면 삭제 */
		response.addCookie(cookies[i]);
	}
	response.sendRedirect("cookie_read.jsp");
	%>
</body>
</html>