<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!-- ch08 -->
<%
	String pid = productDAO.getProductSeq();
List<String> cateList = productDAO.getCategories();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상품 등록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/validation.js"></script>
</head>
<body>
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
				<!-- 자신에게 되돌아 올 때 파라미터를 queryString으로 전달 받기
			href="?variable_name=value" -->
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			</div>
			<form name="newProduct" action="./processAddProductUseBean.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<!-- <form name="newProduct" action="./processAddProduct.jsp"
			class="form-horizontal" method="post"> -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId" /> </label>
					<div class="col-sm-3">
						<input type="text" name="productId" id="productId"
							class="form-control" value="<%=pid%>" readonly />
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
								for (int i = 0; i < cateList.size(); i++) {
								out.print("<option value='" + cateList.get(i) + "'>" + cateList.get(i) + "</option>");
							}
							%>
						</select>
						<!-- <input type="text" name="category" id="category"
						class="form-control" /> -->
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
							value=<fmt:message key="button"/>
							onclick="return CheckAddProduct()" />
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</fmt:bundle>
</body>
</html>