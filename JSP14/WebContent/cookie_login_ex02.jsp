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
		String id = "";
	String pwd = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("userPW")) {
		pwd = cookies[i].getValue();
			} else if (cookies[i].getName().equals("userID")) {
		id = cookies[i].getValue();
			}
		}
	}

	if (id.equals("admin") && pwd.equals("1234")) {
		out.print("로그인 성공!");
	} else {
		out.print("로그인 실패!");
	}
	%>
</body>
</html>