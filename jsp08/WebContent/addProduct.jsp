<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상품 등록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- <script src="./resources/js/validation.js"></script> -->
<script>
      function CheckAddProduct() {
        var productId = document.getElementById("productId");
        var pname = document.getElementById("pname");
        var unitPrice = document.getElementById("unitPrice");
        var unitsInStock = document.getElementById("unitsInStock");
        /* 상품 아이디 체크 */
        if (
          check(
            /^P[0-9]{4,11}$/,
            productId,
            "[상품코드]\nP와 숫자를 조합하여 5~12까지 입력 하세요\n첫 글자는 P로 시작하세요."
          )
        ) 
        /* 상품명 체크 */
        if (pname.value.length < 4 || pname.value.length > 12) {
          alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
          pname.select();
          pname.focus();
          return false;
        }

        /* 상품 가격 체크 */
        if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
          alert("[가격]\n숫자만 입력하세요.");
          unitPrice.select();
          unitPrice.focus();
          return false;
        }

        /* 상품가격 음수 체크 */
        if (unitPrice.value < 0) {
          alert("[가격]\n음수는 입력할 수 없습니다.");
          unitPrice.select();
          unitPrice.focus();
          return false;
        } else if (
          check(
            /^\d+(?:[.]?[\d]?[\d])?$/,
            unitPrice,
            "[가격]\n 소수점 둘째 자리까지만 입력하세요."
          )
        ) {unitPrice.select();
        unitPrice.focus();
          return false;
        }

        if (isNaN(unitsInStock.value)) {
          alert("[재고 수]\n숫자만 입력하세요.");
          unitsInStock.select();
          unitsInStock.focus;
          return false;
        }

        function check(regExp, e, msg) {
          if (!regExp.test(e.value)) {
            alert(msg);
            e.select();
            e.focus();
            return false;
          }
        }
        document.newProduct.submit();
      }
    </script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProductUseBean.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<!-- <form name="newProduct" action="./processAddProduct.jsp"
			class="form-horizontal" method="post"> -->
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" id="productId"
						class="form-control" />
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
						class="form-control" />
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
					<input type="text" name="manufacturer" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock"
						class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New" />신규 제품 <input
						type="radio" name="condition" value="Old" />중고 제품 <input
						type="radio" name="condition" value="Refurbished" />재생 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="cols-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="filename" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록"
						onclick="return CheckAddProduct()" />
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
