<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<%@include file="numberFormat.jsp"%>
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
			if (cookieName.equals("Shipping_country")) {
		shipping_country = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
			if (cookieName.equals("Shipping_addressName")) {
		shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
		}
	}
	System.out.println(shipping_shippingDate);
	/* 오늘의 과제 */
	/* [Sale_Table], [Delivery_Table]에 저장. 날짜 2020/07/22 */
	try {
		connection.setAutoCommit(false);
		Date delDate = readDateFormat.parse(shipping_shippingDate);
		String deliveryDate = writeDateFormat.format(delDate);
		String currDate = writeDateFormat.format(new Date());
		String sql = "insert into sale(saleDate,sessionId,productId,unitPrice,saleQty)values(?,?,?,?,?)";
		PreparedStatement preparedStatementSale = connection.prepareStatement(sql);

		/* Sale_Table 정보 얻기 */
		List<Product> cartList = (List<Product>) session.getAttribute("cartList");

		/* 상품 정보 하나씩 저장 */
		int resultSale = 0;
		int cnt = 0;
		int i = 0;
		for (i = 0; i < cartList.size(); i++) {
			Product product = cartList.get(i);
			preparedStatementSale.setString(1, currDate);
			System.out.println(1 + i + "번" + currDate);
			preparedStatementSale.setString(2, shipping_cartId);
			preparedStatementSale.setString(3, product.getProductId());
			preparedStatementSale.setInt(4, product.getUnitPrice());
			preparedStatementSale.setInt(5, product.getQuantity());
			resultSale = preparedStatementSale.executeUpdate();
			cnt++;
		}

		sql = "insert into delivery(sessionId,name,deliveryDate,nation,zipCode,address)values(?,?,?,?,?,?)";
		PreparedStatement preparedStatementDelivery = connection.prepareStatement(sql);
		preparedStatementDelivery.setString(1, shipping_cartId);
		preparedStatementDelivery.setString(2, shipping_name);
		preparedStatementDelivery.setString(3, deliveryDate);
		preparedStatementDelivery.setString(4, shipping_country);
		preparedStatementDelivery.setString(5, shipping_zipCode);
		preparedStatementDelivery.setString(6, shipping_addressName);
		int resultDel = preparedStatementDelivery.executeUpdate();
		if (resultDel > 0 && resultSale > 0 && i == cnt) {
			connection.commit();
		} else {
			connection.rollback();
		}
	} catch (Exception e) {
		out.print("<em>SQLException: " + e.getMessage() + "</em>");
		connection.rollback();
	} finally {
		connection.setAutoCommit(true);
		if (connection != null) {
			connection.close();
		}
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
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./products.jsp"
						class="btn btn-secondary">&laquo;상품 목록</a></td>
					<td align="right"><a href="./deliveryList.jsp"
						class="btn btn-primary">배송 목록&raquo;</a></td>
				</tr>
			</table>
		</div>
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