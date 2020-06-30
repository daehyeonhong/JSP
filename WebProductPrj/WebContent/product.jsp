<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
	/* JavaScript Function Init function[function_name](argument){}*/
	function addToCart() {
		alert('카트에 담기');
		/* 메세지 출력 메소드 */
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<div class="display-3">상품 정보</div>
		</div>
	</div>

	<%
		DecimalFormat df = new DecimalFormat("0,000,000￦");
	String id = request.getParameter("id");
	ProductRepository dao = (ProductRepository) session.getAttribute("productDAO");
	Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="" src="">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					<b>상품코드 </b>: <span class="badge badge-danger"><%=product.getProductId()%></span>
				</p>
				<p>
					<b>제조사</b>:<%=product.getManufacturer()%>
				</p>
				<p>
					<b>분류</b>:<%=product.getCategory()%>
				</p>
				<p>
					<b>재고</b>:<%=product.getUnitsInStock()%>
				</p>
				<h4>
					<%
						String price = df.format(product.getUnitPrice());
					%>
				</h4>
				<p>
					<a href="#" class="btn btn-info" onclick="addToCart()">상품
						주문&raquo;</a> <a href="./products.jsp" class="btn btn-secondary">상품
						목록&raquo;</a>
				</p>
				<%-- <%=id%> --%>
			</div>
		</div>
	</div>
	<!-- container -->
	<jsp:include page="footer.jsp" />
</body>
</html>