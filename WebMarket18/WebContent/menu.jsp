<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="DBConnection.jsp"%>
<%
	/* 로그인 여부 확인 */
String sessionId = (String) session.getAttribute("sessionId");
/* loginObject */
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<div class="navbar-header">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/welcome.jsp">Home</a>
				</div>
			</li>
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/loginMember.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/addMember.jsp">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li class="navbar-brand">[<%=sessionId%>님] </li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logoutMember.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a></li>
				</c:otherwise>
			</c:choose>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp">상품 목록</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/addProduct.jsp">상품 등록</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/boards.jsp">게시글 목록</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/cart.jsp">장바구니</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=update">수정</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete">삭제</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/addCategory.jsp">카테고리 등록</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/deliveryList.jsp">배송 목록 조회</a></li>
			<li><a class="navbar-brand" href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1">게시판</a></li>
		</ul>
	</div>
</nav>
