<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"), name = request.getParameter("name"),
		postcode = request.getParameter("postcode"), address = request.getParameter("address"),
		detailAddress = request.getParameter("detailAddress"), extraAddress = request.getParameter("extraAddress");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id%><br />
	<%=name%><br />
	<%=postcode%><br />
	<%=address%><br />
	<%=detailAddress%><br />
	<%=extraAddress%><br />
</body>
</html>