function CheckAddProduct() {
  var productId = document.getElementById("productId");
  var pname = document.getElementById("pname");
  var unitPrice = document.getElementById("unitPrice");
  var unitsInStock = document.getElementById("unitsInStock");

  /* 상품 아이디 체크 */
  if (
    check(
      /^P[0-9]{4,11}$/,
      productId,
      "[상품코드]\nP와 숫자를 조합하여 5~12까지 입력 하세요\n첫 글자는 P로 시작하세요."
    )
  ) {
    return false;
  }
  /* 상품명 체크 */
  if (name.value.length < 4 || name.value.length > 12) {
    alert("[상품명\n최소 4자에서 최대 12자까지 입력하세요.");
    name.select();
    name.focus();
    return false;
  }
  function check(regExp, e, msg) {
    if (regExp.test(e.value)) {
      return true;
    } else {
      alert(msg);
      e.select();
      e.focus();
      return false;
    }
  }
}
