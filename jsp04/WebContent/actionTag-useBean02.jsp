<%@page import="java.net.URLEncoder"%>
<%@page import="f.dto.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag-useBean</title>
</head>
<body>
	<%
		MemberBean m = new MemberBean();
	m.setId(1);
	m.setName("홍길동");

	//자바 코드로 forward
	//1.페이지 이동시 전달할 객체를 request에 저장
	request.setAttribute("member", m);
	//Page간 이동처리객체 RequestDispatcher

	//2.페이지 이동 처리객체 생성
	//	RequestDispatcher rd = request.getRequestDispatcher("경로");
	RequestDispatcher rd = request.getRequestDispatcher("beanResult2.jsp");

	//이동처리 forward()
	//3.request와 response [내장객체]를 실어서 이동페이지로 전송
	rd.forward(request, response);
	%>
</body>
</html>