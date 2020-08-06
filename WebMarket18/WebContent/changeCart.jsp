<%@page import="java.util.stream.Stream"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
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
		String id = request.getParameter("id");
	int qty = Integer.parseInt(request.getParameter("qty"));
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");

	/* 상품 리스트 하나씩 출력 */
	for (Product product : cartList) {
		if (product.getProductId().equals(id)) {
			product.setQuantity(qty);
		}
	}

	/* Stream<Product> stream = cartList.stream();
	stream.filter(t -> t.getProductId().equals(id)).peek(t -> t.setQuantity(qty)); */

	/* 수량 변경 적용을 위해 cartPage로 이동. */
	response.sendRedirect("./cart.jsp");
	%>
</body>
</html>