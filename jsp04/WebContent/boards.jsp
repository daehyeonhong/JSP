<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	BoardRepository boardRepository = BoardRepository.getInstance();
%> --%>
<jsp:useBean id="boardRepository" class="dao.BoardRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시글 목록</h1>
		</div>
	</div>
	<!-- jumboTron -->
	<%
		List<Board> list = boardRepository.getBoardList();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < list.size(); i++) {
				Board board = list.get(i);
			%>
			<div class="col-md-4">
				<h3><%=board.getNo()%></h3>
				<p><%=board.getTitle()%></p>
				<p><%=board.getWriter()%></p>
				<p><%=board.getContent()%></p>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<!-- container -->
	<jsp:include page="footer.jsp" />
</body>
</html>