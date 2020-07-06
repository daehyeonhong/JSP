<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page
	import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
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
	<jsp:useBean id="product" class="dto.Product" />
	<%
		request.setCharacterEncoding("UTF-8");
	String fileName = "";
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
	String unitsInStock = multi.getParameter("unitInStock");
	%>
</body>
</html>