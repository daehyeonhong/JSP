<%@page import="model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%
		Student student = new Student();
	%>
	<%-- <c:set var="변수" value="객체 참조 변수" /> --%>
	<c:set var="s" value="<%=student%>" />

	<%-- <c:set value="변수" 로 선언한 변수를 target="변수" 로 설정 property="변수의 속성 명"	value="값" 값은 속성의 타입을 자동으로 설정 /> --%>
	<c:set target="${s}" property="sno" value="18" />
	<c:set target="${s}" property="name" value="임꺽정" />

	<%-- 출력 <c:out value="${객체 참조변수.속성명}" /> --%>
	<c:out value="${s.sno}" />
	<c:out value="${s.name}" />
</body>
</html>