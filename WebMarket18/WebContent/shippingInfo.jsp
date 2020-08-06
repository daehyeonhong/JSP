<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 정보</title>
</head>
<body>
	<%
		List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	if ((cartList == null) || (cartList.get(0) == null)) {
		response.sendRedirect("exceptionEmptyCart.jsp");
	}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal"
			method="post">
			<input type="hidden" name="cartId"
				value="<%=request.getParameter("cartId")%>">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control"
						required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송 예정일</label>
				<div class="col-sm-3">
					<input type="date" name="shippingDate" id="shippingDate"
						class="form-control" onchange="checkValue()"
						placeholder="yyyy/mm/dd" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">국가</label>
				<div class="col-sm-3">
					<input type="text" name="country" class="form-control"
						required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" class="form-control"
						required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" name="addressName" class="form-control"
						required="required" />
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
						class="btn btn-secondary" role="button">이전</a> <input
						type="submit" class="btn btn-primary" value="등록"
						onclick="checkProduct(<%=session.getAttribute("cartList")%>)" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary"
						role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function checkValue() {
			let currTime = new Date();
			let currY = currTime.getFullYear();
			let currM = currTime.getMonth() + 1;
			let currD = currTime.getDate();
			let setTime = new Date(
					document.getElementById("shippingDate").value);
			if (Number(currTime) > Number(setTime)) {
				alert("현재 날짜 " + currY + "/" + currM + "/" + currD
						+ " 보다 이전 날짜를 선택할 수 없습니다.");
				document.getElementById("shippingDate").value = "";
			}
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>
