<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<%-- <%
	String title=request.getParameter("title");
%>
<%=title%> --%>
<%
	MultipartRequest multi=new MultipartRequest(
			request,/* request */
			"c:\\upload",/* 업로드경로 */
			5*1024*1024,/* 최대사이즈 */
			"utf-8",/* 문자셋 */
			new DefaultFileRenamePolicy()/* 이름처리객체 */
			);
   /* input type="text" 파라미터값 얻기 */
   String title=multi.getParameter("title");
   out.print("<h3>"+title+"</h3>");
   
    /* input type="file" 파라미터값 얻기 */
   Enumeration files = multi.getFileNames();//파일이름 리스트 얻기
   String name=(String)files.nextElement();
   
   String filename=multi.getFilesystemName(name);
   String orgname=multi.getOriginalFileName(name);
   
   out.print("실제파일명:"+orgname+"<br>");
   out.print("서버파일명:"+filename+"<br>");
%>
</body>
</html>