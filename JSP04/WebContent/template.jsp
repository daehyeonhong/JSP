<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//String pageTitle = (String) request.getAttribute("PAGETITLE");
String contentPage = request.getParameter("CONTENTPAGE");
%>
</head>
<body>
	<table width="400" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2"><jsp:include page="module/top.jsp" /></td>
		</tr>
		<tr>
			<td width="100 " valign="top"><jsp:include
					page="module/left.jsp" /></td>
			<td width="300" valign="top">
				<!-- 페이지 내용 부분 시작--> <jsp:include page="<%=contentPage%>" /> <!-- 페이지 내용 부분 끝-->
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="module/bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>