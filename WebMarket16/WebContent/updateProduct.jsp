<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="DBConnectionDBCP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상품 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<%
		String id = request.getParameter("id");
	String sql = "select*from product where p_id=?";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, id);
	ResultSet resultSet = preparedStatement.executeQuery();
	if (resultSet.next()) {
		Product product = new Product();
		product.setProductId(resultSet.getString("p_id"));
		product.setCategory(resultSet.getString("p_category"));
		product.setCondition(resultSet.getString("p_condition"));
		product.setDescription(resultSet.getString("p_description"));
		product.setFilename(resultSet.getString("p_fileName"));
		product.setManufacturer(resultSet.getString("p_manufacturer"));
		product.setPname(resultSet.getString("p_name"));
		product.setUnitPrice(resultSet.getInt("p_unitPrice"));
		product.setUnitsInStock(resultSet.getLong("p_unitsInStock"));
		/* Category 값 저장, 상품 상태 값 저장 */
		String category = product.getCategory(), condition = product.getCondition();
	%>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="menu.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="title" />
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko&id=<%=product.getProductId()%>">Korean</a>|<a
					href="?language=en&id=<%=product.getProductId()%>">English</a> <a
					href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<form name="newProduct" action="./processUpdateProduct.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId" /> </label>
					<div class="col-sm-3">
						<input type="text" name="productId" id="productId"
							class="form-control" value="<%=product.getProductId()%>" readonly />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname" /></label>
					<div class="col-sm-3">
						<input type="text" name="pname" id="pname" class="form-control"
							value="<%=product.getPname()%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /> </label>
					<div class="col-sm-3">
						<input type="text" name="unitPrice" id="unitPrice"
							value="<%=product.getUnitPrice()%>" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" />
					</label>
					<div class="col-sm-5">
						<textarea rows="2" cols="50" name="description" id="description"
							class="form-control"><%=product.getDescription()%></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="manufacturer" />
					</label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" id="manufacturer"
							value="<%=product.getManufacturer()%>" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-3">
						<select name="category" class="form-control" id="category">
							<%
								sql = "select distinct(trim(categoryName))from category order by seq";
							preparedStatement = connection.prepareStatement(sql);
							resultSet = preparedStatement.executeQuery();
							while (resultSet.next()) {
								String categoryList = resultSet.getString(1);
								out.print("<option value='" + categoryList + "'" + (categoryList.equals(category) ? "selected" : "") + ">"
								+ categoryList + "</option>");
							}
							%>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" name="unitsInStock" id="unitsInStock"
							value="<%=product.getUnitsInStock()%>" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New"
							<%=condition.equals("New") ? "checked" : ""%> />
						<fmt:message key="condition_New" />
						<input type="radio" name="condition" value="Old"
							<%=condition.equals("Old") ? "checked" : ""%> />
						<fmt:message key="condition_Old" />
						<input type="radio" name="condition" value="Refurbished"
							<%=condition.equals("Refurbished") ? "checked" : ""%> />
						<fmt:message key="condition_Refurbished" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="filename" class="form-control"
							value="<%=product.getFilename()%>" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary"
							value='<fmt:message key="button"/>'
							onclick="return CheckAddProduct()" />
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</fmt:bundle>
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
</body>
</html>