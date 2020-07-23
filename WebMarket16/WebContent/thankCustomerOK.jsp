<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_cartId = "", shipping_name = "", shipping_shippingDate = "", shipping_country = "",
			shipping_zipCode = "", shipping_addressName = "";

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String cookieName = thisCookie.getName();
			if (cookieName.equals("Shipping_cartId")) {
		shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
			if (cookieName.equals("Shipping_shippingDate")) {
		shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
			if (cookieName.equals("Shipping_name")) {
		shipping_name = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
			if (cookieName.equals("Shipping_zipCode")) {
		shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}

		}
	}
	/* 오늘의 과제 */
	/* [Sale_Table], [Delivery_Table]에 저장. 날짜 2020/07/22 */
	try {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(shipping_shippingDate);
		Date ddd = simpleDateFormat.parse(shipping_shippingDate);
		simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String date = simpleDateFormat.format(ddd);
		System.out.println(date);
		String sql = "insert into sale(saleDate,sessionId,productId,unitPrice,saleQty)values(?,?,?,?,?)";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		/* Sale_Table 정보 얻기 */
		List<Product> cartList = (List<Product>) session.getAttribute("cartList");

		if (cartList == null) {
			cartList = new ArrayList<Product>();
		}

		/* 상품 정보 하나씩 저장 */
		for (int i = 0; i < cartList.size(); i++) {
			Product product = cartList.get(i);
			preparedStatement.setString(1, date);
			System.out.print(date);
			preparedStatement.setString(2, shipping_cartId);
			preparedStatement.setString(3, product.getProductId());
			preparedStatement.setInt(4, product.getUnitPrice());
			preparedStatement.setInt(5, product.getQuantity());
		}
		/* 		shipping_cartId;
		shipping_name;
		shipping_shippingDate; */
	} catch (Exception e) {
		e.printStackTrace();
	} finally {

	}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-success">
			<strong><%=shipping_name%></strong>님 주문해 주셔서 감사합니다.
		</h2>
		<p>
			주문은
			<%=shipping_shippingDate%>에 배송될 예정입니다.
		</p>
		<p>
			주문번호:<%=shipping_cartId%>
		</p>
	</div>
	<div class="container">
		<p>
			<a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
		</p>
	</div>
	<%
		/* session정보 삭제 */
	session.invalidate();
	/* Cookie에 저장된 장바구니 정보 삭제 */
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		/* 쿠키 유효기간 설정 0(즉시 삭제) */
		if (n.equals("Shipping_cartId")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_shippingDate")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_country")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_name")) {
			thisCookie.setMaxAge(0);
		}
		/* 응답객체 추가 */
		response.addCookie(thisCookie);
	}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>