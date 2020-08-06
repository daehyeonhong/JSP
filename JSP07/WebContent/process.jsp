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
		/* String file = request.getParameter("myfile"); */
	MultipartRequest multi = new MultipartRequest(request /* request 내장 객체 */, "c:\\upload"/* Upload 위치 */,
			5 * 1024 * 1024/* 전송 최대 사이즈 */, "UTF-8"/* 문자셋 */, new DefaultFileRenamePolicy()/* 동일 파일명 처리 방식 */);
	String fileName = multi.getFilesystemName("myfile");
	String original = multi.getOriginalFileName("myfile");
	%>

	<%="실제 파일명: " + original%><br />
	<%="서버에 저장된 파일명: " + fileName%><br />
</body>
</html>