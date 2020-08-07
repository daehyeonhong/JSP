<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");

int total_record = (Integer) request.getAttribute("total_record"),
		pageNum = (Integer) request.getAttribute("pageNum"),
		total_page = (Integer) request.getAttribute("total_page"),
		currentBlock = (Integer) request.getAttribute("currentBlock"),
		startPage = (Integer) request.getAttribute("startPage"),
		endPage = (Integer) request.getAttribute("endPage"),
		total_segment = (Integer) request.getAttribute("total_segment");
		String items = (String) request.getAttribute("items"),
		text = (String) request.getAttribute("text");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<body>
	<script type="text/javascript">
		function checkForm() {
			if (${sessionId == null}) {
				alert('로그인 해주세요!');
				return false;
			}
			/* WriteForm으로 이동 */
			location.href = './BoardWriteFormAction.do?id=<%=sessionId%>';
		}
	</script>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do" />" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체<%=total_record%>건</span>
				</div>
			</div>
			<div style="padding-top: 50px;">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<%
						for (int i = 0; i < boardList.size(); i++) {
						BoardDTO notice = boardList.get(i);
					%>
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<%-- List 끝 --%>
			<%-- Page_Navigation --%>
			<c:set var="currentBlock" value="<%=currentBlock%>" />
			<c:set var="pageNum" value="<%=pageNum%>" />
			<c:set var="total_page" value="<%=total_page%>" />
			<c:set var="startPage" value="<%=startPage%>" />
			<c:set var="endPage" value="<%=endPage%>" />
			<c:set var="total_segment" value="<%=total_segment%>" />
			<c:set var="pageNum" value="<%=pageNum%>" />
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
			  	<c:if test="${currentBlock <= 1}">
				    <li class="page-item disabled">
				    	<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a>
				    </li>
					</c:if>
					<c:if test="${currentBlock > 1}">
				    <li class="page-item">
				    	<a class="page-link" href="./BoardListAction.do?pageNum=${startPage - 1}&items=${items}&text=${text}" aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a>
				    </li>
					</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item <c:if test="${pageNum == i}">active</c:if>">
							<a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}" />">
								<c:choose>
									<c:when test="${pageNum == i}">
										<span class="sr-only"></span>
										<font color="#FFF"><b>${i}</b></font>
									</c:when>
									<c:otherwise>
										<font color="#4C5317">${i}</font>
									</c:otherwise>
								</c:choose>
							</a>
						</li>
					</c:forEach>
					<c:if test="${currentBlock < total_segment}">
						<li class="page-item">
							<a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${endPage + 1}&items=${items}&text=${text}" />" aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a>
						</li>
					</c:if>
					<c:if test="${currentBlock >= total_segment}">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a>
						</li>
					</c:if>
			  </ul>			  
			</nav>
			<%-- Page_Navaigation 끝. --%>
			<%-- 검색 조건 --%>
			 <div class="input-group mt-3 mb-3 col-sm-5 mx-auto">
	      <div class="input-group-prepend">
	      	<select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="items">
				 		<option value="subject">제목</option>
				 		<option value="content">내용</option>
			 		</select>
	      </div>
	      <input class="form-control" type="text" name="text" placeholder="Search" />
	   		<div class="input-group-append">
	      <input class="btn btn-primary" type="submit" value="검색" id="btnAdd">
	     </div>
				<a href="#" onclick="checkForm();" class="btn btn-primary ml-auto">글쓰기&raquo;</a>
	    </div>
		</form>
		<hr />
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>