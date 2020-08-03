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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<ul class="pagination pagination-sm">
				<%-- 이전 Segment_Block으로 이동 --%>
					<c:if test="${currentBlock <= 1}">
						<li class="previous disabled"><a href="#">Previous</a></li>
					</c:if>
					<c:if test="${currentBlock > 1}">
						<li class="previous">
							<a href="./BoardListAction.do?pageNum=${startPage - 1}&items=${items}&text=${text}">Previous</a>
						</li>
					</c:if>
					<%-- 현재 Segment_Block내에서의 Page List --%>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li<c:if test="${pageNum == i}"> class = 'active'</c:if>>
							<a href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}" />">
								<c:choose>
									<c:when test="${pageNum == i}">
										<font color="#4C5317"><b>${i}</b></font>
									</c:when>
									<c:otherwise>
										<font color="#4C5317">${i}</font>
									</c:otherwise>
								</c:choose>
							</a>
						</li>
					</c:forEach>
					<%-- 다음 Segment_Block으로 이동 처리 --%>
					<c:if test="${currentBlock < total_segment}">
						<li class="next">
							<a href="<c:url value="./BoardListAction.do?pageNum=${endPage + 1}&items=${items}&text=${text}" />">Next</a>
						</li>
					</c:if>
					<c:if test="${currentBlock >= total_segment}">
						<li class="next disabled"><a href="#">Next</a></li>
					</c:if>
				</ul>
			</div>
			<%-- Page_Navaigation 끝. --%>
			<%-- 검색 조건 --%>
			<div class="container col-7">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
							<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">내용에서</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" value="검색" id="btnAdd" class="btn btn-primary" />
						</td>
						<td width="100%" align="right">
							<a href="#" onclick="checkForm();" class="btn btn-primary">&laquo;글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
			<%-- 검색조건 --%>
		</form>
		<hr />
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>