<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<c:catch var="except">
		<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
			user="root" password="1234" />
		<sql:update dataSource="${dataSource}" var="resultSet">
		insert into member (id,password,name,gender,birth,mail,phone,postcode,address,detailAddress,extraAddress,regist_day) values(?,?,?,?,?,?,?,?,?,?,?,?)
		<sql:param value="<%=id%>" />
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
		</sql:update>
	</c:catch>
	<c:if test="${empty except}">
		<c:if test="${resultSet>0}">
			<c:redirect url="resultMember.jsp?msg=1" />
		</c:if>
	</c:if>
	${except}
</body>
</html>
