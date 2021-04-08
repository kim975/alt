## 농축산물 직거래 사이트(ALT)

### 소개
ALT는 팀프로젝트로 기존 쇼핑몰들과는 달리 판매자와 소비자간 채팅을 이용해 가격, 수량을 조정해서 거래를 할 수 있도록 만들었습니다.

## 기술 스택

- Front-End
  - HTML, CSS, JavaScript
  - JQuery
  - BootStrap
- Back-End
  - Java
  - Mybatis
- WebServer
  - Apache-Tomcat 9.0
- DataBase
  - Oracle 11g
- Framework
  - Spring

## 프로젝트 기능 및 코드 설명
* #### 게시판 메인 및 상품 상세 페이지와 댓글
<img width='300px' height='400px' src='https://user-images.githubusercontent.com/81149759/113966650-71e94380-986a-11eb-92c4-fdd51cc01066.PNG'><img width='300px' height='400px' src='https://user-images.githubusercontent.com/81149759/113966648-7150ad00-986a-11eb-9e01-af4e171ded00.PNG'><img width='300px' height='400px' src='https://user-images.githubusercontent.com/81149759/113966646-7150ad00-986a-11eb-868a-e44f4fe35559.PNG'>


게시판 페이지는 Ajax를 이용해 상품의 이미지, 해당 게시글의 댓글에 해당하는 별점평균과 개수를 보여줍니다.

상품 상세 페이지는 ajax를 이용해 프로필이미지, 상품 설명이미지, 댓글의 이미지를 가져오고 spring-security를 이용하여 권한을 확인해 구매와 채팅버튼의 활성화를 제어했습니다.

```SCSS
$.getJSON("/board/getImageList", {sno: snoStr}, function(arr) {
				
  var str = "";
				
  $(arr).each(function(i, attach) { 
						
    var fileCallPath = encodeURIComponent(attach.suploadPath + "/" + attach.suuid + "_" + attach.sfileName);
					
    str = "<div data-path='" + attach.suploadPath + "' data-uuid='" + attach.suuid + "' data-filename='" + attach.sfileName + "' data-type='" + attach.sfileType + "'>"
        + "  <div>"
        + "    <img  style='width: 100%; height: 100%;' src='/display?fileName=" + fileCallPath + "'>"
        + "  </div>"
        + "</div>";
						
    $(".attachImage").append(str);
  });
				
}); //end getJSON
```

ajax를 이용하여 판매게시판 번호를 boardController로 넘겨 이미지의 이름을 가져오고 downloadController의 display를 이용하여 이미지의 경로를 찾아 표시합니다.

```
<sec:authorize access="hasAnyRole('ROLE_CLIENT','ROLE_VENDOR')">
  <button style="margin-right: 5px;" id='moveBasket' type="button" class="btn btn-outline-success" style="color: #009970;">장바구니</button>
  <a href="" class="btn btn-success" style="background-color: #009970;" onclick="javascript:window.open('/chat?vid=${sale.vid}','new','left=50, top=50, width=600, height=800')">판매자와 연락하기</a>           				
</sec:authorize>
				
<sec:authorize access="isAnonymous()">
  <p style="color: gray;"><b>* 회원이 아닐 경우 채팅 기능과 장바구니 기능이 활성화 되지 않습니다.<br>&nbsp;&nbsp;&nbsp;채팅으로 문의를 원하신다면 가입을 진행해주세요.</b></p>
</sec:authorize>

```

spring-security의 기능인 authorize를 이용하여 권한을 확인해서 비로그인과 로그인을 구별하여 표시하게 구성했습니다.

* #### 채팅
<img width='300px' height='400px' src='https://user-images.githubusercontent.com/81149759/113966294-c9d37a80-9869-11eb-8fba-b9e51d0828d0.PNG'><img width='300px' height='400px' src='https://user-images.githubusercontent.com/81149759/113966643-701f8000-986a-11eb-880e-e00076027a89.PNG'>

채팅은 websocket을 이용하여 소비자가 판매자와의 채팅 버튼을 누르면 해당게시글의 판매자와 새로운 채팅방을 개설해 채팅을 할 수 있게 구현했습니다.


* #### spring-security를 이용한 로그인 구현

소비자와 판매자의 데이터베이스 접근을 제어하기 위해 http와 authentication-manager를 2개를 나누어 관리할 수 있게 구현했습니다.
