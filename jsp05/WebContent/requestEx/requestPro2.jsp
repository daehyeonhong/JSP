<%@page import="java.net.URLDecoder"%>
<%@page import="f.dto.Fruit"%>
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
		/* request로 넘어온 parameter characterSet을 현재 페이지의 문자셋인 UTF-8로 변환 */
	request.setCharacterEncoding("UTF-8");
	String kind = request.getParameter("kind");
	String price = request.getParameter("price");
	int iPrice = Integer.parseInt(price);
	Fruit fruit = new Fruit();
	fruit.setKind(kind);
	fruit.setPrice(iPrice);
	%>
	<%=request.getMethod()%><br />
	<%=request.getProtocol()%><br />
	<%-- <%=URLDecoder.decode(request.getQueryString())%> --%>
	<%=fruit.getKind() + ", " + fruit.getPrice()%><br />
</body>
</html>