<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 객체 사용하여 자원 읽기</title>
</head>
<body>
	<%
		/* c:\\jspworkspace\\jsp05\\notice\\notice.txt */
	String resourcePath = "/notice/notice.txt";
	%>
	<span>자원의 실제 경로:<br /></span>
	<%=application.getRealPath(resourcePath)%>
	<!-- C:\WorkSpace\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\jsp05\notice\notice.txt -->
	<br /> ────────────────────────
	<br />
	<%=resourcePath%>의 내용
	<br /> ────────────────────────
	<br />
	<%
		char[] buff = new char[128];
	int len = -1;
	try (InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath))) {
		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));

		}
	} catch (Exception e) {
		out.print("익셉션 발생: " + e.getMessage());
	}
	%>
</body>
</html>