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
		String dan = request.getParameter("dan");//"3"
	int idan = Integer.parseInt(dan);
	for (int i = 1; i <= 9; i++) {
	%>
	<%=idan%>*<%=i%>=<%=idan * i%><br>
	<%
		}
	%>
</body>
</html>