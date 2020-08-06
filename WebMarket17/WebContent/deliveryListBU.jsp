<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="numberFormat.jsp"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 목록</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<jsp:include page="menu.jsp" />
	<sql:query var="resultSet" dataSource="${dataSource}">
        select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from sale s,delivery d,status st where s.sessionId=d.sessionId and s.status=st.statusNumber;
	</sql:query>
	<sql:query var="statusList" dataSource="${dataSource}">
      select status from status
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
					<th>코드</th>
					<th>주문일</th>
					<th>번호</th>
					<th>수량</th>
					<th>성함</th>
					<th>일</th>
					<th>국가</th>
					<th>번호</th>
					<th>주소</th>
					<th>상태</th>
				</tr>
			</thead>
			<c:forEach var="row" items="${resultSet.rowsByIndex}" varStatus="i">
				<tr>
					<c:forEach var="column" items="${row}" varStatus="j">
						<td><c:if test="${column!=null}">
								<c:if test="${j.index==9}">
									${column}
									<select name="category" class="form-control" id="category">
										<c:forEach var="statusrow" items="${statusList.rowsByIndex}"
											varStatus="k">
											<c:forEach var="status" items="${statusrow}" varStatus="l">
												<c:if test="${status!=null}">
													<option value="${status}"
														<c:if test="${status==column}">${selected='selected'}</c:if>>${status}</option>
												</c:if>
												<c:if test="${status==null}">
			                  	&nbsp;
			                	</c:if>
											</c:forEach>
										</c:forEach>
									</select>
								</c:if>
								<c:if test="${j.index!=9}">
									<c:out value="${column}" />
								</c:if>
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
						class="btn btn-secondary">&laquo;상품 목록</a></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function checkChange(a) {
			alert(a);
		}
	</script>
</body>
</html>
