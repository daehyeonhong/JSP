<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false" user="root"
	password="1234" />
<sql:query var="resultSet" dataSource="${dataSource}">
select*from member where id=?
<sql:param value="<%=sessionId%>" />
</sql:query>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function changePass(id) {
			alert(id);
			window.open("passwordChange.jsp?id=" + id, "비밀번호 체크", "_blank", "toolbar=yes", "scrollbars=yes",
					"resizable=yes,top=100,left=500,width=200,height=200");
		}

		function deleteMember() {
			let yesNo = confirm("정말 탈퇴하시겠습니까?");
			if(yesNo) {
				alert('deleteMember.jsp');
				location.href = "deleteMember.jsp";
			} else {
				alert('탈퇴 요청이 취소되었습니다.')
				return;
			}
		}

		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}
	</script>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">회원정보 수정</h2>
		</div>
	</div>
	<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="mail" value="${row.mail}" />
		<c:set var="mail1" value="${mail.split('@')[0]}" />
		<c:set var="mail2" value="${mail.split('@')[1]}" />

		<c:set var="birth" value="${row.birth}" />
		<c:set var="year" value="${birth.split('/')[0]}" />
		<c:set var="month" value="${birth.split('/')[1]}" />
		<c:set var="day" value="${birth.split('/')[2]}" />
		<div class="container">
			<form action="processUpdateMember.jsp" name="newMember"
				class="form-horizontal" method="post" onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input disabled="disabled" class="form-control" value="${row.id}" />
						<input type="hidden" name="id" id="id" class="form-control"
							value="${row.id}" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="password" class="form-control"
							placeholder="password" required="required" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="password_confirm"
							class="form-control" placeholder="password_confirm"
							required="required" /> <input type="button"
							class="btn btn-primary" value="비밀번호 확인" id="changePassword"
							name="changePassword" onclick="changePass('${row.id}')" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" class="form-control" placeholder="name"
							required="required" value="${row.name}" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
						<c:set var="gender" value="${row.gender}" />
						<input name="gender" type="radio" value="남"
							<c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if> />남
						<input name="gender" type="radio" value="여"
							<c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if> />여
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4">
						<input name="birthyy" maxlength="4" placeholder="연도(4)" size="6"
							value='<c:out value="${year}"></c:out>' /> <select
							name="birthmm">

							<option value="">월</option>
							<option value="01" <c:if test="${month==01}">selected</c:if>>1월</option>
							<option value="02" <c:if test="${month==02}">selected</c:if>>2월</option>
							<option value="03" <c:if test="${month==03}">selected</c:if>>3월</option>
							<option value="04" <c:if test="${month==04}">selected</c:if>>4월</option>
							<option value="05" <c:if test="${month==05}">selected</c:if>>5월</option>
							<option value="06" <c:if test="${month==06}">selected</c:if>>6월</option>
							<option value="07" <c:if test="${month==07}">selected</c:if>>7월</option>
							<option value="08" <c:if test="${month==08}">selected</c:if>>8월</option>
							<option value="09" <c:if test="${month==09}">selected</c:if>>9월</option>
							<option value="10" <c:if test="${month==10}">selected</c:if>>10월</option>
							<option value="11" <c:if test="${month==11}">selected</c:if>>11월</option>
							<option value="12" <c:if test="${month==12}">selected</c:if>>12월</option>
						</select> <input name="birthdd" maxlength="2" placeholder="일" size="4"
							value="${day}" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">EMail</label>
					<div class="col-sm-10">
						<input name="mail1" maxlength="50" placeholder="EMail"
							value="${mail1}" />@ <select name="mail2">
							<option value="naver.com"
								<c:if test="${mail2=='naver.com'}">selected</c:if>>naver.com</option>
							<option value="daun.net"
								<c:if test="${mail2=='daum.net'}">selected</c:if>>daum.net</option>
							<option value="gmail.com"
								<c:if test="${mail2=='gmail.com'}">selected</c:if>>gmail.com</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-10">
						<input name="phone" maxlength="20" class="form-control"
							placeholder="phone" value="${row.phone}" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" name="postcode"
							placeholder="우편번호" value="${row.postcode}" /><input
							type="button" onclick="execDaumPostcode()" value="우편번호 찾기" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-10">
						<input name="address" id="address" class="form-control"
							placeholder="address" value="${row.address}" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상세주소</label>
					<div class="col-sm-10">
						<input type="text" id="detailAddress" name="detailAddress"
							placeholder="상세주소" value="${row.detailAddress}" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">참고 항목</label>
					<div class="col-sm-10">
						<input type="text" id="extraAddress" name="extraAddress"
							placeholder="참고항목" value="${row.extraAddress}" />
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-4">
						<input type="submit" id="submit" value="회원정보 수정"
							class="btn btn-primary" /> <input type="reset"
							onclick="resetType()" value="취소" class="btn btn-warning" /> <a
							href="javascript:deleteMember()" class="btn btn-primary">회원탈퇴</a>
					</div>
				</div>
			</form>
		</div>
	</c:forEach>
	<jsp:include page="/footer.jsp" />
</body>
</html>