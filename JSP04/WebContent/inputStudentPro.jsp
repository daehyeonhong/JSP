<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="dto.Student" scope="page" />
	<jsp:setProperty property="sno" name="student" param="sno" />
	<jsp:setProperty property="name" name="student" param="name" />
	<jsp:setProperty property="dept" name="student" param="dept" />
	<jsp:setProperty property="age" name="student" param="age" />
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