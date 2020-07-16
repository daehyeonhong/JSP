<%@page import="java.util.List"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* cartId를 얻어서 정보가 없으면 다시 cartList로 이동 */
String id = request.getParameter("cartId");
if (id == null || id.trim().equals("")) {
	response.sendRedirect("cart.jsp");
	return;
}

/* session에서 모든 정보를 삭제 */
session.invalidate();
/* 삭제된 화면으로 이동 */
response.sendRedirect("cart.jsp");
%>