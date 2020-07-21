<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="dbconn.jsp"%>
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
String sql = "select*from product where p_id=?";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
preparedStatement.setString(1, productId);
ResultSet resultSet = preparedStatement.executeQuery();
if (resultSet.next()) {
	if (fileName != null) {/* 파일 전송시 처리 */
		sql = "update product set p_name=?,p_unitPrice=?,p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=?,p_condition=?,p_fileName=? where p_id=?";
		/* 바인딩 변수 설정 */
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, pName);
		preparedStatement.setInt(2, price);
		preparedStatement.setString(3, description);
		preparedStatement.setString(4, category);
		preparedStatement.setString(5, manufacturer);
		preparedStatement.setLong(6, stock);
		preparedStatement.setString(7, condition);
		preparedStatement.setString(8, fileName);
		preparedStatement.setString(9, productId);
		/* 입력 실행 */
		preparedStatement.executeUpdate();
	} else {/* 파일 미전송시 처리 */
		sql = "update product set p_name=?,p_unitPrice=?,p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=?,p_condition=? where p_id=?";
		/* 바인딩 변수 설정 */
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, pName);
		preparedStatement.setInt(2, Integer.parseInt(unitPrice));
		preparedStatement.setString(3, description);
		preparedStatement.setString(4, category);
		preparedStatement.setString(5, manufacturer);
		preparedStatement.setLong(6, Long.parseLong(unitsInStock));
		preparedStatement.setString(7, condition);
		preparedStatement.setString(8, productId);
		/* 입력 실행 */
		preparedStatement.executeUpdate();
	}
}
if (resultSet != null) {
	resultSet.close();
}
if (preparedStatement != null) {
	preparedStatement.close();
}

if (connection != null) {
	connection.close();
}
response.sendRedirect("./editProduct.jsp?edit=update");
%>