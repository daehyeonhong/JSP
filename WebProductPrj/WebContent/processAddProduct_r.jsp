<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session"
/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="product" class="dto.Product" />
	<%
		request.setCharacterEncoding("UTF-8");
	String realFolder = "/resources/images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";

	MultipartRequest multi = new MultipartRequest(request, getServletContext().getRealPath(realFolder), maxSize, encType,
			new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String pName = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price = unitPrice.isEmpty() ? 0 : Integer.valueOf(unitPrice);

	Long stock = unitsInStock.isEmpty() ? 0 : Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fName = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fName);

	product.setProductId(productId);
	product.setPname(pName);
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
</body>
</html>