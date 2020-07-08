<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="f.dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="product" class="f.dto.Product" />
	<jsp:setProperty property="*" name="product" />
	<%-- <jsp:getProperty property="productId" name="product" />
	<jsp:getProperty property="pname" name="product" />
	<jsp:getProperty property="unitPrice" name="product" />
	<jsp:getProperty property="description" name="product" />
	<jsp:getProperty property="manufacturer" name="product" />
	<jsp:getProperty property="category" name="product" />
	<jsp:getProperty property="unitsInStock" name="product" />
	<jsp:getProperty property="condition" name="product" /> --%>
	<%
		productDAO.addProduct(product);
	response.sendRedirect("./products.jsp");
	%>
</body>
</html>