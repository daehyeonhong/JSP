<%@page import="dto.Fruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>next.jsp</h2>
	<!-- 출력 -->
	<%=((Fruit) request.getAttribute("apple")).getKind()%><br />
	<%=((Fruit) request.getAttribute("apple")).getPrice()%><br />

	<%=((Fruit) session.getAttribute("grape")).getKind()%><br />
	<%=((Fruit) session.getAttribute("grape")).getPrice()%><br />

	<%=((Fruit) application.getAttribute("mango")).getKind()%><br />
	<%=((Fruit) application.getAttribute("mango")).getPrice()%><br />

	<%-- <%=((Fruit) pageContext.getAttribute("banana")).getKind()%><br />
	<%=((Fruit) pageContext.getAttribute("banana")).getPrice()%><br /> --%>
	<jsp:forward page="next2.jsp" />
</body>
</html>