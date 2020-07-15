<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h4>─────세션 삭제 전─────</h4>
	<%
		String user_id = (String) session.getAttribute("userID"), user_pw = (String) session.getAttribute("userPW");

	out.print("설정된 세션 이름[userID: " + user_id + "]<br />");
	out.print("설정된 세션 값[userPW: " + user_pw + "]<br />");
	/* 세션 유효성 검사 */
	out.print((request.isRequestedSessionIdValid() == true) ? "세션이 유효합니다." : "세션이 유효하지 않습니다.");

	/* Session 정보 삭제 */
	session.invalidate();
	%>

	<h4>─────세션 삭제 후─────</h4>
	<%
		/* 세션 유효성 검사 */
	out.print((request.isRequestedSessionIdValid() == true) ? "세션이 유효합니다." : "세션이 유효하지 않습니다.");

	/* 이미 제거된 속성이므로 추출 불가 */
	/* java.lang.IllegalStateException: getAttribute: 세션이 이미 무효화되었습니다.
	user_id = (String) session.getAttribute("userID");
	out.print("설정된 세션 이름[userID: " + user_id + "]<br />"); */
	%>
</body>
</html>