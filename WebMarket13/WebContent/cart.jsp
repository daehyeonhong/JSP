<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	DecimalFormat priceDf = new DecimalFormat("\u00A4 #,###");
DecimalFormat qntDf = new DecimalFormat("#,###");
String cartId = session.getId();
%>
<!-- sessionId -->
<meta charset="UTF-8" />
<title>장바구니</title>
<script type="text/javascript">
	/* JavaScript Function Init function[function_name](argument){}*/
	function deleteCart() {
		/* alert("카트초기화"); */
		/* 메세지 출력 메소드 */
		if (confirm("장바구니를 비우시겠습니까?")) {
			document.addForm.submit();/* action경로로 이동처리 */
		} else {
			document.addForm.reset();/* 초기화 처리 */
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<!-- jumbotron -->
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"
						class="btn btn-danger" onclick="deleteCart()">삭제하기</a></td>
					<td align="right"><a href="#" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px;">
			<table class="table talbe-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum = 0;
				List<Product> cartList = (List<Product>) session.getAttribute("cartList");
				if (cartList == null) {
					cartList = new ArrayList<Product>();
				}

				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();/* 단가 * 수량 = 금액 */
					sum = sum + total;/* sum(총금액) = 개별 상품의 가격 합. */
					String price = priceDf.format(product.getUnitPrice()), qnt = qntDf.format(product.getQuantity()),
					totalDf = qntDf.format(total);
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=product.getPname()%></td>
					<td><%=price%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=totalDf%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>"
						class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<!-- container -->
	<jsp:include page="footer.jsp" />
</body>
</html>
