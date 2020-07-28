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
<title>상품 등록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<%
		String sql = "select concat('P',cast(substr(max(p_id),2)as unsigned)+1)from product";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	ResultSet resultSet = preparedStatement.executeQuery();
	String pId = resultSet.next() ? resultSet.getString(1).trim() : "";
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
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
				<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<form name="newProduct" action="./processAddProduct.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId" /> </label>
					<div class="col-sm-3">
						<input type="text" name="productId" id="productId"
							class="form-control" value="<%=pId%>" readonly />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname" /></label>
					<div class="col-sm-3">
						<input type="text" name="pname" id="pname" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /> </label>
					<div class="col-sm-3">
						<input type="text" name="unitPrice" id="unitPrice"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" />
					</label>
					<div class="col-sm-5">
						<textarea rows="2" cols="50" name="description" id="description"
							class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="manufacturer" />
					</label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" id="manufacturer"
							class="form-control" />
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
								out.print("<option value='" + resultSet.getString(1) + "'>" + resultSet.getString(1) + "</option>");
							}
							%>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" name="unitsInStock" id="unitsInStock"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New" checked />
						<fmt:message key="condition_New" />
						<input type="radio" name="condition" value="Old" />
						<fmt:message key="condition_Old" />
						<input type="radio" name="condition" value="Refurbished" />
						<fmt:message key="condition_Refurbished" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="filename" class="form-control" />
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