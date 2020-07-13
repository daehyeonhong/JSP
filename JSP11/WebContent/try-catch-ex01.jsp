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
		/* try~catch(예외){예외처리} */
	try {
		int num = 10 / 0;
	} catch (ArithmeticException e) {
		/* out.print(e.getMessage()); */
		/* request.getRequestDispatcher(이동경로); */
		RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");

		/* request와 response를 담아서 forward */
		dispatcher.forward(request, response);
	}
	%>

</body>
</html>