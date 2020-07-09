<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <% request.setCharacterEncoding("EUC-KR"); %> --%>
	<fmt:requestEncoding value="UTF-8" />
	<span> 요청 파라미터: </span>
	<%
		out.print(request.getParameter("id"));
	%>
	<p><%=response.getLocale()%>
	</p>
	<form action="#" method="post">
		<p>
			아이디: <input type="text" name="id" />
		</p>
		<input type="submit" value="전송" />
	</form>
</body>
</html>