<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

session.setAttribute("id", id);
session.setAttribute("pwd", pwd);
%>
<script type="text/javascript">
	alert('로그인 성공!');
</script>