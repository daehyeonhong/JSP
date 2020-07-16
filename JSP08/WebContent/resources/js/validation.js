function CheckAddProduct() {
  var productId = document.getElementById("productId");
  var name = document.getElementById("pname");
  var unitPrice = document.getElementById("unitPrice");
  var unitsInStock = document.getElementById("unitsInStock");
  var description = document.getElementById("description");
  var manufacturer = document.getElementById("manufacturer");
  var category = document.getElementById("category");
  /* 상품 아이디 체크 */
  /*  if (
    !check(
      /^P[0-9]{4,11}$/,
      pid,
      "[상품코드]\nP와 숫자를 조합하여 5~12까지 입력 하세요\n첫 글자는 P로 시작하세요."
    )
  ) {
    return false;
  } */
  /* 상품명 체크 */
  if (name.value.length < 4 || name.value.length > 31) {
    alert("[상품명]\n최소 4자에서 최대 30자까지 입력하세요");
    name.focus();
    return false;
  }

  /* 상품 가격 체크 */
  if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
    alert("[가격]\n숫자만 입력하세요.");
    unitPrice.focus();
    return false;
  }

  /* 상품가격 음수 체크 */
  if (unitPrice.value < 0) {
    alert("[가격]\n음수는 입력할 수 없습니다.");
    unitPrice.focus();
    return false;
  } else if (
    !check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n 소수점 둘째 자리까지만 입력하세요.")) {
    unitPrice.focus();
    return false;
  }

  if (isNaN(unitsInStock.value)) {
    alert("[재고 수]\n숫자만 입력하세요.");
    unitsInStock.focus;
    return false;
  }

  if (description.value.length == 0) {
    alert("[상세정보]\n 상세정보를 입력하세요.");
    description.focus();
    return false;
  }
  if (manufacturer.value.length == 0) {
    alert("[제조사]\n제조사를 입력하세요.");
    manufacturer.focus();
    return false;
  }

  if (category.value.length == 0) {
    alert("[카테고리]\n카테고리를 입력하세요");
    category.focus();
    return false;
  }

  if (isNaN(unitsInStock.value)) {
    alert("[재고 수량]\n재고 수량을 입력하세요");
    unitsInStock.focus();
    return false;
  }

  function check(regExp, e, msg) {
    if (regExp.test(e.value)) {
      return true;
    }
    {
      alert(msg);
      e.focus();
      return false;
    }
  }
  document.newProduct.submit();
}
