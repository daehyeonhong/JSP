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
	if (cartList == null) {
		System.out.print("세션에 cartList정보가 없음, 새로 만듦");
	}

	/* 상품 리스트 하나씩 출력 */
	for (int i = 0; i < cartList.size(); i++) {
		Product product = cartList.get(i);
		if (product.getProductId().equals(id)) {
			product.setQuantity(qty);
		}
	}
	response.sendRedirect("./cart.jsp");
	%>
	<%=request.getParameter("id")%><br />
	<%=request.getParameter("qty")%><br />
</body>
</html>