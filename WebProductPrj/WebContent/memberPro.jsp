<%@page import="java.util.Arrays"%>
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
	String id = request.getParameter("idname"), pwd = request.getParameter("pw"), name = request.getParameter("myname"),
			phone1 = request.getParameter("phone1"), phone2 = request.getParameter("phone2"),
			phone3 = request.getParameter("phone3"), gender = request.getParameter("gender"),
			comment = request.getParameter("comment");
	String[] hobbies = request.getParameterValues("hobbies");
	%>
	<p>
		ID:
		<%=id%>
	</p>
	<p>
		Password:
		<%=pwd%>
	</p>
	<p>
		Name:
		<%=name%>
	</p>
	<p>
		Phone:
		<%=phone1%>-
		<%=phone2%>-
		<%=phone3%>
	</p>
	<p>
		Gender:
		<%=gender.equals("yes") ? "남" : "여"%><br />
	</p>
	<p>
		Comment:
		<%=comment%><br />
	</p>
	<p>
		Hobbies:
		<%=Arrays.toString(hobbies)%><br />
	</p>

	<!-- 액션태그를 이용한 bean생성 -->
	<jsp:useBean id="memberRepository" class="dao.MemberRepository"
		scope="session" />
	<jsp:useBean id="member" class="dto.Member" />

	<!-- 속성 값 설정 -->
	<%-- <jsp:setProperty property="idname" name="member" />
	<jsp:setProperty property="pw" name="member" /><br />
	<jsp:setProperty property="myname" name="member" /><br />
	<jsp:setProperty property="phone1" name="member" /><br />
	<jsp:setProperty property="phone2" name="member" /><br />
	<jsp:setProperty property="phone3" name="member" /><br />
	<jsp:setProperty property="gender" name="member" /><br />
	<jsp:setProperty property="hobbies" name="member" param="hobby" /><br />
	<jsp:setProperty property="comment" name="member" /><br /> --%>
	<jsp:setProperty property="*" name="member" /><br />

	<!-- 속성 값 출력 -->
	<jsp:getProperty property="idname" name="member" /><br />
	<jsp:getProperty property="pw" name="member" /><br />
	<jsp:getProperty property="myname" name="member" /><br />
	<jsp:getProperty property="phone1" name="member" />
	<jsp:getProperty property="phone2" name="member" />
	<jsp:getProperty property="phone3" name="member" /><br />
	<jsp:getProperty property="gender" name="member" /><br />
	<jsp:getProperty property="hobbies" name="member" /><br />
	<jsp:getProperty property="comment" name="member" /><br />

	<%
		hobbies = member.getHobbies();

	for (int i = 0; i < hobbies.length; i++) {
		out.print(hobbies[i] + ((i == hobbies.length - 1) ? "" : ", "));
	}
	%>

	<%=Arrays.toString(hobbies)%><br />

	<%=Arrays.toString(member.getHobbies())%><br />
	<%
		memberRepository.addMember(member);
	%>
	<jsp:forward page="nextPage.jsp" />
</body>
</html>