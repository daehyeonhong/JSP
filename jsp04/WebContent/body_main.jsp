<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<h2>
		<%=request.getParameter("myname")%><br />
		<!-- myName="hong" -->
	</h2>

	<jsp:include page="body_sub.jsp"><jsp:param value="홍길동"
			name="myname" /></jsp:include>

	<h2>
		<%=request.getParameter("myname")%><br />
		<!-- myName="hong" -->
	</h2>
</body>
</html>