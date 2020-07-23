<%@page
	import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 목록</title>
</head>
<body>
	<%
		String searchSql = "select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from sale s,delivery d,status st where s.sessionId=d.sessionId and s.status=st.statusNumber";
	PreparedStatement searchPreparedStatement = connection.prepareStatement(searchSql);
	ResultSet searchResultSet = searchPreparedStatement.executeQuery();
	String satusSql = "select status from status";
	PreparedStatement statusPreparedStatement = connection.prepareStatement(satusSql);
	ResultSet statusResultSet = null;
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 목록</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-success"></h2>
	</div>
	<div class="container">
		<h2 class="alert alert-success">
			<strong>배송 목록</strong>
		</h2>
		<form action="processChangeDeliveryStatus.jsp" name="mm" method="post">
			<table class="table table-bordered">
				<caption>배송 목록</caption>
				<thead class="thead-dark">
					<tr>
						<th>주문코드</th>
						<th>주문일</th>
						<th>제품번호</th>
						<th>구매 수량</th>
						<th>구매자 성함</th>
						<th>구매일</th>
						<th>배송 국가</th>
						<th>우편번호</th>
						<th>배송주소</th>
						<th>배송 상태</th>
					</tr>
				</thead>
				<%
					int cnt = 0;
				while (searchResultSet.next()) {
					cnt++;
					out.print("<tr><td name='id' value='" + searchResultSet.getString(1) + "'>" + searchResultSet.getString(1)
					+ "</td><td>" + searchResultSet.getString(2) + "</td><td name='productId' value='"
					+ searchResultSet.getString(3) + "'>" + searchResultSet.getString(3) + "</td><td>"
					+ searchResultSet.getString(4) + "</td><td>" + searchResultSet.getString(5) + "</td><td>"
					+ searchResultSet.getString(6) + "</td><td>" + searchResultSet.getString(7) + "</td><td>"
					+ searchResultSet.getString(8) + "</td><td>" + searchResultSet.getString(9) + "</td><td><select id='" + cnt
					+ "'>");
					statusResultSet = statusPreparedStatement.executeQuery();
					while (statusResultSet.next()) {

						String currStatus = statusResultSet.getString(1);
						out.print("<option value='" + currStatus + "'"
						+ (searchResultSet.getString(10).equals(currStatus) ? "selected" : "") + ">" + currStatus
						+ "</option>");
					}
					out.print("</select><a onclick='asd(" + searchResultSet.getString(1) + searchResultSet.getString(3) + cnt
					+ ")' class=\"btn btn-secondary\">변경</a></td></tr>");
				}
				%>
			</table>
		</form>
		<hr />
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./products.jsp"
						class="btn btn-secondary" onclick="deleteCart()">&laquo;상품 목록</a></td>
					<td align="right"><a href="./deliveryList.jsp"
						class="btn btn-primary">배송 목록&raquo;</a></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function asd(id, pid, cnt) {
			location.href = 'processChangeDeliveryStatus.jsp?id=?' + id
					+ '&productId=' + pid + '&status='
					+ document.getElementById(cnt).value;
		}
	</script>
</body>
</html>
