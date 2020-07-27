# SemiProject
---
## 1. 데이터 베이스 연결 방식

* **[Connection Pool]** 방식으로 연결.
    * 각 페이지마다 사용한 객체 해제. **[Try catch]** 이후 **finally**에서 **connection**만 해제.
---
## 2. 변수 및 함수 이름 규칙

### 변수 및 함수, 페이지 명명 규칙 (구분자)

1. 카멜 케이싱.
    * productName, productId, user, cartList, ...
2. 변수는 보통의 경우 동사 포함X, 함수는 동사를 앞에 배치
    * updateMember(), checkId(), isRun, yesNo
3. 준말일 경우 본말이 바로 떠오르게 직관적으로, `[2-1]`, `[2-2]`규칙에 따라 처리
    * checkId() -> chkId(), PreparedStatement -> pstmt
        * 변수 생성 규칙 조정 준말로 표기할지 여부
4. 상수일 경우 대문자 처리
    * *PI*
5. 이니셜 표기 일 경우 전체 대문자
    * JavaServer Pages Standard Tag Library -> ***JSTL***, DataBase Connection Pool -> ***DBCP***
---
## 3. 추가하고 싶은 기능

1. 회원 가입시 입력된 메일 주소로 확인 메일 전송 기능
    * 랜덤한 문자열을 생성 후 새로운 테이블에 `[column1:confirmSeq]`, `[column2:randomStr]` 저장.<br />
    로그인 자체는 가능하지만, 서비스 이용은 불가.<br />
    서비스를 이용하려면 일정 시간동안 유지되는 해당 `문자열`을 입력하고 계정 활성화 필요.

2. 제품 구입 기능
    * 지금까지 구성해놓은 기능을 토대로, 결제 및 배송을 흉내낸 기능 추가.<br />
    간략하게 기능을 수정하여 구매 요청에 따라 흐름을 구성.
---
## n. 추가할 기능 -조원 아이디어
* '조황'씨 아이디어 제품 추첨 기능
    * Draw 기능
* '김혜빈'씨 아이디어 ...+++
    * ...
---
