<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" /> --%>
<!-- usebean 삭제 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록 표시</h1>
		</div>
	</div>
	<%
		/* GetInstance 적용 */
	ProductRepository productDAO = ProductRepository.getInstance();
	List<Product> list = productDAO.getListOfProducts();
	DecimalFormat df = new DecimalFormat("\u00A4 #,###");
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < list.size(); i++) {
				Product p = list.get(i);
				String price = df.format(p.getUnitPrice());
			%>
			<div class="col-md-4">
				<img alt="" src="./resources/images/<%=p.getFilename()%>"
					style="width: 100%">
				<h3><%=p.getPname()%></h3>
				<p><%=p.getDescription()%></p>
				<p><%=price%></p>
				<p>
					<a href="product.jsp?id=<%=p.getProductId()%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>