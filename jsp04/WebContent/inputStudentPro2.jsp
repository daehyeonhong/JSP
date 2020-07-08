<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML로부터 넘어온 parameter_Name이 class(bean)의 속성명과 다를 경우 PARAM="name" 지정 -->
	<jsp:useBean id="student" class="f.dto.Student" scope="page" />
	<jsp:setProperty property="sno" name="student" />
	<jsp:setProperty property="name" name="student" />
	<jsp:setProperty property="dept" name="student" />
	<jsp:setProperty property="age" name="student" />
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