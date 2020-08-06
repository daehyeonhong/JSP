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
		/* name, value 속성 저장하여 request에 실어서 전송 */
	/* setAttribute(name, 객체(Object)); */
	request.setAttribute("name", "홍길동");
	request.setAttribute("age", "18");
	RequestDispatcher rd = request.getRequestDispatcher("to.jsp");
	rd.forward(request, response);
	%>
</body>
</html>