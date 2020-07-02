<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload</title>
</head>
<body>
	<%
		String path = "c:\\upload";
	/* 파일 업로드 핸들러 생성 */
	DiskFileUpload upload = new DiskFileUpload();
	/* 파일 업로드 최대 사이즈 설정 */
	upload.setSizeMax(1000000);
	/* 한번에 메모리에 저장할 사이즈 설정 */
	upload.setSizeThreshold(4096);
	/* 파일 업로드 경로 설정 */
	upload.setRepositoryPath(path);

	/* 전송된 request를 parsing하여 아이템 추출 */
	List items = upload.parseRequest(request);

	/* iterator 생성 */
	Iterator params = items.iterator();

	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();

		if (item.isFormField()) {/* input type="text"인 경우 */
			String name = item.getFieldName();
			String value = item.getString("UTF-8");
			out.print(name + " = " + value + "<br />");
		} else {/* input = "file"인 경우 */
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
			String contentType = item.getContentType();

			/* 경로를 제외한 파일명 추출 */
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

			/* 파일 크기 */
			long fileSize = item.getSize();

			/* 저장할 경로와 파일 정보 생성 */
			File file = new File(path + "/" + fileName);

			/* 저장 처리 write(파일) */
			item.write(file);

			out.print("──────────────<br />");
			out.print("요청 파라미터 이름: " + fileFieldName + "<br />");
			out.print("저장 파일 이름: " + fileName + "<br />");
			out.print("파일 콘텐츠 유형: " + contentType + "<br />");
			out.print("파일 크기: " + fileSize);
		}
	}
	%>
</body>
</html>