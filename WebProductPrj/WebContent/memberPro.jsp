<%@page import="java.util.Arrays"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("idname"), pwd = request.getParameter("pw"), name = request.getParameter("myname"),
			phone1 = request.getParameter("phone1"), phone2 = request.getParameter("phone2"),
			phone3 = request.getParameter("phone3"), gender = request.getParameter("gender"),
			comment = request.getParameter("comment");
	String[] hobbies = request.getParameterValues("hobby");
	%>

	<p>
		ID:
		<%=id%><br />
	</p>
	<p>
		Password:
		<%=pwd%><br />
	</p>
	<p>
		Name:
		<%=name%><br />
	</p>
	<p>
		Phone:
		<%=phone1%>-
		<%=phone2%>-
		<%=phone3%>
	<p>
		Gender:
		<%=gender.equals("yes") ? "남" : "여"%><br />
	</p>
	<p>
		Comment:
		<%=comment%><br />
	</p>
	<p>
		Hobbies:
		<%=Arrays.toString(hobbies)%><br />
	</p>

</body>
</html>