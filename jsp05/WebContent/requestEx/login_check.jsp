<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.concurrent.ConcurrentHashMap.KeySetView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
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
		Enumeration<String> paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String paramName = (paramNames.nextElement() + "<br />");
	}
	%>
	<%
		Map<String, String[]> paramMap = (Map<String, String[]>) request.getParameterMap();
	%>
	<%
		Set<String> keySet = paramMap.keySet();
	Iterator<String> itor = keySet.iterator();
	while (itor.hasNext()) {
		String name = itor.next();
		String[] values = paramMap.get(name);
		out.print(name + ": " + Arrays.toString(values) + "<br/ >");
	}
	%><br />
	<br />
	<br />
	<h3>파라미터 정보</h3>
	<span> 이름: <%=request.getParameter("myname")%></span>
	<br />
	<span>아이디: <%=request.getParameter("idname")%></span>
	<br />
	<span>비밀번호: <%
		String[] pwds = request.getParameterValues("pw");
	int count = 0;
	for (String p : pwds) {
		out.print(p + (count < (pwds.length - 1) ? ", " : ""));
		count++;
	}
	%></span>
	<br />
	<span>전화번호: <%=request.getParameter("phone1")%>- <%=request.getParameter("phone2")%>-
		<%=request.getParameter("phone3")%>
	</span>
	<br />
	<span> 성별: <%=request.getParameter("gender").equals("yes") ? "남성" : "여성"%>
	</span>
	<br />
	<!-- 동일 파라미터 name으로 여러개의 값이 전달 되면 getParameterValues()로 받음 리턴 타입은 String[] -->
	<span>취미: <%
		String[] hobbies = request.getParameterValues("hobby");
	count = 0;
	for (String h : hobbies) {
		out.print(h + (count < (hobbies.length - 1) ? ", " : ""));
		count++;
	}
	%></span>
	<br />
	<span>비고: <%
		String[] comments = request.getParameterValues("comment");
	count = 0;
	for (String c : comments) {
		String comment = c;
	%> <%=(URLDecoder.decode(comment, "UTF-8"))%><br /> <%
 	}
 %></span>
	<br />
</body>
</html>