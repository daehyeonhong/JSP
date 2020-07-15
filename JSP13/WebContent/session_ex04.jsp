<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>─────세션 삭제 전─────</h4>
	<%
		String user_id = (String) session.getAttribute("userID"), user_pw = session.getAttribute("userPW").toString();
	out.print("설정된 세션이름: userID: " + user_id + "<br />");
	out.print("설정된 세션이름: userPW: " + user_pw + "<br /><br />");

	/* 세션에서 속성 제거 */
	session.removeAttribute("userID");
	%>

	<h4>─────세션 삭제 후─────</h4>
	<%
		user_id = (String) session.getAttribute("userID");
	user_pw = session.getAttribute("userPW").toString();
	out.print("설정된 세션이름: userID: " + user_id + "<br />");
	out.print("설정된 세션이름: userPW: " + user_pw + "<br /><br />");
	%>
</body>
</html>