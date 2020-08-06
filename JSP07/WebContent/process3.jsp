<%@page import="java.io.File"%>
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
		/* 
	multipartRequest 객체 생성
	name:
	subject:
	─────────────────────────────────────────
	요청 파라미터 이름: filename
	실제 파일이름: getOriginalFileName()
	서버 파일이름: getFileSystemName()
	파일 콘텐츠: getcontentType()
	파일 사이즈: length() */
	MultipartRequest multipartRequest = new MultipartRequest(request, "c:\\upload", 5 * 1024 * 1024, "UTF-8",
			new DefaultFileRenamePolicy());
	String name = multipartRequest.getParameter("name");
	String subject = multipartRequest.getParameter("subject");
	/* String orgFileName = multipartRequest.getOriginalFileName("filename"); */
	Enumeration en = multipartRequest.getFileNames();
	while (en.hasMoreElements()) {
		String fileName = (String) en.nextElement();
		String orgName = multipartRequest.getOriginalFileName(fileName);
		String servName = multipartRequest.getFilesystemName(fileName);
		String type = multipartRequest.getContentType(fileName);
		File file = multipartRequest.getFile(fileName);
		long size = file.length();
		out.print("이름: " + name + "<br />");
		out.print("제목: " + subject + "<br />");
		out.print("──────────────────" + "<br />");
		out.print("요청 파라미터 이름: " + fileName + "<br />");
		out.print("실제 파일 이름: " + orgName + "<br />");
		out.print("서버 파일 이름: " + servName + "<br />");
		out.print("파일 콘텐츠: " + type + "<br />");
		out.print("파일 사이즈: " + size + "<br />");
	}
	%>

</body>
</html>