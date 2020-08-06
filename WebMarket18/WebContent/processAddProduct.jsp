<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
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
	String category = multi.getParameter("category");
	String manufacturer = multi.getParameter("manufacturer");
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

	/* Query객체 생성 */
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	/* 바인딩 변수 설정 */
	preparedStatement.setString(1, productId);
	preparedStatement.setString(2, pName);
	preparedStatement.setInt(3, price);
	preparedStatement.setString(4, description);
	preparedStatement.setString(5, category);
	preparedStatement.setString(6, manufacturer);
	preparedStatement.setLong(7, stock);
	preparedStatement.setString(8, condition);
	preparedStatement.setString(9, fileName);
	/* 입력 실행 */
	preparedStatement.executeUpdate();

	if (preparedStatement != null) {
		preparedStatement.close();
	}

	if (connection != null) {
		connection.close();
	}

	response.sendRedirect("./products.jsp");
	%>
</body>
</html>
