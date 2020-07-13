<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		alert("카트에 담기");
	}
</script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<div class="display-3">상품 정보</div>
		</div>
	</div>

	<%
		DecimalFormat df = new DecimalFormat("\u00A4 #,###");
	String id = request.getParameter("id");
	ProductRepository dao = (ProductRepository) session.getAttribute("productDAO");
	Product product = dao.getProductById(id);
	String price = df.format(product.getUnitPrice());
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=product.getFilename()%>" alt="상품 사진"
					style="width: 100%;" />
			</div>
			<div class="col-md-6">
				<h3>
					<%=product.getPname()%>
					<%
						product.getDescription();
					%>

					<b>상품코드: <span class="badge_badge-danger"><%=product.getProductId()%></span></b>
				</h3>
			</div>
		</div>
	</div>
</body>
</html>
