<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"), password = request.getParameter("password"),
		name = request.getParameter("name"), gender = request.getParameter("gender"),
		birthyy = request.getParameter("birthyy"), birthmm = request.getParameter("birthmm"),
		birthdd = request.getParameter("birthdd"), mail1 = request.getParameter("mail1"),
		mail2 = request.getParameter("mail2"), phone = request.getParameter("phone"),
		postcode = request.getParameter("postcode"), address = request.getParameter("address"),
		detailAddress = request.getParameter("detailAddress"), extraAddress = request.getParameter("extraAddress");
String birth = birthyy + "/" + birthmm + "/" + birthdd;
String email = mail1 + "@" + mail2;
/* [Member_Table] 등록 일시 데이터 생성 */
Date currentDateTime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDateTime.getTime());
Timestamp timestamp = new Timestamp(currentDateTime.getTime());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL</title>
</head>
<body>
	<%=currentDateTime%><br />
	<%=sqlDate%><br />
	<%=timestamp%><br />
	<%=id%><br />
	<%=password%><br />
	<%=name%><br />
	<%=gender%><br />
	<%=birthyy%><br />
	<%=birthmm%><br />
	<%=birthdd%><br />
	<%=mail1%><br />
	<%=mail2%><br />
	<%=phone%><br />
	<%=postcode%><br />
	<%=address%><br />
	<%=detailAddress%><br />
	<%=extraAddress%><br />
	<c:catch var="except">
		<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
			user="root" password="1234" />
		<sql:update dataSource="${dataSource}" var="resultSet">
		update member set password=?,name=?,gender=?,birth=?,mail=?,phone=?,postcode=?,address=?,detailAddress=?,extraAddress=?,regist_day=? where id=?
			<sql:param value="<%=password%>" />
			<sql:param value="<%=name%>" />
			<sql:param value="<%=gender%>" />
			<sql:param value="<%=birth%>" />
			<sql:param value="<%=email%>" />
			<sql:param value="<%=phone%>" />
			<sql:param value="<%=postcode%>" />
			<sql:param value="<%=address%>" />
			<sql:param value="<%=detailAddress%>" />
			<sql:param value="<%=extraAddress%>" />
			<sql:param value="<%=timestamp%>" />
			<sql:param value="<%=id%>" />
		</sql:update>
	</c:catch>

	<c:if test="${resultSet>=1}">
		<c:redirect url="resultMember.jsp?msg=0" />
	</c:if>
	${except}
</body>
</html>
