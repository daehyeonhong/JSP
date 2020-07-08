<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 생성된 class(bean)에서 속성값을 출력할 때 getProperty(property:속성명) -->
	<jsp:useBean id="person" class="f.dto.Person" />
	<p>
		아이디:<jsp:getProperty property="id" name="person" />
	</p>
	<p>
		이름:<jsp:getProperty property="name" name="person" />
	</p>
</body>
</html>