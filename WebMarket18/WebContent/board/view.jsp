<%@ page import="mvc.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	int num = (Integer) request.getAttribute("num");
	int nowPage = (Integer) request.getAttribute("page");
%>
<c:set var="userId" value="<%=board.getId()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<title><%=board.getNum()%><c:if test="${sessionId == userId}">수정</c:if></title>
</head>
<body>
	<script type="text/javascript">
		function deleteConfirm(num, pageNum) {
			let yesNo = confirm(num + '번 글을 삭제할까요?');
			if (yesNo) {
				location.href = './BoardDeleteAction.do?num=' + num + '&pageNum=' + pageNum;
			} else {
				alert('요청이 취소되었습니다.');
			}
		}
	</script>
	<%@ include file="../menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=board.getSubject()%><c:if test="${sessionId==userId}">수정</c:if>
			</h1>
		</div>
	</div>
	<!-- 글쓰기 폼 -->
	<div class="container">
		<form action="${pageContext.request.contextPath}/BoardUpdateAction.do?num=<%=board.getNum()%>&pageNum=<%=nowPage%>" name="newUpdate" class="form-horizontal" method="post">
			<input type="hidden" name="id" value="${sessionId}" />

			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<c:if test="${sessionId == userId}">
						<input class="form-control" value="<%=board.getName()%>" placeholder="Name" disabled="disabled" />
					</c:if>
					<c:if test="${sessionId != userId}">
						<div class="form-control" style="min-width: 400px;">
							<p><%=board.getName()%></p>
						</div>
					</c:if>
					<input type="hidden" name="name" value="<%=board.getName()%>" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<c:if test="${sessionId == userId}">
						<input name="subject" class="form-control" placeholder="Subject" value="<%=board.getSubject()%>" autofocus="autofocus" />
					</c:if>
					<c:if test="${sessionId != userId}">
						<div class="form-control" style="min-width: 400px;">
							<p><%=board.getSubject()%></p>
						</div>
					</c:if>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label" style="word-break: break-all;">내용</label>
				<div class="col-sm-8">
					<c:if test="${sessionId == userId}">
						<textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"><%=board.getContent()%></textarea>
					</c:if>
					<c:if test="${sessionId != userId}">
						<div class="form-control" style="min-width: 400px; min-height: 300px;">
							<p><%=board.getContent()%></p>
						</div>
					</c:if>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-10 col-sm-offset-2">
					<c:if test="${sessionId == userId}">
						<a href="javascript:deleteConfirm(<%=board.getNum()%>,<%=nowPage%>)" class="btn btn-danger">삭제</a>
						<input type="submit" class="btn btn-success" value="수정" />
						<input type="reset" class="btn btn-warning" value="취소" />
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=nowPage%>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>