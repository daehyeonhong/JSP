<%@page import="dto.Fruit"%>
<%@page import="java.net.URLDecoder"%>
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
		String kind = request.getParameter("kind");
	String price = request.getParameter("price");
	int iPrice = Integer.parseInt(price);
	Fruit fruit = new Fruit();
	fruit.setKind(kind);
	fruit.setPrice(iPrice);
	%>
	<%=request.getMethod()%><br />
	<%=request.getProtocol()%><br />
	<%=URLDecoder.decode(request.getQueryString())%>
	<%=fruit.getKind() + "," + fruit.getPrice()%><br />
</body>
</html>