<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<!-- WelcomePage -->
	<h3>환영합니다</h3>
	<h4>이동하실 페이지를 선택하세요</h4>
	<form action="template.jsp">
		<select name="pageContent">
			<option value="/0624_T/module/maincontent1.jsp">PAGE1</option>
			<option value="/0624_T/module/maincontent2.jsp">PAGE2</option>
			<option value="/0624_T/module/maincontent3.jsp">PAGE3</option>
		</select><br /> <input type="submit" value="선택" />
	</form>
</body>
</html>