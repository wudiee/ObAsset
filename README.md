# ObAsset 프로젝트

![introduce](https://user-images.githubusercontent.com/61649201/106733149-ddd5e280-6654-11eb-929d-2a0aa75c06d1.png)

## 소개

- 팀원 소개

  - [신현석](https://github.com/shinseok95)
  - [최종백](https://github.com/ChoiJongBaek)
  - [이지영](https://github.com/wudiee)
  - [김지영](https://github.com/jiyoung-dev)

- 개인 자산관리 서비스
  - 저금리, 높은 부동산 가격으로 인해 제테크에 관심을 가지는 2030세대를 위한 제테크 관리 서비스입니다.
  - 주식, 예적금, 부동산 등 개인의 자산을 한눈에 볼 수 있는 포트폴리오 서비스를 제공 합니다.
  - 자산 현황 차트를 보며 자신의 제테크 상황을 다른 사람들과 비교하며 참고할 수 있습니다.
- Site: http://52.78.197.58:8080/ObAsset 프로젝트를 배포한 주소입니다.
  > 아이디, 비밀번호 찾기, 회원가입에서 사용자가 이메일로 인증코드를 수신하고 입력해야하는 기능이 있는데, <br>AWS에서 SMTP프로토콜의 보안상의 문제로 회원가입 기능을 수행할 수 없습니다.

## 사용 기술

### Back-end

- Java EE 8
- Spring 5.2.12.Release
- apache-tomcat-8
- Oracle Database 11g Express Edition Release 11.2.0.2.0

### Front-end

- Javascript
- CSS
- Start Bootstrap

### Infra

- AWS EC2
- Oracle-RDS

### Tools

- Eclipse IDE
- Window 10
- Git
- Linux Ubuntu Server 18.04 LTS

## 화면 구조

![layout](https://user-images.githubusercontent.com/61649201/106738452-4758ef80-665b-11eb-8de1-4beea0a7d6ed.png)

### 시연 영상

> [영상 바로가기](https://youtu.be/TBHEDrDFNjs)

### 로그인 & 회원가입

- 웹 실행시 보이는 로그인 화면입니다. <br>  
  ![login](https://user-images.githubusercontent.com/61649201/106739834-f649fb00-665c-11eb-8350-0a7e75a72e82.PNG)

- 회원가입을 누르면 회원가입 화면으로 이동합니다.
- 유효성 검사를 통해 입력되는 데이터에 오류 발생 가능성을 최소화 합니다.
- AJAX를 통해 아이디 중복검사를 실행합니다.
- SMTP 프로토콜을 사용해 이메일로 인증번호를 전송합니다.
- apache-commons-codec 오픈소스에서 제공하는 AES256 라이브러리를 활용해 암호화 및 복호화 기능을 추가해 사용자의 비밀번호가 암호 형태로 DB에 저장됩니다.<br>  
  ![signup](https://user-images.githubusercontent.com/61649201/106739838-f77b2800-665c-11eb-8625-6e53954c69b0.PNG)

### 메인 화면

- 사용자가 입력한 자산 데이터에 따라 내 자산 추이, 내 포트폴리오 비율이 변하며, 세대별 포트폴리오 비율과 유형별 포트폴리오 비율을 통해 제테크 시장의 흐름을 파악할 수 있습니다.<br><br>
  ![main](https://user-images.githubusercontent.com/61649201/106739835-f6e29180-665c-11eb-8ca1-a0c8667d0966.PNG)

### 자산 입력 화면

- 모든 자산 데이터를 입력해야 입력하기 버튼이 활성화되며, 정규식을 통해 입력 형식을 조정 하였습니다.
- 이미 데이터가 있는 달에 자산을 재입력한다면, DB가 Update되며, 자산이 없는 경우에는 DB Insert가 되도록 합니다. <br><br>
  ![portfolio](https://user-images.githubusercontent.com/61649201/106739836-f6e29180-665c-11eb-877f-1f0cd210509c.PNG)

### 게시판 화면

- 처음 보이는 화면은 게시물들을 list로 보여주고, 가장 최근에 작성한 글이 상위에 오도록 DB 쿼리를 작성했습니다.
- 게시글 수 10개 단위로 페이징처리를 하며, 찾고자 하는 제목을 제목 검색기능을 통해 찾을 수 있습니다.
- 글쓰기 버튼을 클릭하면 해당 게시물로 이동합니다. <br><br>
  ![board](https://user-images.githubusercontent.com/61649201/106739839-f813be80-665c-11eb-94c7-dc5a6ffb5441.PNG)

### 특정 게시물 화면

- 게시글의 내용이 보이며, AJAX처리를 통해 댓글을 작성합니다.
- 사용자 DB에서 ID 대조를 통해 본인이 작성한 댓글만 삭제가 가능하도록 설계했습니다. <br><br>
  ![board2](https://user-images.githubusercontent.com/61649201/106739829-f3e7a100-665c-11eb-87ec-fecd4e596d6a.PNG)

### 제테크 정보영상 화면

- 제테크 관련한 유익한 영상을 추천해주는 메뉴입니다.
- 문구 클릭시, 해당 유튜브 영상으로 연결됩니다. <br><br>
  ![fvideo](https://user-images.githubusercontent.com/61649201/106756240-6b73fb00-6672-11eb-8603-17bc9be44a7f.PNG)
