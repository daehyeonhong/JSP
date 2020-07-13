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
	<%
		Fruit fruit1 = new Fruit();
	fruit1.setKind("사과-request");
	fruit1.setPrice(3000);
	request.setAttribute("apple", fruit1);

	fruit1 = new Fruit();
	fruit1.setKind("포도-session");
	fruit1.setPrice(5000);
	session.setAttribute("grape", fruit1);

	fruit1 = new Fruit();
	fruit1.setKind("망고-application");
	fruit1.setPrice(7000);
	application.setAttribute("mango", fruit1);

	fruit1 = new Fruit();
	fruit1.setKind("바나나-pageContext");
	fruit1.setPrice(9000);
	pageContext.setAttribute("banana", fruit1);
	%>
	<!-- 출력 -->


	<%=((Fruit) request.getAttribute("apple")).getKind()%><br />
	<%=((Fruit) request.getAttribute("apple")).getPrice()%><br />

	<%=((Fruit) session.getAttribute("grape")).getKind()%><br />
	<%=((Fruit) session.getAttribute("grape")).getPrice()%><br />

	<%=((Fruit) application.getAttribute("mango")).getKind()%><br />
	<%=((Fruit) application.getAttribute("mango")).getPrice()%><br />

	<%=((Fruit) pageContext.getAttribute("banana")).getKind()%><br />
	<%=((Fruit) pageContext.getAttribute("banana")).getPrice()%><br />

	<jsp:forward page="next.jsp"></jsp:forward>
</body>
</html>