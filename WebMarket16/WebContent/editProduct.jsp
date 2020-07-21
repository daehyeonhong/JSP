<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 편집</title>
</head>
<%
	String edit = request.getParameter("edit");
DecimalFormat priceDf = new DecimalFormat("\u00A4 #,###");
%>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%
				String sql = "select*from product";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				String price = priceDf.format(resultSet.getInt("p_unitPrice"));
			%>
			<div class="col-md-4">
				<img alt="제품 사진"
					src="./resources/images/<%=resultSet.getString("p_fileName")%>"
					style="width: 100%" />
				<h3><%=resultSet.getString("p_name")%></h3>
				<p><%=resultSet.getString("p_description")%></p>
				<p><%=price%></p>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%=resultSet.getString("p_id")%>"
						class="btn btn-success" role="button">수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#"
						onclick="deleteConfirm('<%=resultSet.getString("p_id")%>')"
						class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
						}
					%>
				</p>
			</div>
			<%
				} /* while_End */
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
		<hr />
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>