<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="product" class="dto.Product" />
	<%
		request.setCharacterEncoding("UTF-8");
	String realFoler = "/resources/images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";
	MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath(realFoler), maxSize, encType,
			new DefaultFileRenamePolicy());
	String productId = multi.getParameter("productId");
	String pName = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price;
	if (unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}

	long stock;
	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}

	Enumeration files = multi.getFileNames();
	String fName = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fName);
	%>

	<jsp:setProperty property="productId" name="product"
		value="<%=productId%>" />
	<jsp:setProperty property="pname" name="product" value="<%=pName%>" />
	<jsp:setProperty property="unitPrice" name="product" value="<%=price%>" />
	<jsp:setProperty property="description" name="product"
		value="<%=description%>" />
	<jsp:setProperty property="manufacturer" name="product"
		value="<%=manufacturer%>" />
	<jsp:setProperty property="category" name="product"
		value="<%=category%>" />
	<jsp:setProperty property="unitsInStock" name="product"
		value="<%=stock%>" />
	<jsp:setProperty property="condition" name="product"
		value="<%=condition%>" />
	<jsp:setProperty property="filename" name="product"
		value="<%=fileName%>" />

	<%
		productDAO.addProduct(product);
	response.sendRedirect("./products.jsp");
	%>
</body>
</html>
