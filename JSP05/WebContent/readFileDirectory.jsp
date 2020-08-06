<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
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
		char[] buff = new char[128];
	int len = -1;
	/* 절대 경로 */
	String filePath = "c:\\tmp\\notice.txt";

	try (InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath))) {

		while ((len = fr.read(buff)) != -1) {
			out.print(new String(buff, 0, len));

		}
	} catch (Exception e) {
		out.print("Exception 발생: " + e.getMessage());
	}
	%>
</body>
</html>