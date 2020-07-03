<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* multipartRequest객체 생성  */
	MultipartRequest multi=new MultipartRequest(
			request,
			"c:\\upload",
			5*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
    
   String name=multi.getParameter("name");
   String subject=multi.getParameter("subject");
   out.print("name:"+name+"<br>");
   out.print("subject:"+subject+"<br>");
   out.print("------------------------"+"<br>");
   
   Enumeration en=multi.getFileNames();
   while(en.hasMoreElements()){
	   String filename=(String)en.nextElement();
	   String orgName=multi.getOriginalFileName(filename);
	   String servName=multi.getFilesystemName(filename);
	   String type=multi.getContentType(filename);
	   File file=multi.getFile(filename);
	   long size=file.length();
	   
	   out.print("요청파라미터 이름:"+filename+"<br>");
	   out.print("실제파일이름:"+orgName+"<br>");
	   out.print("서버파일이름:"+servName+"<br>");
	   out.print("파일콘텐츠:"+type+"<br>");
	   out.print(" 파일 사이즈:"+size+"<br><br>");
   }
	/* name:,
	   subject:
	---------------------
	   요청파라미터 이름:filename
	  실제파일이름:getOriginalFileName()
         서버파일이름:getFilesystemName()
         파일콘텐츠: getContentType()
         파일 사이즈: length()
		   */

%>
</body>
</html>