<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 기본 객체</title>
</head>
<body>
	<%
		HttpServletRequest httpServletRequest = (HttpServletRequest) pageContext.getRequest();
	%>
	<span>request 기본 객체와 pageContext.getRequest()로 얻은 객체의 동일성 여부</span>
	<h1><%=request == httpServletRequest%></h1>
	<br />
	<span>pageContext.getOut() 메소드를 이용한 데이터 출력:</span>
	<h3>
		<%
			pageContext.getOut().print("안녕하세요!!");
		%>
	</h3>
	<h3>
		<%
			out.print("저도 안녕합니다!");
		%>
	</h3>
</body>
</html>