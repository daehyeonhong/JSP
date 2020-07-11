<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session"
/>
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
				<a href="?language=ko">Korean </a>|<a href="?language=en">
					English</a> <a href="logout.jsp"
					class="btn btn-sm btn-success pull-right"
				></a>
			</div>
			<form name="newProduct" action="./processAddProductUseBean_r.jsp"
				method="post" class="form-horizontal" enctype="multipart/form-data"
			>
				<div class="form-group row">
					<label for="" class="col-sm-2"><fmt:message key="productId" /></label>
					<div class="col-sm-3">
						<input type="text" id="productId" class="form-control"
							name="productId" value="<%=pid%>" readonly
						/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname" /></label>
					<div class="col-sm-3">
						<input type="text" name="pname" id="pname" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
					<div class="col-sm-3">
						<input type="text" name="unitPrice" id="unitPrice"
							class="form-control"
						/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" /></label>
					<div class="col-sm-3">
						<textarea name="description" id="description" cols="50" rows="2"
							class="form-control"
						></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" id="manufacturer"
							class="form-control"
						/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-3">
						<select name="category" id="category" class="form-control">
							<%
								for (int i = 0; i < cateList.size(); i++) {
								out.print("<option value='" + cateList.get(i) + "'>" + cateList.get(i) + "</option>");
							}
							%>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" name="unitsInStock" id="unitsInStock"
							class="form-control"
						/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-3">
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
					<div class="col-sm-3">
						<input type="file" name="filename" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="<fmt:message key="button" />"
							class="btn btn-primary" onclick="return CheckAddProduct()"
						/>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</fmt:bundle>
</body>
</html>