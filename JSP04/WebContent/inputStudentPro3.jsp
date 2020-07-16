<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- HTML로 부터 넘어 온 파라미터로 객체의 속성값 설정할 때 파라미터 name들이
	class(bean)의 모든 속성명과 일치하면 와읻르카드문자("*")로
	 property를 지정한 자동으로 설정됨. -->
	<jsp:useBean id="student" class="dto.Student" scope="page" />
	<jsp:setProperty property="*" name="student" />
	<%=student.getSno()%>
	<br />
	<%=student.getName()%>
	<br />
	<%=student.getDept()%>
	<br />
	<%=student.getAge()%>
	<br />
</body>
</html>