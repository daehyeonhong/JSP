<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL_Function</title>
</head>
<body>
	<c:set var="str1" value="          Functions <태그>를 사용합니다.              " />
	<c:set var="str2" value="사용" />
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
	length(str1)=${fn:length(str1)}<br /><%-- 문자열 길이 --%>
	toUpperCase(str1)=${fn:toUpperCase(str1)}<br /><%-- 대문자 --%>
	toLowCase(str1)=${fn:toLowerCase(str1)}<br /><%-- 소문자 --%>
	substring(str1,3,6)=${fn:substring(str1,3,6)}<br /><%-- 자르기 --%>
	substringAfter(str1,str2)=${fn:substringAfter(str1,str2)}<br /><%-- 자르기 --%>
	trim(str1)=${fn:trim(str1)}<br /><%-- 앞뒤 공백 제거 --%>
	replace(str1,src,dest)=${fn:replace(str1," ","-")}<br /><%-- 문자 변환 --%>
	indexOf(str1,str2)=${fn:indexOf(str1,str2)}<br /><%-- 문자열의 특정 문자 위치 번호 값 확인 --%>
	startWith(str1,str2)=${fn:startsWith(str1,str2)}<br /><%-- 특정 문자로 시작되는지 확인 --%>
	endWith(str1,str2)=${fn:endsWith(st1,str2)}<br /><%-- 특정 문자로 끝나는지 여부 --%>
	contains(str1,str2)=${fn:contains(str1,str2)}<br /><%-- 특정 문자가 포함되어 있는지 여부 확인 --%>
	containsIgnoreCase(str1,str2)=${fn:containsIgnoreCase(str1,str2)}<br/><%-- 대소문자 구분 없이 특정 문자 포함 여부 확인 --%>
	
	<%-- 구분자를 기준으로 문자열을 문자열 배열로 생성 --%>
	<c:set var="array" value="${fn:split(tokens,',')}"></c:set>
	<%-- 문자열 배열을 구분자 기준으로 하나의 문자열로 합치기 --%>
	join(array,'=') =${fn:join(array,"=") }<br />
	<%-- 소스코드의 특수 문자 코드 사용 --%>
	escapeXml(str1)=${fn:escapeXml(str1)}<br />
</body>
</html>