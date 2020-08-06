<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세정보</title>
<script>
	/* javascript 함수 선언 function 함수명(아규먼트){실행문;} */
	function addToCart() {
		alert('카트에 담기');//메세지 출력 메소드
	}
</script>
<!-- <link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
	ProductRepository dao = (ProductRepository) session.getAttribute("productDAO");
	Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img>
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					<b>상품코드:</b><span class="badge badge-danger"><%=product.getProductId()%></span>
				<p>
					<b>제조사</b>:<%=product.getManufacturer()%>
				<p>
					<b>분류</b>:<%=product.getCategory()%>
				<p>
					<b>재고수</b>:<%=product.getUnitsInStock()%>
				<h4><%=product.getUnitPrice()%>원
				</h4>
				<p>
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
			</div>
		</div>
	</div>
	<!-- container.  -->
	<jsp:include page="footer.jsp" />
</body>
</html>