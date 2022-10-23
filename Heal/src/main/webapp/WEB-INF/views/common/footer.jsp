<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    
    
    
    
    
   <style>
   footer{
    font-family: 'MICEGothic Bold';
   }
   
   </style>
 

<footer class="footer pt-3 text-light" style="background-color: #201627;">
        <div class="container mb-4 py-4 pb-lg-5">
            <div class="row ">
                <div class="col-4">
                    <a class="d-inline-block" href="#"><img src="<%=request.getContextPath() %>/resources/images/footer/footerImg.png" width="300" alt="미안해"></a>
                    <div class="nav-link-light" style="font-size:20px; margin-right:70px;">힐링 장소 검색 플랫폼 ,<br>HEALING에 오신 것을 환영합니다.<br> 지금 바로, 나만의 힐링스팟을 찾아보세요!</div>
                </div>
                <!-- Links-->
                <div class="col-3">
                    <h3 class="fs-base text-light">MEMBER</h3>
                    <ul class="list-unstyled fs-sm">
                        <li class="nav-link-light"> <span>김상현</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>김영후</span></li>
                        <li class="nav-link-light"> <span>이정우</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>정세은</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>정우성</span></li>

                    </ul>
                </div>
                <!-- Links-->
                <div class="col-3">
                    <h3 class="fs-base text-light">INSTITUTION</h3>
                    <ul class="list-unstyled fs-sm">
                        <li class="nav-link-light"> KH 정보교육원</li>
                        <li class="nav-link-light"> Call 1544-9970</li>
                        <li class="nav-link-light"> www.iei.or.kr</li>
                    </ul>
                </div>
                <!-- Subscription form-->
                <div class="col-2">
                    <h3 class="fs-base text-light">OPEN API</h3>
                      <img src="${path}/resources/image/footer/kopis0.png" class="my-2" width="150" alt="Logo">                        
                      <img src="${path}/resources/image/footer/naver0.png" class="my-2" width="150" alt="Logo">                       
                      <img src="${path}/resources/image/footer/kakao.png" class="my-2" width="150" alt="Logo" style="height:43px;">   
                </div>
            </div>
        </div>
    </footer>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@푸터 끝@@@@@@@@@@@@@@@ -->


    <!-- Back to top button-->
    <a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
<script>
Kakao.init('8cddaf5bb7b88f487cf47627b52b649b'); //발급받은 키 중 javascript키를 사용해준다.
Kakao.isInitialized();
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
       	Kakao.Auth.setAccessToken(response.access_token);
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  var id = response.id;
        	  
        	  $.ajax({
        		  url: "/kakao",
       			  type: "POST",
       			  data: { 
       				  id : id 
       			  },
                	  
                  success: function(location) {
                  }
        	  })
              location.href=location;
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
//카카오로그아웃  
function kakaoLogout() {
     Kakao.API.request({
     url: '/v1/user/unlink',
     success: function (response) {
    	 $.ajax({
   		  url: "/logout",
  			  type: "POST",
  			  progress: true,
           	  
             success: function(user) {
             }
   	  	})
      	location.href= "http://localhost/";
       },
       fail: function (error) {
         console.log(error)
       },
     })
  }  
</script>
   
  </body>
</html>