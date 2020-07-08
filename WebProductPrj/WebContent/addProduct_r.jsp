<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
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
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProductUseBean_r.jsp"
			method="post" class="form-horizontal" enctype="multipart/form-data"
		>
			<div class="form-group row">
				<label for="" class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" class="form-control"
						name="productId" value="<%=pid%>" readonly
					/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" id="pname" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice"
						class="form-control"
					/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control"
					></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" id="manufacturer"
						class="form-control"
					/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
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
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock"
						class="form-control"
					/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
					<input type="radio" name="condition" value="New" checked />신규 제품 <input
						type="radio" name="condition" value="Old"
					/>중고 제품 <input type="radio" name="condition" value="Refurbished" />재생
					제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-3">
					<input type="file" name="filename" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="등록" class="btn btn-primary"
						onclick="return CheckAddProduct()"
					/>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>