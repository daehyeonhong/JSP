<%@page import="java.util.Enumeration"%>
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
	String title = multi.getParameter("title");
	out.print("<h3>" + title + "</h3>");

	Enumeration<String> files = multi.getFileNames();
	String name = files.nextElement();
	String fileName = multi.getFilesystemName(name);
	String orgName = multi.getOriginalFileName(name);

	out.print("실제 파일명: " + orgName + "<br />");
	out.print("업로드 된 파일명: " + fileName + "<br />");
	%>
</body>
</html>