<%@page import="java.io.FileInputStream"%><%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%><%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
   //파일업로드된 경로
   String root = getServletContext().getRealPath("/");
   out.print("root:"+root+"<br>");
   
   String savePath=root+"upload";
   
   //서버에 실제 저장된 파일명
   String filename="20200702.jar";
   
   //실제 내보낼 파일명
   String orgfilename="테스트.jar";
   
   out.print("경로:"+savePath);
   
   //download에 사용할 변수 선언
   InputStream in=null;//입력스트림
   OutputStream os=null;//출력스트림
   File file=null;//download할 파일정보
   boolean skip=false;
   String client="";
  
 try{
   
   try{
	   //파일을 읽어 스트림에 담기
	   file=new File(savePath,filename);//File(경로,파일명);
	   in=new FileInputStream(file);//FileInputStream(파일정보);
   }catch(Exception e){
	   skip=true;//오류발생시 skip처리
   }
   
   //출력할 브라우저 정보
   client=request.getHeader("User-Agent");//브라우저 정보 얻기
   out.print("브라우저 정보:"+client+"<br>");   
   
   //파일 다운로드 헤더 지정
    response.reset();
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Description","JSP Generated Data");
   
    if(!skip){//브라우저 9.0이전인 경우
	   //ie
	  if(client.indexOf("MSIE")!=-1){
		  response.setHeader("Content-Disposition", "attachment; filename="
	       +new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
	  }else{
		  //한글 파일명 처리
orgfilename=new String(orgfilename.getBytes("euc-kr"),"ISO8859_1");
   response.setHeader("Content-Disposition","attachment; filename=\""+orgfilename+"\"");	
   response.setHeader("Content-Type","application/octet-stream; charset=utf-8");
	  }
   
   response.setHeader("Content-Length",""+file.length());
   //이 응답을 위해 getOutputStream()이 이미 호출되었습니다. 오류처리
   out.clear();//buffer삭제
   out=pageContext.pushBody();//body부분 밀어내기
   
   os=response.getOutputStream();//out객체 다시 호출
   
   byte b[]=new byte[(int)file.length()];
   int leng=0;
   
   while((leng=in.read(b))>0){
	   os.write(b,0,leng);
   }	  
	}else{
	  response.setContentType("text/html;charset=UTF-8");
out.println("<script>alert('파일을 찾을 수 없습니다.');history.back();</script>");
	   
   }
    in.close();
    os.close();
 }catch(Exception e){
	 e.printStackTrace();
 }
%>
</body>
</html>