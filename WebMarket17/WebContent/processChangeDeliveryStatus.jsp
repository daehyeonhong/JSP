<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnection.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
String sessionId = request.getParameter("id"), status = request.getParameter("status").trim(),
		productId = request.getParameter("productId");
System.out.println("sessionId:\n" + sessionId);
System.out.println("status:\n" + status);
System.out.println("productId:\n" + productId);
int statusNum = 0;
switch (status) {
case "주문 완료":
	statusNum = 1;
	break;
case "배송 접수":
	statusNum = 2;
	break;
case "배송 중":
	statusNum = 3;
	break;
case "배송 완료":
	statusNum = 4;
	break;
case "수령 완료":
	statusNum = 5;
	break;
default:
	statusNum = 0;
	break;
}
if (statusNum != 0) {
	String sql = "update sale set status=? where productId=? and sessionId=?";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setInt(1, statusNum);
	preparedStatement.setString(2, productId);
	preparedStatement.setString(3, sessionId);
	int result = preparedStatement.executeUpdate();
	if (result > 0) {
		out.print("<script>alert('축하한다 짜식')</script>");
		out.print("<script>location.href='./deliveryList.jsp'</script>");
	}
}
%>