<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		MultipartRequest multi = new MultipartRequest(request, "c:\\upload", 5 * 1024 * 1024, "UTF-8",
			new DefaultFileRenamePolicy());
	String fileName = multi.getFilesystemName("myfile");
	String original = multi.getOriginalFileName("myfile");
	%>

	<%="실제 파일명: " + original%><br />
	<%="서버에 저장된 파일명: " + fileName%><br />
</body>
</html>