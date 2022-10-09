<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!-- Vendor Styles-->
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="축제 메인" name="title"/>
</jsp:include>
        <!-- @@@@@@ Hero 시작 @@@@@@-->
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-50" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/festivalHero4.png);"></div>
            <div class="content-overlay container py-md-5" style="margin-top: 150px;">
                <div class="mt-5 mb-md-5 py-5 ">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0" style="width: 1000px; height: 0px;">
                        <h1 class="display-5 text-white" style="margin-bottom: 50px;">Festival</h1>
                    	<!-- @@@@@@ 검색창 시작 @@@@@@-->
                    	<form class="form-group d-block" name="festivalSearchFrm" method="get" action="${path}/festival/festivalSearch">
                        	<div class="row g-0">
                            	<div class="col-md-10 d-sm-flex align-items-center">
                                	<div class="input-group">
                                    	<span class="input-group-text">
                                    		<i class="fi-calendar"></i>
                                    	</span>
                                    	<input class="form-control date-picker date-range" type="date" name="startdate" placeholder="From date" data-datepicker-options='{"altInput": true, "altFormat": "F j, Y", "dateFormat": "Y-m-d"}' data-linked-input="#end-date">
                                    	<input class="form-control date-picker" type="date" name="enddate" placeholder="To date" data-datepicker-options='{"altInput": true, "altFormat": "F j, Y", "dateFormat": "Y-m-d"}' id="end-date">
                                	</div>
                                	<div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                    	<input class="form-control" name="keyword" type="text" placeholder="공원명을 검색하세요">
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
                            	</div>
                            	<hr class="d-md-none mt-2">
                            	<div class="col-md-2 d-sm-flex align-items-center pt-3 pt-md-0">
                                	<input class="btn btn-lg btn-icon btn-primary px-3 w-100" type="submit" value="검색"/>
                            	</div>
                        	</div>
                    	</form>
                    <!-- @@@@@@ 검색창 끝 @@@@@@-->
                	</div>
               </div>
            </div>
        </section>
        <!-- @@@@@@ Hero 끝 @@@@@@-->
        <!-- @@@@@@ 전국 방방곡곡 시작 @@@@@@-->
        <section class="container pt-5">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <div>
                    <h2 class="h3 mb-sm-0 " style="display:inline; color: #FD5D08; ">전국 방방곡곡 </h2>
                    <h2 class="h3 mb-sm-0 " style=display:inline;>축제 모아보기</h2>
                </div>
            </div>
        </section>
        <section class="container-fluid mb-5 " style="max-width: 2200px; ">
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2 ">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4 " data-carousel-options="{&quot;items&quot;: 6, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1242&quot;:{&quot;items&quot;:5},&quot;1498&quot;:{&quot;items&quot;:6}}} ">
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster6.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">부산 낙동강 유채꽃 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster7.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base ">
                                    <a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">재즈 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster8.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">보름달 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster9.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">우면산 별밤 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster10.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">자연산 전어/꽃게 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster1.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">부산 낙동강 유채꽃 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster2.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base ">
                                    <a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">재즈 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster3.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">보름달 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster4.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">우면산 별밤 축제</a></h3>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div style="width:250px; ">
                        <div class="card shadow-sm card-hover border-0 h-100 ">
                            <div class="card-img-top card-img-hover " style="width:226px; height:320px; background-image: url(${path}/resources/image/festivalPoster5.jpg); background-size: cover; ">
                                <a class="img-overlay " href="real-estate-single-v1.html "></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3 ">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Wishlist "><i class="fi-heart "></i></button>
                                </div>
                            </div>
                            <div class="card-body position-relative pb-3 ">
                                <h3 class="h6 mb-2 fs-base "><a class="nav-link stretched-link " href="real-estate-single-v1.html " style="text-align: center; ">자연산 전어/꽃게 축제</a></h3>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- @@@@@@ 전국 방방곡곡 끝 @@@@@@-->

        <!-- Post vacancy CTA-->
        <section class="container mb-4">
            <div>
                <h2 class="h3 mb-sm-0" style=display:inline;>이달의</h2>
                <h2 class="h3 mb-sm-0" style="display:inline; color: #F7B202;">추천</h2>
                <h6 class="h6 mb-sm-0" style=display:inline;>부천이 축제를 소개합니다!</h6>
            </div>
        </section>
        <!-- <section class="container-fluid mb-5 mt-n3 mt-lg-0 pt-3" style="background: #e4dabe; height:350px;"> -->
        <section class="container mb-5 mt-n3 mt-lg-0 pt-3" style="background-image: url(${path}/resources/image/festival3_1.jpg); background-size: cover; background-position: center; height:350px;">
            <section class="container mb-5 pb-2">
                <div class="row align-items-center">
                    <div class="col-md-6 col-lg-6 pt-4 pt-md-0 pe-4"><img class="d-block me-md-0 mt-4" src="${path}/resources/image/festival3.jpg" alt="Illustration" style="width:500px; height:350px;"></div>
                    <div class="col-md-6 col-lg-6 text-center text-md-start">
                        <h2 class="mb-md-4 text-light">연천 코스모스 축제 & 메밀꽃축제</h2>
                        <p class="fs-lg p-2 pb-md-3 text-light">가을풍경으로 물든 연천 들판! 연천 코스모스 축제 & 메밀꽃 축제 속으로<br> 경기도 연천군 연천읍 차탄리 129-4</p><a class="btn btn-primary btn-lg rounded-pill ms-sm-auto" href="job-board-post-resume-1.html">축제 둘러보기<i class="fi-chevron-right fs-sm ms-2"></i></a>
                    </div>
                </div>
            </section>

        </section>


        <!-- @@@@@@ 함께,축제 시작 @@@@@@-->
        <section class="container mb-sm-5 mb-4 pb-lg-4" style="margin-top:120px;">
            <div class="d-sm-flex align-items-center justify-content-between mb-4 pb-2">
                <div>
                    <h2 class="h3 mb-sm-0" style="display:inline; color: #F7B202;">함께</h2>
                    <h2 class="h3 mb-sm-0" style=display:inline;>, 축제</h2>
                    <h6 class="h6 mb-sm-0" style=display:inline;>행복한 순간 여기, 우리</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div style="margin-top:140px;">
                        <h2 class="mb-0">사랑하는 사람과</h2>
                        <h2>함께하는 축제</h2>
                        <h6 class="mb-0" style="margin-left:20px;">사랑하는 <span style="color:rgb(99, 138, 247);">가족</span>과,</h6>
                        <h6 class="mb-0" style="text-align:center;"><span style="color:rgb(250, 109, 93);">연인</span>과,</h6>
                        <h6 class="mb-0" style="margin-left:150px;"><span style="color:rgb(56, 113, 38);">친구</span>와 함께</h6>
                    </div>
                </div>
                <div class="col-9 px-4 py-5 " style="background-color: #f4f3f9; ">
                    <div class="tns-carousel-wrapper tns-controls-xxl tns-nav-outside ">
                        <div class="tns-carousel-inner " data-carousel-options="{&quot;items&quot;: 3, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1400&quot;:{&quot;items&quot;:3,&quot;nav&quot;:false}}} ">
                            <!-- Item-->
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5 " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Favorites
                        "><i class="fi-heart "></i></button>
                                        <img class="rounded-3 " src="${path}/resources/image/01.jpg " alt="Image " style="width:300px; height:300px; ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="city-guide-single.html ">Berlin Business Hotel</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>5.0</b><span class="text-muted ">&nbsp;(48)</span></li>
                                        <li class="list-inline-item pe-1 "><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>$$</li>
                                        <li class="list-inline-item pe-1 "><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle "></i>1.4 km from center</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5 " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Favorites
                        "><i class="fi-heart "></i></button>
                                        <img class="rounded-3 " src="${path}/resources/image/01.jpg " alt="Image " style="width:300px; height:300px; ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="city-guide-single.html ">Big Tree Cottage</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.8</b><span class="text-muted ">&nbsp;(24)</span></li>
                                        <li class="list-inline-item pe-1 "><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>$$$</li>
                                        <li class="list-inline-item pe-1 "><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle "></i>0.5 km from center</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5 " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Favorites
                        "><i class="fi-heart "></i></button>
                                        <img class="rounded-3 " src="${path}/resources/image/01.jpg " alt="Image " style="width:300px; height:300px; ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="city-guide-single.html ">Grand Resort &amp; Spa</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.9</b><span class="text-muted ">&nbsp;(43)</span></li>
                                        <li class="list-inline-item pe-1 "><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>$$$</li>
                                        <li class="list-inline-item pe-1 "><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle "></i>1.8 km from center</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5 " type="button " data-bs-toggle="tooltip " data-bs-placement="left " title="Add to Favorites
                        "><i class="fi-heart "></i></button>
                                        <img class="rounded-3 " src="${path}/resources/image/01.jpg " alt="Image " style="width:300px; height:300px; ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="city-guide-single.html ">Merry Berry Motel</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.5</b><span class="text-muted ">&nbsp;(13)</span></li>
                                        <li class="list-inline-item pe-1 "><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>$$</li>
                                        <li class="list-inline-item pe-1 "><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle "></i>0.4 km from center</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- @@@@@@ 함께,축제 끝 @@@@@@-->
        
        <!-- Vendor scrits: js libraries and plugins-->
        <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
        <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
        <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
        <script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js "></script>
        <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
        <!-- Main theme script-->
        <script src="${path}/resources/js/theme.min.js "></script>
        
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        