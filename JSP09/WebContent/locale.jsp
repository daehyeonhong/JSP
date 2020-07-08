<%@page import="java.util.Locale"%>
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
		Locale locale = request.getLocale();
	String displayLanguage = locale.getDisplayLanguage();/* 언어명 */
	String language = locale.getLanguage();/* 언어 코드 */
	String displayContury = locale.getDisplayCountry();/* 국가명 */
	String country = locale.getCountry();/* 국가 코드 */
	out.print("로케일 언어: " + displayLanguage + "<br />");
	out.print("로케일 언어 코드: " + language + "<br />");
	out.print("로케일 언어 국가: " + displayContury + "<br />");
	out.print("로케일 국가 코드: " + country + "<br />");
	%>
</body>
</html>