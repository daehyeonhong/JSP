<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<%
	String id = request.getParameter("id");
/* parameter로 넘어온 ID정보가 없으면 */
if (id == null || id.trim().equals("")) {
	/* 상품리스트로 이동 */
	response.sendRedirect("products.jsp");
	return;
}

/* parameter로 넘어온 ID정보가 있을 때 */
String sql = "select p_id from product where p_id=?";
PreparedStatement preparedStatement = connection.prepareStatement(sql);
preparedStatement.setString(1, id);
Product product = null;
ResultSet resultSet = preparedStatement.executeQuery();
if (resultSet.next()) {
	product = new Product();
}

/* 상품정보 얻기 */

/* 해당 상품 정보가 없으면 ErrorPage로 이동 */
if (product == null) {
	response.sendRedirect("exceptionNoProductId.jsp");
}

/* 해당 상품 정보가 있으면 */
/* cartList에서 해당 상품 정보 얻기 */
List<Product> cartList = (List<Product>) session.getAttribute("cartList");
/* 해당 상품 정보가 cartList에 있으면 */
Product goodsQnt = new Product();
for (int i = 0; i < cartList.size(); i++) {
	goodsQnt = cartList.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cartList.remove(goodsQnt);/* 해당 상품을 cartList에서 삭제 */
	}
}

/* 삭제한 내용 확인을 위해 cartPage로 이동 */
response.sendRedirect("cart.jsp");

if (resultSet != null) {
	resultSet.close();
}

if (preparedStatement != null) {
	preparedStatement.close();
}

if (connection != null) {
	connection.close();
}
%>