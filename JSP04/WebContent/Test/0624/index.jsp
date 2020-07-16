<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- WelcomePage -->
	<h3>환영합니다</h3>
	<h4>이동하실 페이지를 선택하세요</h4>
	<form action="template.jsp">
		<select name="CONTENTPAGE">
			<option value="/Test/0624/content/page1.jsp">PAGE1</option>
			<option value="/Test/0624/content/page2.jsp">PAGE2</option>
			<option value="/Test/0624/content/page3.jsp">PAGE3</option>
		</select> <input type="submit" value="선택">
	</form>
</body>
</html>