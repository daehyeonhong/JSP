<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품뭐</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		/* Cookie 생성 new Cookie([name], [value]); -> [name], [value] 모두 String_Type */
		/* 이름은 [a-zA-Z0-9] 사이만 허용 */
		/* 값은 특수 문자인 경우 URLEncoder.encode([value], [ENC_Type]);으로 인코딩 해줘야 함 */
		Cookie cartId = new Cookie("Shipping_carId", URLEncoder.encode(request.getParameter("cartId"), "UTF-8"));
		Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "UTF-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "UTF-8"));
		Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "UTF-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "UTF-8"));
		Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "UTF-8"));
		
		/* 유효기간 설정 */
		/* setMaxAge(초단위); */
		cartId.setMaxAge(24*60*60);
		name.setMaxAge(24*60*60);
		shippingDate.setMaxAge(24*60*60);
		country.setMaxAge(24*60*60);
		zipCode.setMaxAge(24*60*60);
		addressName.setMaxAge(24*60*60);
		
		/* Client(Browser)로 전달 response.addCookie(cookie); */
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		response.sendRedirect("orderConfirmation.jsp");
	%>
	<br />
	
</body>
</html>