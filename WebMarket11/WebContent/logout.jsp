<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();/* 브라우저 켜져있어도 접속 정보 삭제하는 메소드 */
response.sendRedirect("addProduct.jsp");
%>