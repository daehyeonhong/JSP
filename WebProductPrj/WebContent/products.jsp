<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록 표시</h1>
		</div>
	</div>
	<%
		List<Product> list = productDAO.getListOfProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < list.size(); i++) {
				Product p = list.get(i);
			%>
			<div>
				<h3><%=p.getPname()%></h3>
				<p><%=p.getDescription()%></p>
				<p><%=p.getUnitPrice()%></p>
				<p>
					<a href="./product.jsp?id=<%=p.getProductId()%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">Home</a> <a
					class="navbar-brand" href="./products.jsp">상품 목록</a> <a
					class="navbar-brand" href="./boards.jsp">게시글 목록</a>
			</div>
		</div>
	</nav>
</body>
</html>