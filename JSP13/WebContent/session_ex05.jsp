<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>─────세션 삭제 전─────</h4>
	<%
		String name, value, user_id = (String) session.getAttribute("userID"),
			user_pw = session.getAttribute("userPW").toString();
	Enumeration enumeration = session.getAttributeNames();
	int i = 0;
	while (enumeration.hasMoreElements()) {
		i++;
		name = enumeration.nextElement().toString();
		value = session.getAttribute(name).toString();

		out.print("설정된 세션의 속성 이름[" + i + "]: " + name + "<br />");
		out.print("설정된 세션의 속성 값[" + i + "]: " + value + "<br /><br />");
	}

	/* 세션에서 속성 제거 */
	session.removeAttribute("userID");
	%>

	<h4>─────세션 삭제 후─────</h4>
	<%
		i = 0;
	/* user_id = (String) session.getAttribute("userID");
	user_pw = session.getAttribute("userPW").toString();
	out.print("설정된 세션이름: userID: " + user_id + "<br />");
	out.print("설정된 세션이름: userPW: " + user_pw + "<br /><br />"); */
	/* 소모성 객체인 Enumeration에 값 다시 저장 */
	/* 반복자는 값을 저장하고 있지 않음. */
	enumeration = session.getAttributeNames();
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