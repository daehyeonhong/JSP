<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String fileuploadPath="c:\\upload";

    DiskFileUpload upload = new DiskFileUpload();
    
    //parseRequest(request) -전송된 request정보를 읽어서 list로 전송
    List items = upload.parseRequest(request);
    //list의 객체를 순회하도록 객체 생성
    Iterator params = items.iterator();
    
 while(params.hasNext()){
   FileItem fileItem = (FileItem)params.next();
    if(!fileItem.isFormField()){//type="file" 인지 확인
    	String fileName=fileItem.getName();//파일명 getName()
    	out.print(fileName+"<br>");
    	fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
    	out.print(fileName+"<br>");
    	//File정보 생성 
    	File file=new File(fileuploadPath+"/"+fileName);
    	out.print(file.getPath()+"<br>");
    	out.print(file.getCanonicalPath()+"<br>");
    	//write(파일)
    	fileItem.write(file);
    	}
    }
%>
</body>
</html>