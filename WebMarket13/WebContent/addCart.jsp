<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* parameter로 넘어온 [ID_Value] */
String id = request.getParameter("id");

/* ID값이 넘어왔는지 확인 */
if (id == null || id.trim().equals("")) {/* [ID_Value]가 넘어오지 않았으면 상품리스트 페이지로 이동 */
	response.sendRedirect("products.jsp");
	return;
}

/* [ID_Value]가 존재하면 상품처리 객체 생성 */
ProductRepository dao = ProductRepository.getInstance();
/* 해당 ID에 맞는 상품정보 얻기 */
Product product = dao.getProductById(id);

if (product == null) {/* 해당 ID로 상품이 존재하지 않으면 ErrorPage로 이동 */
	response.sendRedirect("exceptionNoProductId.jsp");
	return;
}

/* 상품 전체 리스트 받기 */
List<Product> goodList = dao.getAllProducts();
/* 상품 정보 담을 객체 생성 */
Product goods = new Product();

/* 리스트 상품 정보 얻은 후 ID가 같으면 반복 종료 */
for (int i = 0; i < goodList.size(); i++) {
	goods = goodList.get(i);
	if (goods.getProductId().equals(id)) {
		break;
	}
}

/* 세션에 cartList가 있는지 여부 확인
없으면 cartList를 생성하여 session에 저장 */

ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
Product goodsQnt = new Product();

/* 장바구니에 동일 상품이 존재하면
수량을 추가 */
for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;/* 장바구니수량 증가 */
		goodsQnt.setQuantity(orderQuantity);
	}
}

/* 장바구니에 해당 상품이 없으면 */
if (cnt == 0) {
	goods.setQuantity(1);
	list.add(goods);
}
System.out.println("상품수량: " + cnt);
/* 상세페이지로 이동시 원래 상품 정보 출력 */
/* response.sendRedirect("product.jsp?id=" + id); */
response.sendRedirect("products.jsp");
/* request.setAttribute("id", id);
RequestDispatcher requestDispatcher = request.getRequestDispatcher("product.jsp?id=" + id);
requestDispatcher.forward(request, response); */
%>