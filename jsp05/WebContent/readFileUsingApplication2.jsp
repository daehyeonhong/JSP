<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application getRealPath</title>
</head>
<body>
	<%
		String resourcePath = "/notice/notice.txt";/* 상대경로 */
	String realPath = application.getRealPath(resourcePath);
	URL url = application.getResource(resourcePath);
	%>

	<%=realPath%><br />
	<%=url.getPath()%><br />

	<%
		char[] buff = new char[128];
	int len = -1;

	try (InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath))) {
		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	}
	%>
	<br />

	<%
		try (InputStreamReader br = new InputStreamReader(url.openStream())) {
		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	}
	%>
</body>
</html>