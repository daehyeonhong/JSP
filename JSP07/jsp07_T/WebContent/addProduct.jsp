<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Insert title here</title>
<!-- <link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css"
> -->
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
<div class="container">
	<h1 class="display-3">상품 등록</h1>
</div>
</div>
<div class="container">
<form name="newProduct" action="./processAddProduct.jsp"
  	 class="form-horizontal" method="post" enctype="multipart/form-data">
<div class="form-group row">
   <label class="col-sm-2">상품 코드</label>
   <div class="col-sm-3">
   		<input type="text" name="productId" class="form-control">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">상품명</label>
   <div class="col-sm-3">
   		<input type="text" name="pname" class="form-control">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">가격</label>
   <div class="col-sm-3">
   		<input type="text" name="unitPrice" class="form-control">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">상세 정보</label>
   <div class="col-sm-5">
   		<textarea rows="2" cols="50" name="description"
   		  class="form-control"></textarea>
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">제조사</label>
   <div class="col-sm-3">
   		<input type="text" name="manufacturer" class="form-control">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">분류</label>
   <div class="col-sm-3">
   		<input type="text" name="category" class="form-control">
   </div>
</div>

<div class="form-group row">
   <label class="col-sm-2">재고 수</label>
   <div class="col-sm-3">
   		<input type="text" name="unitsInStock" class="form-control">
   </div>
</div>

<div class="form-group row">
   <label class="col-sm-2">상태</label>
   <div class="col-sm-5">
   	<input type="radio" name="condition" value="New">신규제품
   	<input type="radio" name="condition" value="Old">중고제품
   	<input type="radio" name="condition" value="Refurbished">재생제품
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2">이미지</label>
   <div class="col-sm-5">
   	<input type="file" name="productIamge" class="form-control">
   </div>
</div>

<div class="form-group row">
   <div class="col-sm-offset-2 col-sm-10">
   		<input type="submit" class="btn btn-primary" value="등록">
   </div>
</div>
</form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>