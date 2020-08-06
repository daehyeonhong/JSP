<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = (String) session.getAttribute("userID"), user_pw = (String) session.getAttribute("userPW");

	out.print("설정된 세션의 속성값[1]: " + user_id + "<br />" + "설정된 세션의 속성값[2]: " + user_pw + "<br />");
	%>
</body>
</html>