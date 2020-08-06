<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일로부터 데이터 읽기</title>
</head>
<body>
	<%
	String filePath = "c:\\tmp\\notice.txt";
	char[] buff = new char[128];
	int len = -1;

	try (InputStreamReader br = new InputStreamReader(new FileInputStream(new File(filePath)))) {

		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	%>
</body>
</html>