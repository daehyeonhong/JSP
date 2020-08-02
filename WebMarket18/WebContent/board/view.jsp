<%@page import="mvc.model.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<title>WriteForm</title>
</head>
<body>
<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	int num = (Integer) request.getAttribute("num");
	int nowPage = (Integer) request.getAttribute("pageNum");
%>
	<%@include file="../menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 글쓰기</h1>
		</div>
	</div>
	<!-- 글쓰기 폼 -->
	<div class="container">
		<form action="${pageContext.request.contextPath}/BoardUpdateAction.do?num<%=board.getNum()%>&pageNum=<%=nowPage%>" name="newUpdate" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input type="hidden" name="id" value="${sessionId}" />
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<input class="form-control" value="<%=board.getName()%>" placeholder="Name" disabled="disabled" />
					<input type="hidden" name="name" value="<%=board.getName()%>" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" placeholder="Subject" value="<%=board.getSubject()%>" autofocus="autofocus" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" style="word-break:break-all;">내용</label>
				<div class="col-sm-8">
					<textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"><%=board.getContent()%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-10 col-sm-offset-2">
					<c:set var="userId" value="<%=board.getId()%>"/>
						<c:if test="${sessionId==userId}">
							<a href="BoardUpdateAction.do?num=<%=board.getNum()%>&pageNum=<%=board.getNum()%>" class="btn btn-danger">수정</a>
							<a href="BoardDeleteAction.do?num=<%=board.getNum()%>&pageNum=<%=board.getNum()%>" class="btn btn-danger">삭제</a>
							<input type="submit" class="btn btn-success" value="등록" />
							<input type="reset" class="btn btn-warning" value="취소" />
						</c:if>
							<a href="./BoardListAction.do?pageNum=<%=nowPage%>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>