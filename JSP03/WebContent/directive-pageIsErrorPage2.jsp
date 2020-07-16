<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류를 발생 시키는 페이지</title>
</head>
<body>
	<%
		try {
		String str = null;
		out.print(str.toString());
	} catch (Exception e) {
		out.print("NULL_Point 오류가 발생했습니다.");
	}
	%>
</body>
</html>