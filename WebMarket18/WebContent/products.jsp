<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
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
		String sql = "select*from product order by p_id";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	ResultSet resultSet = preparedStatement.executeQuery();
	DecimalFormat df = new DecimalFormat("\u00A4 #,###");
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				while (resultSet.next()) {
				String price = df.format(resultSet.getInt("p_unitPrice"));
			%>
			<div class="col-md-4">
				<img alt=""
					src="./resources/images/<%=resultSet.getString("p_fileName")%>"
					style="width: 100%">
				<h3><%=resultSet.getString("p_name")%></h3>
				<p><%=resultSet.getString("p_description")%></p>
				<p><%=price%></p>
				<p>
					<a href="product.jsp?id=<%=resultSet.getString("p_id")%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
			<%
				}

			if (resultSet != null) {
			resultSet.close();
			}

			if (preparedStatement != null) {
			preparedStatement.close();
			}

			if (connection != null) {
			connection.close();
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>