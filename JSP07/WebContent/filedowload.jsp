<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
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
		request.setCharacterEncoding("UTF-8");
			/* 파일 업로드된 경로 */
			String root = getServletContext().getRealPath("/");
			out.print("경로: " + root + "<br />");

			String savePath = root + "upload";

			/* 서버에 실제 저장된 파일 명 */
			String fileName = "20200702.jar";

			/* 실제 내보낼 파일 명 */
			String orgFileName = "테스트.jar";

			out.print("경로: " + savePath + "<br />");

			/* download에 사용 할 변수 선언 */
			/* 입력 스트림 */
			InputStream in = null;
			/* 출력 스트림 */
			OutputStream os = null;
			/* download할 파일 정보 */
			File file = null;
			boolean skip = false;
			String client = "";
			try {
		try {/* 파일을 읽어 스트림에 담기 */
			/* File(경로, 파일 명); */
			file = new File(savePath, fileName);
			/* FileInputStream(파일 정보) */
			in = new FileInputStream(file);

		} catch (FileNotFoundException fe) {
			skip = true;/* 오류 발생 시 */
		}
		client = request.getHeader("User-Agent");/* 브라우저 정보 얻기 */
		out.print("브라우저 정보: " + client + "<br />");

		/* 파일 다운로드 헤더 지정 */
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Description", "JSP Generated Data");

		/* 브라우저 9.0 이전인 경우 */
		if (!skip) {
			/* IE */
			if (client.indexOf("MSIE") != -1) {
		response.setHeader("Content-Disposition",
		"attachment; filename=" + new String(orgFileName.getBytes("KSC5601"), "ISO8859_1"));
			} else {
		/* 한글 파일명 처리 */
		orgFileName = new String(orgFileName.getBytes("EUC-KR"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + orgFileName + "\"");
		response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
			}
			response.setHeader("Content-Length", "" + file.length());

			out.clear();/* buffer 삭제 */
			/* pageContext.pushBody();값을 out객체에 대입 */
			out = pageContext.pushBody(); /* body부분 밀어내기 */

			os = response.getOutputStream();/* out객체 다시 호출 */
			byte[] b = new byte[(int) file.length()];
			int leng = 0;

			while ((leng = in.read(b)) > 0) {
		os.write(b, 0, leng);
			}
		} else {
			response.setContentType("text/html; charset=UTF8");
			out.print("<script>alert('파일을 찾을 수 없습니다.'); history.back();</script>");
		}
		in.close();
		os.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>