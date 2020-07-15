<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Process</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id"), user_pw = request.getParameter("passwd");
	if (user_id.equals("admin") && user_pw.equals("1234")) {
		/* 세션에 정보 저장 */
		session.setAttribute("userID", user_id);
		session.setAttribute("userPW", user_pw);
		out.print("세션 설정 성공!<br />" + user_id + "님 환영합니다.");
	} else {
		out.print("세션 설정에 실패했습니다.");
	}
	%>
</body>
</html>