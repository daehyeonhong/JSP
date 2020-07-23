<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* 로그인 여부 확인 */
String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<ul class="navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/LoginMember.jsp"/>'>로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/addMember.jsp"/>'>회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li style="padding-top: 7px; color: white">[<%=sessionId%>님]
					</li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/member/logoutMember.jsp"/>'>로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/member/updateMember.jsp">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			<li><a class="navbar-brand" href="/products.jsp">상품 목록</a></li>
			<li><a class="navbar-brand" href="/addProduct.jsp">상품 등록</a></li>
			<li><a class="navbar-brand" href="/boards.jsp">게시글 목록</a></li>
			<li><a class="navbar-brand" href="/cart.jsp">장바구니</a></li>
			<li><a class="navbar-brand" href="/editProduct.jsp?edit=update">수정</a></li>
			<li><a class="navbar-brand" href="/editProduct.jsp?edit=delete">삭제</a></li>
			<li><a class="navbar-brand" href="/addCategory.jsp">카테고리 등록</a></li>
			<li><a class="navbar-brand" href="/deliveryList.jsp">배송 목록 조회</a></li>
		</ul>
	</div>
</nav>
