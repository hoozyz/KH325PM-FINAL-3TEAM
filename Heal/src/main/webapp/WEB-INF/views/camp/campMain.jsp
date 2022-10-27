<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerCamp.jsp">
	<jsp:param value="캠핑 메인" name="title"/>
</jsp:include>


 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
  <!-- Main Theme Styles + Bootstrap-->
  <link rel="stylesheet" media="screen" href="${path}/css/theme.min.css">
  
  
		<!-- @@@@@@@@@@@campMain.css -->
		<style>
		    * {
		        margin: 0px;
		        padding: 0px;
		    }
		    
		    h2 {
		        font-size: 35px
		    }
		    
		    .h2_span {
		        font-size: 17px;
		        font-weight: 500;
		    }
		    
		    .card-light {
		        border-color: transparent;
		        background-color: rgba(255, 255, 255, 0.1);
		        color: #fff;
		    }
		    
		    .navbar-dark .navbar-nav .nav-link {
			    color: rgba(255,255,255,0.8);
			}

		    
		</style>


        <section class="jarallax bg-dark zindex-1 py-xxl-5 pb-5 " style="height:50vh;" data-jarallax data-speed="0.5">
            <span class="img-overlay bg-transparent"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/campHero3.png); "></div>
            <div class="content-overlay container py-md-5">
                <div class="mb-md-5 py-5" style="margin-top:100px">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto px-0 text-center">
                        <h1 class="display-1 text-light">CAMPING </h1>
                        <!--  <p class="fs-lg text-white">Find great places to stay, eat, shop, or visit from our partners and local experts. Plan your trip with Finder now</p> -->
                    </div>
                    <div class="col-xl-8  mx-auto px-0" style="margin-top:100px">
                        <!-- Form group-->
                        <form class="form-group d-block" name="campSearchFrm" action="${path}/camp/campSearch" method="get" >
                            <div class="row g-0">
                                <div class="col-md-10 d-sm-flex align-items-center">
                                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                        <input class="form-control" name="keyword" type="text" placeholder="캠핑을 검색하세요">
                                    </div>
                                    <hr class="d-sm-none my-2">
                                    <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                                        <button class="btn btn-lg btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-home me-2"></i><span class="dropdown-toggle-label">전체/도</span></button>
                                        <input type="hidden" name="addr">
                                        <ul class="dropdown-menu" style="position: absolute; z-index:1;">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">서울특별시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">부산광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">대구광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">인천광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">광주광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">대전광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">울산광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">세종특별시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">경기도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">강원도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">충청북도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">충청남도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">전라북도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">전라남도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">경상북도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">경상남도</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">제주특별자치도</span></a></li>
                                        </ul>
                                    </div>
                                    <hr class="d-sm-none my-2">
                                    <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                                        <button class="btn btn-lg btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-map-pin me-2"></i><span class="dropdown-toggle-label">분류 선택</span></button>
                                        <input type="hidden" name="theme">
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">일몰명소	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">일출명소</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">낚시	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">물놀이	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">단풍명소	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">눈꽃명소</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">걷기길		</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">액티비티	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">수상레저	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">봄꽃여행	</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">스키		</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">항공레저	</span></a></li>
                                        </ul>
                                    </div>  
