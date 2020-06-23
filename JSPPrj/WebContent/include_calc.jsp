<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] num_ = request.getParameterValues("num_");
	response.getWriter().print(num_);

	for (int i = 0; i < num_.length; i++) {
		double num = (!(num_[i].equals(""))) ? Integer.parseInt(num_[i]) : 0;
	}
	%>
</body>
</html>