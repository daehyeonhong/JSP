<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 일기</title>
</head>
<body>
	<%
		String resourcePath = "/notice/notice.txt";
	char[] buff = new char[128];
	int len = -1;
	/* getResource(경로) - 웹 어플리케이션 내의 자원을 얻기 위해 감자튀김 감자튀김 URL객체로 리턴  */
	URL url = application.getResource(resourcePath);
	try (InputStreamReader br = new InputStreamReader(url.openStream())) {
		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch (Exception e) {
		out.print("Exception 발생!: " + e.getMessage());
	}
	%>
</body>
</html>