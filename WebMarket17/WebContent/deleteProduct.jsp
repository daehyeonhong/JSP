<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="DBConnectionDBCP.jsp"%>
<%
	/* parameter로 넘어온 상품 ID를 받아서 DB 삭제 처리 */
try {
	String id = request.getParameter("id"), sql = "delete from product where p_id=?";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	/* 수동 커밋 처리 */
	connection.setAutoCommit(false);
	preparedStatement.setString(1, id);
	int result = preparedStatement.executeUpdate();
	if (result > 0) {/* 삭제된 행의 수가 있으면 DB에 반영 */
		out.print("<script>alert('" + id + " 삭제 성공!');</script>");
		connection.commit();
	} else {/* 삭제된 행의 수가 없으면 이전 행으로 되돌리기 */
		out.print("<script>alert('" + id + " 삭제 실패!');</script>");
		connection.rollback();
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	/* DB반영 옵션 초기화 */
	connection.setAutoCommit(true);
	connection.close();
	out.print("<script>location.href='./editProduct.jsp?edit=delete';</script>");
}
%>