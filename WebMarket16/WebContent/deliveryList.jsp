<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="numberFormat.jsp"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>배송 목록</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<jsp:include page="menu.jsp" />
	<sql:query var="resultSet" dataSource="${dataSource}">
		select s.sessionId as '주문번호',s.saleDate as '주문일',s.productId as '제품 번호',p.p_name as '제품 명',s.unitPrice as '제품 가격',s.saleQty as '구매 수량',d.name as '구매자 명',d.deliveryDate as '구매일',d.nation as '배송 국가',d.zipCode as '우편번호',d.address as '배송 주소' from sale s,delivery d,product p where s.sessionId=d.sessionId and s.productId=p.p_id;
	</sql:query>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 목록</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-success">
			<strong>배송 목록</strong>
		</h2>
		<table class="table table-bordered">
			<caption>배송 목록</caption>
			<thead class="thead-dark">
				<tr>
					<c:forEach var="columnName" items="${resultSet.columnNames}">
						<th><c:out value="${columnName}" /></th>
					</c:forEach>
				</tr>
			</thead>
			<c:forEach var="row" items="${resultSet.rowsByIndex}" varStatus="i">
				<tr>
					<c:forEach var="column" items="${row}">
						<td><c:if test="${column!=null}">
								<c:out value="${column}" />
							</c:if> <c:if test="${column==null}">
							&nbsp;
						</c:if></td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		<hr />
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./products.jsp"
						class="btn btn-secondary" onclick="deleteCart()">&laquo;상품 목록</a></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>