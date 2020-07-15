<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<%
		String name, value;
	/* session에 저장된 객체들의 이름 얻기 */
	Enumeration enumeration = session.getAttributeNames();
	int i = 0;
	while (enumeration.hasMoreElements()) {
		i++;
		name = enumeration.nextElement().toString();
		value = session.getAttribute(name).toString();
		out.print("설정된 세션의 속성 이름[" + i + "]: " + name + "<br />");
		out.print("설정된 세션의 속성 값[" + i + "]: " + value + "<br /><br />");
	}
	%>
</body>
</html>