해당 프로젝트는 국비지원 Final Project 의 결과물입니다.

팀원들 모두의 코드이므로

  1. 프로젝트 전체 설명
  2. 제가 작업한 작업물 설명을 해보도록 하겠습니다.
  
# 1. 어떤 프로젝트 인가?
***
Final Project 는 일상에 지친 현대인들을 위한 힐링 통합 플랫폼의 
필요성을 느껴 제작해본 힐링 테마 조회, 예약, 결제와 
장소로 가기 위한 교통 예매를 제공하는 사이트입니다.

교통 정보 API 제공 사이트의 호출 횟수 제한 때문에 
DB 파싱을 바꿀 수 없어 교통 예매가 있는 페이지는 
느릴 수 있습니다.

# 2-1. 나의 작업은?

저는 팀장으로서 백엔드에 대해 개발 겸 총괄을 했습니다.
  1. 검색 페이징을 제외한 전체 백엔드 구현. 
    -> 제가 기본틀 완성 후 팀원들이 똑같이 다른 페이지 구현.
  2. 교통 예매 화면 구현.
  
# 2-2. 개발 환경 / 기술 스택은?

**개발환경**
  
  * STS
  * Apache Tomcat 8.5
  * jsp (EL, JSTL)
  * Mybatis
  * maven
  
**기술 스택**

  * Java(jdk 1.8.0)
  * Spring Framework MVC
  * Oracle 11g DBMS
  * Javascript
  * jQuery
  * HTML5
  * CSS
  
# 2-3. 완성된 화면

<details>
<summary>교통 예매 (출발역, 도착역, 시간, 편도, 왕복)</summary>
 (https://user-images.githubusercontent.com/93322974/229851037-9aa623a7-4722-4fe8-9d74-26f7200d46c2.png
</details>

<details>
<summary>카테고리 별 검색, 상세 페이지 (최근 본 장소, 리뷰, 예약, 교통 예매, 지도, 날씨)</summary>
  https://user-images.githubusercontent.com/93322974/229851430-415d5e1d-c7bf-4da7-8278-055d9e0529d7.png
https://user-images.githubusercontent.com/93322974/229851477-8fc5f69b-9754-4508-87cd-179369b52bfe.png
https://user-images.githubusercontent.com/93322974/229851731-f90943bb-d078-4c79-902f-99929da1fbce.png
</details>

<details>
<summary>쇼핑, 포토, 자유 게시판</summary>
https://user-images.githubusercontent.com/93322974/229851948-7272b5ca-1f05-4efb-9819-7ab330872de1.png
https://user-images.githubusercontent.com/93322974/229852094-c071cc3b-35a9-45db-84e7-4ca43b778cda.png
</details>

<details>
<summary>마이페이지 (정보 수정, 나의 게시글, 나의 찜/리뷰, 나의 예약)</summary>
https://user-images.githubusercontent.com/93322974/229852295-f37cc3aa-3153-4ca2-a473-aea09b142c29.png
https://user-images.githubusercontent.com/93322974/229852436-8725b331-75f4-4004-bfad-2978a3d90672.png
</details>
