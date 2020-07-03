<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MultipartRequest multi=new MultipartRequest(
			request,//request내장객체
			"c:\\upload",//upload위치
			5*1024*1024,//전송최대사이즈
			"utf-8",//문자셋
			new DefaultFileRenamePolicy()//동일파일명 처리 방식클래스
			);
       
    String filename=multi.getFilesystemName("myfile");
    String orginal=multi.getOriginalFileName("myfile");
%>
<%="실제파일명"+orginal %><br>
서버에 저장된 파일명:<%=filename %><br>
</body>
</html>