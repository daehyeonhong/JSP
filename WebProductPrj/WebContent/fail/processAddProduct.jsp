<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="product" class="dto.Product" />
	<%
		String filename = "";
	String realFolder = "/resources/images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";

	MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath(realFolder), maxSize,
			new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	System.out.println(pname);
	%>
	<%
		int price;

	if (unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.parseInt(unitPrice);
	}

	long stock;

	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.parseLong(unitsInStock);
	}

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	product.setProductId(productId);
	product.setPname(pname);
	product.setUnitPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	product.setFilename(fileName);

	productDAO.addProduct(product);
	response.sendRedirect("products.jsp");
	%>

	<%-- <jsp:getProperty property="productId" name="product" />
	<jsp:getProperty property="pname" name="product" />
	<jsp:getProperty property="unitPrice" name="product" />
	<jsp:getProperty property="description" name="product" />
	<jsp:getProperty property="manufacturer" name="product" />
	<jsp:getProperty property="category" name="product" />
	<jsp:getProperty property="unitsInStock" name="product" />
	<jsp:getProperty property="condition" name="product" /> --%>

</body>
</html>