<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
Date saleDate = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String date = simpleDateFormat.format(saleDate);
String shipping_cartId = session.getId(), shipping_name = "", shipping_shippingDate = "", shipping_country = "",
		shipping_zipCode = "", shipping_addressName = "";
DecimalFormat priceDf = new DecimalFormat("\u00A4 #,###");
DecimalFormat df = new DecimalFormat("#,###");
/* request객체로부터 쿠키 정보 얻기 getCookies() */
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_CartID")) {
	shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		} else if (n.equals("Shipping_name")) {
	shipping_name = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		} else if (n.equals("Shipping_shippingDate")) {
	shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		} else if (n.equals("Shipping_country")) {
	shipping_country = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		} else if (n.equals("Shipping_zipCode")) {
	shipping_zipCode = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		} else if (n.equals("Shipping_addressName")) {
	shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
		}
	}
}
%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br />성명:
				<%=shipping_name%><br /> 우편번호:
				<%=shipping_zipCode%><br /> 주소:
				<%=shipping_addressName%><br />
			</div>
			<div class="col-4" align="right">
				<p>
					<em>주문일: <%=date%></em><br /> <em>배송 예정일: <%=shipping_shippingDate%></em><br />
				</p>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;/* 총합계 */
				List<Product> cartList = (List<Product>) session.getAttribute("cartList");

				if (cartList == null) {
					cartList = new ArrayList<Product>();
				}

				/* 상품 리스트 하나씩 출력 */
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%></em></td>
					<td class="text-center"><%=df.format(product.getQuantity())%></td>
					<td class="text-center"><%=priceDf.format(product.getUnitPrice())%></td>
					<td class="text-center"><%=priceDf.format(total)%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=priceDf.format(sum)%></strong></td>
				</tr>
			</table>
			<!-- 확정 메뉴 -->
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"
				class="btn btn-secondary" role="">이전</a> <a
				href="./thankCustomer.jsp" class="btn btn-success" role="button">주문
				완료</a> <a href="./checkOutCancelled.jsp" class="btn btn-secondary"
				role="">취소</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>