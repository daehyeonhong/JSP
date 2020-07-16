<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <script>
    function checkForm() {
      var str = document.frm.name.value;
      var regEpx = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
      if (!regEpx.test(str)) {
        /* 정규표현식과 입력값의 매치여부 확인 */
        alert("이름은 숫자로 시작할 수 없습니다.");
        return;
      }
    }
  </script>
  <body>
    <form name="frm">
      <p>이름: <input type="text" name="name" /></p>
      <input type="submit" value="전송" onclick="checkForm()" />
    </form>
  </body>
</html>