<!--                                     <input class="form-control" name="category" type="hidden"> -->
<!--                                     <input class="form-control" name="price" type="hidden"> -->
                                </div>
                                <hr class="d-md-none mt-2">
                                <div class="col-md-2 d-sm-flex align-items-center pt-3 pt-md-0">
                                    <input class="btn btn-lg btn-icon btn-primary px-3 w-100" type="submit" value="검색"/>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </section>


        <!-- CTA carousel-->
         <section class="container pt-4 pb-5 py-sm-5">
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner d-block d-md-flex" data-carousel-options="{&quot;controlsContainer&quot;: &quot;#external-controls&quot;, &quot;nav&quot;: false, &quot;gutter&quot;: 20, &quot;autoHeight&quot;: true}">
                    <!-- Slide 1-->
                    <div>
                        <div class="card card-body p-sm-5 card-light h-100">
                            <div class="row align-items-center py-3 py-sm-0">
                                <div class="col-md-4 col-xl-3 mb-4 pb-3 mb-md-0 pb-md-0 text-center text-md-start">
                                    <h2 class="text-light">캠핑의 종류</h2>
                                    <p class="fs-lg text-light opacity-70 pb-md-4">원하는 캠핑을 골라보세요</p>
                                </div>
                                <div class="col-md-8 col-xl-9">
                                    <div class="row row-cols-2 row-cols-lg-4 gy-4 gx-3 gx-sm-4">
                                        <a class="col text-light text-decoration-none" href="${path}/camp/campSearch?category=일반야영장"><img class="d-block mb-2 mx-auto" src="${path}/resources/image/campIcon1.png" width="140" style="padding-top:20px;" alt="Seat Covers">
                                            <div class="fw-bold text-center pt-1" style="margin-top :20px;">캠핑</div>
                                        </a>
                                        <a class="col text-light text-decoration-none" href="${path}/camp/campSearch?category=글램핑"><img class="d-block mb-2 mx-auto" src="${path}/resources/image/glamping.png" width="140" alt="Tires">
                                            <div class="fw-bold text-center pt-1" style="margin-top :18px;">글램핑</div>
                                        </a>
                                        <a class="col text-light text-decoration-none" href="${path}/camp/campSearch?category=카라반" style="margin-top: 40px;"><img class="d-block mb-2 mx-auto" src="${path}/resources/image/caravan.png" width="140" alt="Disks">
                                            <div class="fw-bold text-center">카라반</div>
                                        </a>
                                        <a class="col text-light text-decoration-none" href="${path}/camp/campSearch?category=자동차야영장" style="margin-top: 40px;"><img class="d-block mb-2 mx-auto" src="${path}/resources/image/carB.png" width="140" alt="Child Seats">
                                            <div class="fw-bold text-center">카박</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 글씨 안보여서 임시로 3개 썻으니 나중에 지울것! style="color: white ;" -->

        <!-- Top agents (lnked carousel)-->


        <section class="container">
            <h2 class="mb-0 pb-0 " style="color: white ;">인기 <span style="color:#f7b202">캠핑장</span> <span class="h2_span">어디로 갈지 고민이라면!</span></h2>
        </section>
        <!-- Top agents (lnked carousel)-->
        <section class="container-fluid mb-5 pb-2 pb-lg-4" style="width: 1400px">
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;mode&quot;: &quot;gallery&quot;, &quot;controlsContainer&quot;: &quot;#agents-carousel-controls&quot;, &quot;nav&quot;: false}">
                     <div>
                        <div class="row align-items-center">
                            <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="${path}/resources/image/campReview1.jpg" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="${path}/resources/image/campReview2.jpg" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                                <div class="card border-0 shadow-sm ms-sm-n5">
                                    <blockquote class="blockquote card-body">
                                        <h4 style="max-width: 22rem;">&quot;평창 보물섬 캠핑장&quot;</h4>
                                         <div class="text-muted fw-normal fs-sm mb-3">강원도 평창군 봉평면 유포리 61-2</div>
                                        <p class="d-sm-none d-lg-block">기억에 남는 캠핑이였습니다. 두분 너무 친절 하시고 맘 편히 잘 있다가 왔습니다. 아기자기한 캠핑장 분위기와 특히 야경이 너무 좋았습니다 그리고 강아지..ㅎ 넘 귀여웠습니다</p>
                                        <footer class="d-flex justify-content-between">
                                            <div class="pe-3 ">
                                                <a class="text-decoration-none" href="${path}/camp/campDetail?no=6811">
                                                    <h6 class="mb-0">캠핑초보</h6>
                                                </a>
	                                                <div class="my-3">
	                                                <a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-facebook"></i></a>
	                                                <a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2"  onclick="return flase;"><i class="fi-twitter"></i></a>
	                                               	<a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-linkedin"></i></a>
	                                               	</div>
                                               </div>
                                            <div>
                                            <span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                                <div class="text-muted fs-sm mt-1"> 2022/10/11</div>
                                            </div>
                                        </footer>
                                    </blockquote>
                                </div>
                                <div>
                                    <button class="btn btn-primary d-block mb-4" style="position: absolute; bottom: -22px; right: 50px; " type="button" onclick="location.href='${path}/camp/campDetail?no=6811';">&nbsp&nbsp<i class="fi-checkbox-checked-alt me-2"></i>캠핑장 상세보기&nbsp&nbsp&nbsp&nbsp</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="row align-items-center">
                            <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="${path}/resources/image/pCamp5.png" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="${path}/resources/image/pCamp6.png" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                                <div class="card border-0 shadow-sm ms-sm-n5">
                                    <blockquote class="blockquote card-body">
                                        <h4 style="max-width: 22rem;">&quot;별빛마루 글램핑&카라반&quot;</h4>
                                          <div class="text-muted fw-normal fs-sm mb-3">경상북도 경주시 천북면 화산리 93-6 월정사부근</div>
                                        <p class="d-sm-none d-lg-block">너무 친절하시고 깨끗해요! 카라반 내부는 물론이고 화장실, 식기류.. 침구에선 향기도 나더라고요~~ 고기세트까지 예약해서 먹었는데 진짜 구성이 괜찮아서 장 볼 땐 주류나 음료만 사가도 돼요~~ 매점도 있어서 그냥 맨몸으로 가셔도 될 듯 ㅋㅋㅋ 잘 놀고 잘 쉬다 왔습니당ㅎㅎ</p>
                                        <footer class="d-flex justify-content-between">
                                            <div class="pe-3">
                                               	<a class="text-decoration-none" href="${path}/camp/campDetail?no=1337 ">
                                                    <h6 class="mb-0">캠핑초보</h6>
                                                </a>
                                                <div class="my-3">
	                                                <a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-facebook"></i></a>
	                                                <a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2"  onclick="return flase;"><i class="fi-twitter"></i></a>
	                                               	<a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-linkedin"></i></a>
                                              	</div>
                                           	</div>
                                            <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                                <div class="text-muted fs-sm mt-1">22 reviews</div>
                                            </div>
                                        </footer>
                                    </blockquote>
                                </div>
                                <div>	
                                    <button class="btn btn-primary d-block mb-4" style="position: absolute; bottom: -22px; right: 50px; " type="button" onclick="location.href='${path}/camp/campDetail?no=1337';">&nbsp&nbsp<i class="fi-checkbox-checked-alt me-2"></i>캠핑장 상세보기&nbsp&nbsp&nbsp&nbsp</button>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            <div class="tns-carousel-controls justify-content-center justify-content-md-start md-4" id="agents-carousel-controls">
                <button class="mx-2" type="button"><i class="fi-chevron-left"></i></button>
                <button class="mx-2" type="button"><i class="fi-chevron-right"></i></button>
            </div>
        </section>




        <section class="container pb-4 pt-1 mb-5">
            <div class="d-flex align-items-end align-items-lg-center justify-content-between">
                <div class="d-flex align-items-center justify-content-between justify-content-lg-start">
                <h2 class="mb-2 pb-2 " style="color: white ;">주요 <span style="color:#FD5D08">캠핑장</span> <span class="h2_span">전국 주요 캠핑장을 소개합니다!</span></h2>
           </div>
           		<nav>
	                <div class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0" role="tablist">
                    	<button class="nav-link  fs-sm active  mb-2 mb-md-0 me-1" id="gyeonggi-tab" data-bs-toggle="tab" data-bs-target="#gyeonggi" type="button" role="tab" aria-controls="gyeonggi" aria-selected="true">경기도</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="gangwon-tab" data-bs-toggle="tab" data-bs-target="#gangwon" type="button" role="tab" aria-controls="gangwon" aria-selected="true">강원도</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="chungcheong-tab" data-bs-toggle="tab" data-bs-target="#chungcheong" type="button" role="tab" aria-controls="chungcheong" aria-selected="true">충청도</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="gyeongsang-tab" data-bs-toggle="tab" data-bs-target="#gyeongsang" type="button" role="tab" aria-controls="gyeongsang" aria-selected="true">경상도</button>
	               	</div>
             	</nav>
            </div>
            
<!--             경기@@@@@@@ -->
		<div class="tab-content" id="myTabContent">
		
		
             <div class="tab-pane fade show active " id="gyeonggi" role="tabpanel" aria-labelledby="gyeonggi-tab">
                <div class="row g-4">
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(https://gocamping.or.kr/upload/camp/7079/thumb/thumb_720_4383GIAI3xkzGniAyKqwUhA0.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important" ></span>
                        <div class="card-body content-overlay pb-0"><div class="d-flex">   
                        <div class="d-flex"><span class="d-table badge bg-success fs-sm me-2">일반야영장</span> </div> </div>                       </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=7079">
                                    <h3 class="h5 text-light mb-1">파인힐빌리지 캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경기도 동두천시 안흥로 65-42 (안흥동)</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=7079" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="180000" /></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(https://gocamping.or.kr/upload/camp/1118/thumb/thumb_720_13753jwo0U339HQTe0BIPfKR.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0">  <span class="d-table badge bg-success mb-1 ">일반야영장</span><span class="d-table badge bg-warning">자동차야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=1118">
                                    <h3 class="h5 text-light mb-1">무지개 서는 마을</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경기도 가평군 북면 가화로 1725 무지개서는 마을 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=1118" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="120000" /></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden" style="background-image: url(https://gocamping.or.kr/upload/camp/2034/thumb/thumb_720_9010rPaYI1oUMTSDZ97V90Ay.png;"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class="d-table badge bg-info mb-1">카라반</span><span class="d-table badge bg-warning">자동차야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2034">
                                    <h3 class="h5 text-light mb-1">알멕스랜드캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경기도 연천군 왕징면 왕산로 218번길 25-100 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2034" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="150000" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
<!--             강원@@@@@@@ -->
            <div class="tab-pane fade" id="gangwon" role="tabpanel" aria-labelledby="gangwon-tab">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(https://gocamping.or.kr/upload/camp/6975/thumb/thumb_720_8864VHhvenUMGtZByAoSmY82.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important" ></span>
                        <div class="card-body content-overlay pb-0">
                        <div class="d-flex"><div class="d-flex"> <span class="d-table badge bg-warning fs-sm me-2">자동차야영장</span></div></div>
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=6975" >
                                    <h3 class="h5 text-light mb-1">동강전망휴양림 오토캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>강원도 정선군 신동읍 동강로 916-212</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=6975" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="180000" /></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(https://gocamping.or.kr/upload/camp/2672/thumb/thumb_720_8622MUgbQjvlvxxPtpZckjRE.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0">   <span class="d-table badge bg-info mb-1">카라반</span><span class="d-table badge bg-success mb-1">일반야영장</span><span class="d-table badge bg-warning">자동차야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2672">
                                    <h3 class="h5 text-light mb-1">장호비치 캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>강원도 삼척시 근덕면 삼척로 2116</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2672" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="30000" /></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden" style="background-image: url(https://gocamping.or.kr/upload/camp/2775/thumb/thumb_720_6453Ij6RkaSAk8Hv2Ba4uVbH.jpg;"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class="d-table badge bg-info mb-1">카라반</span><span class="d-table badge bg-warning">자동차야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2775">
                                    <h3 class="h5 text-light mb-1">양양 죽도오토캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>강원도 양양군 현남면 인구중앙길 88 죽도오토캠핑장 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2775" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="60000" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
            <!--             충청@@@@@@@ -->
            <div class="tab-pane fade" id="chungcheong" role="tabpanel" aria-labelledby="chungcheong-tab">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(https://gocamping.or.kr/upload/camp/3002/thumb/thumb_720_3972rV7TWeyR3LBxjYBWevz2.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important" ></span>
                        <div class="card-body content-overlay pb-0">        <div class="d-flex">                    <div class="d-table badge bg-primary fs-sm me-2">글램핑</div><div class="d-table badge bg-warning">자동차야영장</div></div></div>
                        
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=3002" >
                                    <h3 class="h5 text-light mb-1">충주호캠핑월드</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>충청북도 충주시 동량면 호반로 696-1 충주호캠핑장 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=3002" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="90000" /></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                	<div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(https://gocamping.or.kr/upload/camp/3139/thumb/thumb_720_0154EvDBQbPWa9tWMentKPn9.jpg;"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class="d-table badge bg-success">일반야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=3139">
                                    <h3 class="h5 text-light mb-1">태안둘레길캠핑장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>충청남도 태안군 이원면 내리 503 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=3139" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="120000" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden " style="background-image: url(https://gocamping.or.kr/upload/camp/2999/thumb/thumb_720_82851Qgoj9tciPOJB9BUSZaB.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class="d-table badge bg-success">일반야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2999">
                                    <h3 class="h5 text-light mb-1">충주카누캠핑장 </h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>충청북도 충주시 동량면 화암리 340 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2999" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="210000" /></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!--             경상@@@@@@@ -->
             <div class="tab-pane fade" id="gyeongsang" role="tabpanel" aria-labelledby="gyeongsang-tab">
             <div class="row g-4">
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(https://gocamping.or.kr/upload/camp/2217/thumb/thumb_720_4587ZwAbjie8wZF6iPj1SZ10.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important" ></span>
                        <div class="card-body content-overlay pb-0">  <div class="d-flex"><span class="badge bg-info fs-sm me-2">카라반</span><span class="badge bg-success fs-sm me-2">일반야영장</span><div class=" badge bg-warning">자동차야영장</div></div></div>
                        
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2217" >
                                    <h3 class="h5 text-light mb-1">영덕 고래불 국민 야영장</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경상북도 영덕군 병곡면 고래불로 12</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2217" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="60000" /></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(https://gocamping.or.kr/upload/camp/2999/thumb/thumb_720_82851Qgoj9tciPOJB9BUSZaB.jpg);"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class=" badge bg-success">일반야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=2999">
                                    <h3 class="h5 text-light mb-1">충주카누캠핑장 </h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>충청북도 충주시 동량면 화암리 340 </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=2999" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="210000" /></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden" style="background-image: url(https://gocamping.or.kr/upload/camp/1601/thumb/thumb_720_8911lowhx24u5bD0ECfCy8wC.jpg;"><span class="img-gradient-overlay" style="opacity:0.6!important"></span>
                        <div class="card-body content-overlay pb-0"><span class=" badge bg-success">일반야영장</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="${path}/camp/campDetail?no=1601">
                                    <h3 class="h5 text-light mb-1">생림 오토 캠핑장  </h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경상남도 김해시 생림면 마사리 1322-6  </div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="${path}/camp/campDetail?no=1601" style="height: 2.75rem;"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="150000" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
           </div>
        </section>
        
        
        

        <!-- Top offers (carousel)-->
        <div class="container ">
            <div class="d-flex align-items-center justify-content-between">
                <h2 class="mb-2 pb-2 " style="color: white ;"><span style="color:#f7b202">캠핑 용품</span> 추천 <span class="h2_span">캠핑은 장비빨</span></h2>

                <a class=" btn btn-link fw-normal p-0 " href="real-estate-catalog-rent.html ">더보기<i class="fi-arrow-long-right ms-2 "></i></a>
            </div>
        </div>
        <section class="container-fluid mb-5 " style="width: 1500px; ">
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2 ">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-1 pb-4 " data-carousel-options="{&quot;items&quot;: 6, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1242&quot;:{&quot;items&quot;:5},&quot;1498&quot;:{&quot;items&quot;:6}}} ">
              <c:if test="${!empty shopList}"> <!-- 용품 리스트 -->
				<c:forEach var= "i"  begin="0" end="${shopList.size() - 1}">
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="${shopList.get(i).link}"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 ">
                                	<c:if test="${shopList.get(i).cate3 eq '캠핑가구'}">
                                		<span class="badge bg-info ">${shopList.get(i).cate3}</span>
                                	</c:if>
                                	<c:if test="${shopList.get(i).cate3 eq '텐트'}">
		                            	<span class="badge bg-success">${shopList.get(i).cate3}</span>
	                            	</c:if>
                                	<c:if test="${shopList.get(i).cate3 eq '취사용품'}">
		                            	<span class="badge bg-danger">${shopList.get(i).cate3}</span>
	                            	</c:if>
                                	<c:if test="${shopList.get(i).cate3 eq '침낭'}">
		                            	<span class="badge bg-dark">${shopList.get(i).cate3}</span>
	                            	</c:if>
                                </div>
                                <img src="${shopList.get(i).image}" style="min-height: 230px" alt="Image ">
                            </div>
                            <hr>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">${shopList.get(i).mall}</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="${shopList.get(i).link}">${shopList.get(i).title}</a></h3>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>  
                                <fmt:formatNumber value="${shopList.get(i).price}" pattern="#,###"/> 원</div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                </c:if>
                    <!--  @@@@@@ 아이템끝-->
                    </div>
            </div>
        </section>
	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
    <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js "></script>
    <script src="${path}/resources/vendor/rellax/rellax.min.js "></script>
	<script src="${path}/resources/js/theme.min.js "></script>
	
    <!-- Main theme script-->
    
    


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>