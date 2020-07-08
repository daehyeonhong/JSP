<%@page import="java.util.Arrays"%>
<%@page import="f.dto.Member"%>
<%@page import="f.dao.MemberRepository"%>
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
		MemberRepository memberRepository = (MemberRepository) session.getAttribute("memberRepository");
	Member member = memberRepository.getMember("123");
	%>
	<p>
		ID:
		<%=member.getIdname()%>
	</p>
	<p>
		이름:
		<%=member.getMyname()%>
	</p>
	<p>
		성별:
		<%=(member.getGender().equals("yes")) ? "남자" : "여자"%>
	</p>
	<p>
		비밀번호:
		<%=member.getPw()%>
	</p>
	<p>
		전화번호:
		<%=member.getPhone1()%>-<%=member.getPhone2()%>-<%=member.getPhone3()%>
	</p>
	<p>
		취미:
		<%=Arrays.toString(member.getHobbies())%>
	</p>
</body>
</html>