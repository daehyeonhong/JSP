<<<<<<< HEAD
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page
	import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
=======
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
>>>>>>> ebeac89153ddd9d116a1a4651fa820487ef43434
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
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
<<<<<<< HEAD
	String fileName = "";
=======
	String filename = "";
>>>>>>> ebeac89153ddd9d116a1a4651fa820487ef43434
	String realFolder = "/resources/images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";

<<<<<<< HEAD
	MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath(realFolder), maxSize,
			new DefaultFileRenamePolicy());
	
=======
	MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath(realFolder), maxSize, encType,
			new DefaultFileRenamePolicy());

>>>>>>> ebeac89153ddd9d116a1a4651fa820487ef43434
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitInStock");
<<<<<<< HEAD
=======
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
	product.setFileName(fileName);

	productDAO.addProduct(product);
	response.sendRedirect("products.jsp");
>>>>>>> ebeac89153ddd9d116a1a4651fa820487ef43434
	%>
	<jsp:useBean id="product" class="dto.Product" />
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