<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공원 메인" name="title"/>
</jsp:include>

<style>
    .weather_area {
        position: relative;
        text-align: center;
        overflow: hidden;
        z-index: 5
    }
    
    .weather_area .weather_now {
        position: relative;
        overflow: hidden;
        font-size: 0;
        line-height: 0;
    }
    
    .weather_area .weather_now .summary_img {
        position: relative;
        display: inline-block;
        vertical-align: top;
    }
    
    .ico_animation[class*=ico_animation_wt] {
        -webkit-background-size: 75px 75px;
        background-size: 75px 75px;
    }
    
    .ico_animation {
        width: 75px;
        height: 75px;
        -webkit-background-size: 525px 450px;
        background-size: 525px 450px;
        display: inline-block;
        vertical-align: top;
    }
    
    .ico_animation_wt6 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt6.svg);
    }
    
    .weather_area .weather_now .current {
        display: inline-block;
        vertical-align: top;
        margin-left: -26px;
        font-size: 60px;
        line-height: 75px;
        letter-spacing: -1.85px;
        color: #000;
        font-weight: 700;
        white-space: nowrap;
        z-index: 10;
    }
    
    .blind {
        overflow: hidden;
        position: absolute;
        clip: rect(0 0 0 0);
        width: 1px;
        height: 1px;
        margin: -1px;
    }
    
    .weather_area .weather_now .degree {
        display: inline-block;
        vertical-align: top;
        margin-top: 6px;
        font-size: 30px;
        font-weight: 700;
        line-height: 35px;
        letter-spacing: -.82px;
    }
    
    .weather_area .weather_now .summary {
        display: inline-block;
        vertical-align: top;
        margin: 15px 0 0 5px;
        font-size: 16px;
        font-weight: 700;
        line-height: 21px;
        letter-spacing: -1px;
        color: #222;
        text-align: left;
    }
    
    .weather_area .weather_now .summary .weather {
        display: block;
        margin-bottom: 3px;
        font-size: 22px;
        line-height: 25px;
        letter-spacing: -1px;
    }
    
    em {
        font-style: normal;
    }
    
    .weather_area .weather_now .summary .temperature {
        display: inline-block;
        font-size: 18px;
        line-height: 21px;
        letter-spacing: -1px;
        vertical-align: top;
    }
    
    .weather_area .weather_now .summary .temperature.down:after {
        display: inline-block;
    }
    
    .weather_area .weather_now .summary .temperature:after {
        background-position: -34px -840px;
        background-repeat: no-repeat;
        width: 8px;
        height: 16px;
        margin: 3px 0 0 -2px;
        vertical-align: top;
        content: '';
    }
    
    .weather_area .weather_now .summary .temperature:after {
        background-image: url(https://ssl.pstatic.net/static/weather/image/sp_weather_1746dae0.png);
        background-size: 965px 883px;
    }
</style>

        <!-- @@@@@@ Hero 시작 @@@@@@ -->
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-50" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/parkHero.jpg);"></div>
            <div class="content-overlay container py-md-5">
                <div class="mt-5 mb-md-5 py-5">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0">
                        <h1 class="display-5 text-white" style="margin-bottom: 90px;">공원</h1>
                    </div>
                    <div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-0">
                        <!-- @@@@@@ 검색창 시작 @@@@@@-->

                        <form class="form-group d-block">
                            <div class="row g-0">
                                <div class="col-md-10 d-sm-flex align-items-center">
                                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                        <input class="form-control" type="text" placeholder="공원명을 검색하세요">
                                    </div>
                                    <hr class="d-sm-none my-2">
                                    <div class="dropdown w-sm-50 border-end-sm" data-bs-toggle="select">
                                        <button class="btn btn-lg btn-link dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-home me-2"></i><span class="dropdown-toggle-label">전체/도</span></button>
                                        <input type="hidden">
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
                                        <input type="hidden">
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">근린공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">체육공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">어린이공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">역사공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">소공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">문화공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">수변공원</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <hr class="d-md-none mt-2">
                                <div class="col-md-2 d-sm-flex align-items-center pt-3 pt-md-0">
                                    <button class="btn btn-lg btn-icon btn-primary px-3 w-100" type="button">공원 검색</button>
                                </div>
                            </div>
                        </form>
                        <!-- @@@@@@ 검색창 끝 @@@@@@-->
                    </div>
                </div>
            </div>
            <div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
        </section>
        <!-- @@@@@@ Hero 끝 @@@@@@ -->


        <!-- @@@@@@ 인기공원 시작 @@@@@@-->
        <section class="container mt-n3 mt-md-0 mb-5 pb-3 pb-lg-4">
            <div class="d-flex align-items-end justify-content-between mb-1 pb-md-2">
                <div class="d-flex align-items-end justify-content-between">
                    <h2 class="h3 mb-0">인기&nbsp; </h2>
                    <h2 class="h3 mb-0" style="color:#687519">공원</h2>
                    <hr style="width: 1100px; margin-left: 30px; margin-bottom: 15px; border: 1px; color: rgb(181, 180, 180);">
                </div>

            </div>

            <!-- Carousel-->
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;mode&quot;: &quot;gallery&quot;, &quot;speed&quot;: 800, &quot;nav&quot;: false, &quot;controlsContainer&quot;: &quot;#carousel-controls-lp&quot;}">
                    <!-- @@@ 인기 공원 1 @@@-->
                    <div>
                        <div class="row">
                            <div class="col-lg-8 col-md-7 mb-md-0 mb-3">
                                <div class="position-relative pe-lg-5">
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"><span class="badge bg-primary fs-sm me-2">Hot</span><span class="badge bg-success fs-sm me-2">Verified</span></div><img class="rounded-3 zindex-5" src="${path}/resources/image/famousPark3.webp" alt="Article image">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-5"><span class="d-inline-block fs-sm text-uppercase text-primary mb-2 from-top">For sale</span>
                                <div class="from-start delay-2">
                                    <h3 class="h4 mb-2">공원명</h3>
                                    <p class="mb-md-4 mb-3 fs-sm">공원 주소</p>
                                    <p class="mb-4 pb-md-2" style="height:200px;">공원 설명</p>
                                </div>
                                <div style="margin-bottom:10px;">
                                    <p>현재 공원의 날씨는?</p>
                                    <div class="weather_area m-0 p-0">
                                        <div class="weather_now m-0 p-0">
                                            <div class="summary_img m-0 p-0">
                                                <i class="ico_animation _cnLazy ico_animation_wt6" data-ico="ico_animation_wt6" data-ymdt="2022092623"></i>
                                                <strong class="current">
                                                <span class="blind">현재 온도</span>14.1<span class="degree">°</span>
                                            </strong>
                                            </div>
                                            <p class="summary p-0">
                                                <span class="weather">구름많음</span>
                                                <em>어제보다</em> <span class="temperature down">0.4° <span class="blind">낮아요</span></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist"><a class="btn" href="real-estate-single-v2.html" style="background-color: #424B0D; color:#ffffff;">공원 상세로 이동하기</a>
                                    <button class="btn border-start border-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist" style="background-color: #424B0D; color:#ffffff;"><i class="fi-heart fs-5"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- @@@ 인기 공원 2 @@@-->
                    <div>
                        <div class="row">
                            <div class="col-lg-8 col-md-7 mb-md-0 mb-3">
                                <div class="position-relative pe-lg-5">
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"><span class="badge bg-primary fs-sm me-2">Hot</span><span class="badge bg-success fs-sm me-2">Verified</span></div><img class="rounded-3 zindex-5" src="${path}/resources/image/parkImg/famousPark1.webp" alt="Article image">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-5"><span class="d-inline-block fs-sm text-uppercase text-primary mb-2 from-top">For sale</span>
                                <div class="from-start delay-2">
                                    <h3 class="h4 mb-2">공원명</h3>
                                    <p class="mb-md-4 mb-3 fs-sm">공원 주소</p>
                                    <p class="mb-4 pb-md-2" style="height:200px;">공원 설명</p>
                                </div>
                                <div style="margin-bottom:10px;">
                                    <p>현재 공원의 날씨는?</p>
                                    <div class="weather_area m-0 p-0">
                                        <div class="weather_now m-0 p-0">
                                            <div class="summary_img m-0 p-0">
                                                <i class="ico_animation _cnLazy ico_animation_wt6" data-ico="ico_animation_wt6" data-ymdt="2022092623"></i>
                                                <strong class="current">
                                                <span class="blind">현재 온도</span>14.1<span class="degree">°</span>
                                            </strong>
                                            </div>
                                            <p class="summary p-0">
                                                <span class="weather">구름많음</span>
                                                <em>어제보다</em> <span class="temperature down">0.4° <span class="blind">낮아요</span></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist"><a class="btn" href="real-estate-single-v2.html" style="background-color: #424B0D; color:#ffffff;">공원 상세로 이동하기</a>
                                    <button class="btn border-start border-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist" style="background-color: #424B0D; color:#ffffff;"><i class="fi-heart fs-5"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carousel custom controls-->
            <div class="tns-carousel-controls pt-2 mt-4" id="carousel-controls-lp">
                <button class="me-3" type="button"><i class="fi-chevron-left fs-xs"></i></button>
                <button type="button"><i class="fi-chevron-right fs-xs"></i></button>
            </div>
        </section>
        <!-- @@@@@@ 인기공원 끝 @@@@@@-->




        <!--@@@@@@@@@@ 공원 미리보기 시작 @@@@@@@@@@-->
        <section class="container mb-sm-4 mb-3 pb-lg-4">
            <div class="d-flex align-items-end justify-content-between mb-1 pb-md-2">
                <div class="d-flex align-items-end justify-content-between">
                    <h2 class="h3 mb-0" style="color:#687519">공원&nbsp;</h2>
                    <h2 class="h3 mb-0">둘러보기</h2>
                </div><a class="btn btn-link fw-normal ms-2 p-0" href="real-estate-catalog-sale.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <!-- No image-->
            <div class="card border-0 shadow-sm">
                <div class="card-header p-0 b-0" style="border:0; text-align:center;">
                    <ul class="nav nav-tabs p-0 m-0 b-0" role="tablist">
                        <li class="col m-0" style="border-radius:0;"><a class="nav-link pb-1 active" href="#neighbor" data-bs-toggle="tab" role="tab" aria-controls="neighbor" aria-selected="true" style="border-radius:0;">근린공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#pe" data-bs-toggle="tab" role="tab" aria-controls="pe" aria-selected="false" style="border-radius:0;">체육공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#kids" data-bs-toggle="tab" role="tab" aria-controls="kids" aria-selected="false" style="border-radius:0;">어린이공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#history" data-bs-toggle="tab" role="tab" aria-controls="history" aria-selected="false" style="border-radius:0;">역사공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#small" data-bs-toggle="tab" role="tab" aria-controls="small" aria-selected="false" style="border-radius:0;">소공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#culture" data-bs-toggle="tab" role="tab" aria-controls="culture" aria-selected="false" style="border-radius:0;">문화공원</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#water" data-bs-toggle="tab" role="tab" aria-controls="water" aria-selected="false" style="border-radius:0;">수변공원</a></li>
                    </ul>
                </div>
                <div class="card-body py-4" style="background-image: url(${path}/resources/image/parkbg4.png); background-size: cover;">
                    <div class="tab-content">
                        <div class="tab-pane fade row active show" id="neighbor" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">근린공원</P>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/neighbor3.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/neighbor4.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>

                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="pe" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                    <div class="card-body" style="text-align: center; ">
                                        <P style="color:#2841b1; font-size: 20pt;">체육공원</P>
                                    </div>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/pe1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/pe2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>




                        <div class="tab-pane fade row" id="kids" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">어린이공원</P>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/kids1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/kids2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="history" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">역사공원</P>
                                </div>
                            </div>

                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/history1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/history2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="small" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">소공원</P>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/small1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/small2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="culture" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">문화공원</P>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/culture1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/culture2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="water" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <P style="color:#2841b1; font-size: 20pt;">수변공원</P>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/water1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" style="text-align: center; cursor:pointer; width:500px; height:270px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:500px; height:270px;" src="${path}/resources/image/water2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">여의도 한강공원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--@@@@@@@@@@ 공원 미리보기 끝 @@@@@@@@@@-->


        <!--@@@@@@@@@@ 포토갤러리 시작 @@@@@@@@@@-->
        <section class="container mb-5 pb-2">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="h3 mb-0">포토갤러리</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 py-md-4 py-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/img/real-estate/city/new-york.jpg" alt="New York">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">내용</h3>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!--@@@@@@@@@@ 포토갤러리 끝 @@@@@@@@@@-->

		
		<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
        <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
        <script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js"></script>
        <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
        <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js"></script>
        <!-- Main theme script-->
        <script src="${path}/resources/js/theme.min.js"></script>
        
        
        
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


        
        
        
        
        
        