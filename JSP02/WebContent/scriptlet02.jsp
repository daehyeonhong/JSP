<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 정수의 합 출력하기</title>
</head>
<body>
	<%
		int x = 2, y = 3, result = x + y;
	/* out - jsp에 내장된 객체참조변수 출력용 */
	out.println("두 수의 합은: " + result);
	%>
	<%-- <%=result%> --%>
</body>
</html>