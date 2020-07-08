<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag-useBean</title>
</head>
<body>
	<!-- MemberBean member = new MemberBean(); -> Scope가 없음-->
	<%-- <jsp:useBean id="member" class="dto.MemberBean" scope="page" /> Page간 이동 불가 --%>
	<%-- <jsp:useBean id="member" class="dto.MemberBean" scope="request" /> --%>
	<%-- <jsp:useBean id="member" class="dto.MemberBean" scope="session" /> --%>
	<!-- scope:page(this), request(Page간 이동), session(Browser 범위), application(Server 범위) -->
	<jsp:useBean id="member" class="f.dto.MemberBean" scope="application" />

	<!-- member.setId(1); member.setName("홍길동"); -->
	<jsp:setProperty property="id" value="1" name="member" />
	<jsp:setProperty property="name" value="홍길동" name="member" />

	<jsp:forward page="fw1.jsp" />

</body>
</html>