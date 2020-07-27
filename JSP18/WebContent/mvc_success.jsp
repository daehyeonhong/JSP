<%@page import="JSP18.com.model.LoginBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<span>로그인 성공하였습니다.</span>
	<br />
	<%
		LoginBean bean = (LoginBean) request.getAttribute("bean");
	out.print("ID: " + bean.getId());
	%>
</body>
</html>