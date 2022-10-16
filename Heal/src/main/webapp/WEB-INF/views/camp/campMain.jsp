<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑 메인" name="title"/>
</jsp:include>
<!-- dark버전-->
	    <style>
	        .page-loading {
	            position: fixed;
	            top: 0;
	            right: 0;
	            bottom: 0;
	            left: 0;
	            width: 100%;
	            height: 100%;
	            -webkit-transition: all .4s .2s ease-in-out;
	            transition: all .4s .2s ease-in-out;
	            background-color: #1f1b2d;
	            opacity: 0;
	            visibility: hidden;
	            z-index: 9999;
	        }
	        
	        .page-loading.active {
	            opacity: 1;
	            visibility: visible;
	        }
	        
	        .page-loading-inner {
	            position: absolute;
	            top: 50%;
	            left: 0;
	            width: 100%;
	            text-align: center;
	            -webkit-transform: translateY(-50%);
	            transform: translateY(-50%);
	            -webkit-transition: opacity .2s ease-in-out;
	            transition: opacity .2s ease-in-out;
	            opacity: 0;
	        }
	        
	        .page-loading.active>.page-loading-inner {
	            opacity: 1;
	        }
	        
	        .page-loading-inner>span {
	            display: block;
	            font-size: 1rem;
	            font-weight: normal;
	            color: #fff;
	            ;
	        }
	        
	        .page-spinner {
	            display: inline-block;
	            width: 2.75rem;
	            height: 2.75rem;
	            margin-bottom: .75rem;
	            vertical-align: text-bottom;
	            border: .15em solid #9691a4;
	            border-right-color: transparent;
	            border-radius: 50%;
	            -webkit-animation: spinner .75s linear infinite;
	            animation: spinner .75s linear infinite;
	        }
	        
	        @-webkit-keyframes spinner {
	            100% {
	                -webkit-transform: rotate(360deg);
	                transform: rotate(360deg);
	            }
	        }
	        
	        @keyframes spinner {
	            100% {
	                -webkit-transform: rotate(360deg);
	                transform: rotate(360deg);
	            }
	        }
	    </style>
	
		<!-- @@@@@@@@@@@campMain.css -->
		<style>
		    * {
		        margin: 0px;
		        padding: 0px;
		    }
		    
		    h2 {
		        font-size: 40px
		    }
		    
		    .h2_span {
		        font-size: 20px;
		        font-weight: 500;
		    }
		    
		    .card-light {
		        border-color: transparent;
		        background-color: rgba(255, 255, 255, 0.1);
		        color: #fff;
		    }
		    
		    body {
		        --bs-bg-opacity: 1;
		        background-color: rgba(var(--bs-dark-rgb), var(--bs-bg-opacity)) !important;
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
                                        <input class="form-control" name="keyword" type="text" placeholder="키워드를 입력하세요">
                                    </div>
                                    <hr class="d-sm-none my-2">
                                    <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                                        <button class="btn btn-lg btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-home me-2"></i><span class="dropdown-toggle-label">전체/도</span></button>
                                        <input type="hidden" name="addr">
                                        <ul class="dropdown-menu" style="position: absolute; z-index:1;">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">서울특별시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">부산광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">대구광역시</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">부산광역시</span></a></li>
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
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">제주도</span></a></li>
                                        </ul>
                                    </div>
                                    <hr class="d-sm-none my-2">
                                    <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                                        <button class="btn btn-lg btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-map-pin me-2"></i><span class="dropdown-toggle-label">분류 선택</span></button>
                                        <input type="hidden" name="theme">
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">해변</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">섬</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">산</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">숲</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">계곡</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">강</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">호수</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">도심</span></a></li>
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
            <h2 class="mb-2 pb-2 " style="color: white ;">인기 <span style="color:#f7b202">캠핑장</span> <span class="h2_span">어디로 갈지 고민이라면!</span></h2>
        </section>
        <!-- Top agents (lnked carousel)-->
        <section class="container-fluid mb-5 pb-2 pb-lg-4" style="width: 1400px">
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;mode&quot;: &quot;gallery&quot;, &quot;controlsContainer&quot;: &quot;#agents-carousel-controls&quot;, &quot;nav&quot;: false}">
                    <div>
                        <div class="row align-items-center">
                            <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="${path}/resources/image/pCamp5.png" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="${path}/resources/image/pCamp6.png" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                                <div class="card border-0 shadow-sm ms-sm-n5">
                                    <blockquote class="blockquote card-body">
                                        <h4 style="max-width: 22rem;">&quot;I will select the best accommodation for you&quot;</h4>
                                        <p class="d-sm-none d-lg-block">Amet libero morbi venenatis ut est. Iaculis leo ultricies nunc id ante adipiscing. Vel metus odio at faucibus ac. Neque id placerat et id ut. Scelerisque eu mi ullamcorper sit urna. Est volutpat dignissim nec.</p>
                                        <footer class="d-flex justify-content-between">
                                            <div class="pe-3">
                                                <a class="text-decoration-none" href="real-estate-vendor-properties.html">
                                                    <h6 class="mb-0">Floyd Miles</h6>
                                                    <div class="text-muted fw-normal fs-sm mb-3">Imperial Property Group Agent</div>
                                                </a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2"
                                                    onclick="return flase;"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-linkedin"></i></a></div>
                                            <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                                <div class="text-muted fs-sm mt-1">45 reviews</div>
                                            </div>
                                        </footer>
                                    </blockquote>
                                </div>
                                <div>
                                    <button class="btn btn-primary d-block mb-4" style="position: absolute; bottom: -22px; right: 50px; " type="submit">&nbsp&nbsp<i class="fi-checkbox-checked-alt me-2"></i>캠핑장 상세보기&nbsp&nbsp&nbsp&nbsp</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="row align-items-center">
                            <div class="col-xl-4 d-none d-xl-block"><img class="rounded-3" src="${path}/resources/image/pCamp7.jpg" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-5 col-sm-4"><img class="rounded-3" src="${path}/resources/image/pCamp8.jpg" alt="Agent picture"></div>
                            <div class="col-xl-4 col-md-7 col-sm-8 px-4 px-sm-3 px-md-0 ms-md-n4 mt-n5 mt-sm-0 py-3">
                                <div class="card border-0 shadow-sm ms-sm-n5">
                                    <blockquote class="blockquote card-body">
                                        <h4 style="max-width: 22rem;">&quot;I will select the best accommodation for you&quot;</h4>
                                        <p class="d-sm-none d-lg-block">Amet libero morbi venenatis ut est. Iaculis leo ultricies nunc id ante adipiscing. Vel metus odio at faucibus ac. Neque id placerat et id ut. Scelerisque eu mi ullamcorper sit urna. Est volutpat dignissim nec.</p>
                                        <footer class="d-flex justify-content-between">
                                            <div class="pe-3">
                                                <a class="text-decoration-none" href="real-estate-vendor-properties.html">
                                                    <h6 class="mb-0">Floyd Miles</h6>
                                                    <div class="text-muted fw-normal fs-sm mb-3">Imperial Property Group Agent</div>
                                                </a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2"
                                                    onclick="return flase;"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" onclick="return flase;"><i class="fi-linkedin"></i></a></div>
                                            <div><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                                <div class="text-muted fs-sm mt-1">45 reviews</div>
                                            </div>
                                        </footer>
                                    </blockquote>
                                </div>
                                <div>
                                    <button class="btn btn-primary d-block mb-4" style="position: absolute; bottom: -22px; right: 50px; " type="submit">&nbsp&nbsp<i class="fi-checkbox-checked-alt me-2"></i>캠핑장 상세보기&nbsp&nbsp&nbsp&nbsp</button>
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
                    <div class="dropdown d-md-none" data-bs-toggle="select">
                        <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"><span class="dropdown-toggle-label">Houses</span></button>
                        <input type="hidden">
                        <div class="dropdown-menu"><a class="dropdown-item" onclick="return flase;"><span class="dropdown-item-label">Apartments</span></a><a class="dropdown-item" onclick="return flase;"><span class="dropdown-item-label">Houses</span></a><a class="dropdown-item" onclick="return flase;"><span class="dropdown-item-label">Rooms</span></a>
                            <a class="dropdown-item" href="#"><span class="dropdown-item-label">Commercial</span></a>
                        </div>
                    </div>

                </div>
                <ul class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0">
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">가평</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm active mb-2 mb-md-0" href="#">태안</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">Rooms</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">Commercial</a></li>
                </ul>

            </div>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden h-100" style="background-image: url(${path}/resources/image/camp2.jpg);"><span class="img-gradient-overlay"></span>
                        <div class="card-body content-overlay pb-0">
                            <div class="d-flex"><span class="badge bg-info fs-sm">글램핑</span></div>
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                                    <h3 class="h5 text-light mb-1">별숲 글램핑</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경남 창녕군 성산면 구연화길 62</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">From $3,850</a>
                                    <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden mb-4" style="background-image: url(${path}/resources/image/campHero5.jpg);"><span class="img-gradient-overlay"></span>
                        <div class="card-body content-overlay pb-0"><span class="badge bg-info fs-sm">글램핑</span><span class="badge bg-success fs-sm me-2">펜션</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                                    <h3 class="h5 text-light mb-1">별빛마루</h3>
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>경북 경주시 천북면 새터흥림길 1-72</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">$200,410</a>
                                    <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-size-cover bg-position-center border-0 overflow-hidden" style="background-image: url(${path}/resources/image/camp1.jpg);"><span class="img-gradient-overlay"></span>
                        <div class="card-body content-overlay pb-0"><span class="badge bg-info fs-sm">New</span></div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="real-estate-single-v1.html">
                                    <h3 class="h5 text-light mb-1">Country House</h3>Top real estate agents
                                    <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>6954 Grand AveMaspeth, NY 11378</div>
                                </a>
                                <div class="btn-group ms-n2 ms-sm-0 mt-3"><a class="btn btn-primary px-3" href="real-estate-single-v1.html" style="height: 2.75rem;">$162,000</a>
                                    <button class="btn btn-primary btn-icon border-end-0 border-top-0 border-bottom-0 border-light fs-sm" type="button"><i class="fi-heart"></i></button>
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
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4 " data-carousel-options="{&quot;items&quot;: 6, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1242&quot;:{&quot;items&quot;:5},&quot;1498&quot;:{&quot;items&quot;:6}}} ">
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                   <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3 "><span class="d-table badge bg-success mb-1 ">Verified</span><span class="d-table badge bg-info ">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div><img src="${path}/resources/image/shop1.jpg" alt="Image ">
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary ">For rent</h4>
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html ">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted ">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold "><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70 "></i>$1,629</div>
                            </div>
                        </div>
                    </div>
                    <!--  @@@@@@ 아이템끝-->
                    


                </div>
            </div>
        </section>
    </main>
	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
    <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js "></script>
    <script src="${path}/resources/vendor/rellax/rellax.min.js "></script>
	<script src="${path}/resources/js/theme.min.js "></script>
	
    <!-- Main theme script-->
    
    


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>