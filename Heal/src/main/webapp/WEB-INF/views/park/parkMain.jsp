<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" href="${path}/resources/css/themeButton.min.css">
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
    
            <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
    
    .ico_animation_wt1 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt1.svg);
    }
    
    .ico_animation_wt5 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt5.svg);
    }
    
    .ico_animation_wt7 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt7.svg);
    }
    
    .ico_animation_wt8 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt8.svg);
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
    
    .weather_area .weather_now .summary .lowtem {
        display: inline-block;
        vertical-align: top;
        margin: 0 5px 0 5px;
        font-size: 16px;
        font-weight: 700;
        line-height: 21px;
        letter-spacing: -1px;
        color: rgb(2, 68, 250);
        text-align: left;
    }
    
    .weather_area .weather_now .summary .hightem {
        display: inline-block;
        vertical-align: top;
        margin: 0 0 0 5px;
        font-size: 16px;
        font-weight: 700;
        line-height: 21px;
        letter-spacing: -1px;
        color: rgb(218, 4, 4);
        text-align: left;
    }
    
    .weather_area .weather_now .summary .weather {
        display: block;
        margin-bottom: 3px;
        font-size: 23px;
        line-height: 25px;
        letter-spacing: -1px;
    }
    
    .weather_area .secondary {
        color: rgb(99, 98, 98);
        font-weight: 600;
    }
    
    .weather_area .secondaryInfo {
        color: rgb(66, 66, 66);
        font-weight: 700;
        margin-right: 10px;
    }
    
    .weather_area .weather_now .summary .temperature {
        display: inline-block;
        font-size: 18px;
        line-height: 21px;
        letter-spacing: -1px;
        vertical-align: top;
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
    
    .btn-group-sm .on {
    	background-color: black;
    	color: white;
    }
    .btn-group-sm .on:active {
    	background-color: black;
    	color: white;
    }
     .btn-group-sm>button:hover {
    	background-color: black;
    	color: white;
    }
</style>

        <!-- @@@@@@ Hero 시작 @@@@@@ -->
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-50" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/parkHero.jpg);"></div>
            <div class="content-overlay container py-md-5">
                <div class="mt-5 mb-md-5 py-5">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0">
                        <h1 class="display-1 text-white" style="margin-bottom: 90px;">공원</h1>
                    </div>
                    <div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-0">
                        <!-- @@@@@@ 검색창 시작 @@@@@@-->

                        <form class="form-group d-block" action="${path}/park/parkList" method="GET">
                            <div class="row g-0">
                                <div class="col-md-10 d-sm-flex align-items-center">
                                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                        <input class="form-control" type="text" name="keyword" placeholder="공원명을 검색하세요">
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
                                        <input type="hidden" name="category">
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">근린공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">체육공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">어린이공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">역사공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">소공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">문화공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">수변공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">도시자연공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">마을마당</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">묘지공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">주제공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">마을숲</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">도시농업공원</span></a></li>
                                            <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">기타</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <hr class="d-md-none mt-2">
                                <div class="col-md-2 d-sm-flex align-items-center pt-3 pt-md-0">
                                    <button class="btn btn-lg btn-icon btn-primary px-3 w-100" type="submit">검색</button>
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
        <section class="container mt-4 mb-5 pb-3 pb-lg-4">
            <div class="d-flex align-items-end justify-content-between mb-1 pb-md-2">
                <div class="d-flex align-items-end justify-content-between">
                    <h2 class=" mb-0">인기&nbsp; </h2>
                    <h2 class=" mb-0" style="color:#687519">공원</h2>
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
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"><span class="badge bg-primary fs-sm me-2">Hot</span><span class="badge bg-success fs-sm me-2">문화명소</span></div><img class="rounded-3 zindex-5" src="${path}/resources/image/famousPark3.webp" alt="Article image">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-5"><span class="d-inline-block fs-sm text-uppercase text-primary mb-2 from-top">이달의 인기공원</span>
                                <div class="from-start delay-2">
                                    <h3 class="h4 mb-2">${famousPark1.name}</h3>
                                    <p class="mb-md-4 mb-3 fs-md">${famousPark1.addr}<br>${famousPark1.phone}</p>
                                    <p class="mb-4 pb-md-2" style="height:200px;">올림픽공원은 문화 예술과 생활 체육, 환경 생태, 역사 체험 구역으로 구성되어 있습니다. 올림픽을 위한 공원답게 테니스장, 펜싱, 체조, 역도, 수영장 등의 경기장이 마련되어 있습니다. 특히, 공원 안에 유명 조각가의 작품을 비롯한 조각 미술품들이 210여 점 정도 설치되어 있어 세계 5대 조각 공원으로 손꼽힐 정도입니다. 미술관, 역사관과 같은 여러 문화 시설이 함께 조성되어 있으니 다양한 문화생활을 즐겨보세요!<br></p>
                                </div>
                                <div style="margin-bottom:30px;">
	                                <p id="weaStr" style="float: left; color: black; font-weight:600;">현재 공원의 날씨는?</p>
	                               	<div style="margin-left: 265px;width: 150px;text-align: center;">
	                               		<div class="btn-group btn-group-sm" role="group" style="width:150px;">
	                               			<button class="btn btn-outline-secondary on" id="today" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">오늘</button>
	                               			<button class="btn btn-outline-secondary" id="one" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">내일</button>
	                               			<button class="btn btn-outline-secondary" id="two" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">모레</button>
	                               		</div>
	                               	</div>
                                </div>
                    <div class="weather_area mb-4 p-0">
                                        <div class="weather_now m-0 p-0">
                                            <div class="summary_img m-0 p-0">
                                            	<c:set var="rainStr" value="${today.pcp}"/>
                                            
                                                <c:if test="${fn:contains(rainStr, 'mm')}"> <!-- 비올때 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt8" data-ico="ico_animation_wt8" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt1" data-ico="ico_animation_wt1" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today.sky <= 8}"> <!-- 구름많음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt5" data-ico="ico_animation_wt5" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <strong class="current">
                                                <span class="blind">현재 온도</span>${today.tmp}<span class="degree">°</span>
                                            </strong>
                                            </div>
                                            <p class="summary p-0">
                                                <span class="weather">
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 -->
                                                	&nbsp&nbsp맑음
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today.sky <= 8}"> <!-- 구름많음 -->
                                                	구름많음
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 -->
                                                	&nbsp&nbsp흐림
                                                </c:if>
                                                </span>
                                                <span class="lowtem">${today.tmn}</span>/<span class="hightem">${today.tmx}</span>
                                            </p>
                                        </div>
                                        <div>
                                            <span class="secondary">습도 </span><span class="secondaryInfo">${today.reh}%</span>
                                            <span class="secondary">강수확률 </span><span class="secondaryInfo">${today.pop}%</span>
                                            <span class="secondary">강수량 </span><span class="secondaryInfo">${today.pcp}</span>
                                        </div>
                                    </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist" style="margin-left: 40px"><a class="btn" href="${path}/park/parkDetail?no=36228" style="background-color: #424B0D; color:#ffffff;">공원 상세로 이동하기</a>
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
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"><span class="badge bg-primary fs-sm me-2">Hot</span><span class="badge bg-success fs-sm me-2">야경명소</span></div><img class="rounded-3 zindex-5" src="${path}/resources/image/famousPark2.png" alt="Article image">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-5"><span class="d-inline-block fs-sm text-uppercase text-primary mb-2 from-top">이달의 인기공원</span>
                                <div class="from-start delay-2">
                                   <h3 class="h4 mb-2">${famousPark2.name}</h3>
                                    <p class="mb-md-4 mb-3 fs-md">${famousPark2.addr}<br>${famousPark2.phone}</p>
                                    <p class="mb-4 pb-md-2" style="height:200px;">낙산공원은 대학로부터 동대문까지 이어져 있어 역사와 문화를 함께 즐길 수 있는 공원입니다. 아름답기로 유명한 서울의 야경을 볼 수 있는 명소로 꼽히기도 합니다. 동대문에서 올라가는 코스는 서울 성곽을 따라 도심 속 숲길을 거닐 수 있습니다. 구불구불하게 이어진 성곽길은 낙산공원만의 독특한 특징입니다. 잠시 생각을 비우고 이 길을 따라 걸으며 지친 몸과 마음을 힐링해 보는 건 어떨까요?<br></p>
                                </div>
                                <div style="margin-bottom:30px;">
	                                <p id="weaStr" style="float: left; color: black; font-weight:600;">현재 공원의 날씨는?</p>
	                               	<div style="margin-left: 265px;width: 150px;text-align: center;">
	                               		<div class="btn-group btn-group-sm" role="group" style="width:150px;">
	                               			<button class="btn btn-outline-secondary on" id="today" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">오늘</button>
	                               			<button class="btn btn-outline-secondary" id="one" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">내일</button>
	                               			<button class="btn btn-outline-secondary" id="two" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">모레</button>
	                               		</div>
	                               	</div>
                                </div>
                    <div class="weather_area mb-4 p-0">
                                        <div class="weather_now m-0 p-0">
                                            <div class="summary_img m-0 p-0">
                                            	<c:set var="rainStr" value="${today.pcp}"/>
                                            
                                                <c:if test="${fn:contains(rainStr, 'mm')}"> <!-- 비올때 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt8" data-ico="ico_animation_wt8" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt1" data-ico="ico_animation_wt1" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today2.sky <= 8}"> <!-- 구름많음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt5" data-ico="ico_animation_wt5" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <strong class="current">
                                                <span class="blind">현재 온도</span>${today.tmp}<span class="degree">°</span>
                                            </strong>
                                            </div>
                                            <p class="summary p-0">
                                                <span class="weather">
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 -->
                                                	&nbsp&nbsp맑음
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today.sky <= 8}"> <!-- 구름많음 -->
                                                	구름많음
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 -->
                                                	&nbsp&nbsp흐림
                                                </c:if>
                                                </span>
                                                <span class="lowtem">${today.tmn}</span>/<span class="hightem">${today.tmx}</span>
                                            </p>
                                        </div>
                                        <div>
                                            <span class="secondary">습도 </span><span class="secondaryInfo">${today.reh}%</span>
                                            <span class="secondary">강수확률 </span><span class="secondaryInfo">${today.pop}%</span>
                                            <span class="secondary">강수량 </span><span class="secondaryInfo">${today.pcp}</span>
                                        </div>
                                    </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist" style="margin-left: 40px"><a class="btn" href="${path}/park/parkDetail?no=53216" style="background-color: #424B0D; color:#ffffff;">공원 상세로 이동하기</a>
                                    <button class="btn border-start border-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist" style="background-color: #424B0D; color:#ffffff;"><i class="fi-heart fs-5"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carousel custom controls-->
            <div class="tns-carousel-controls pt-0 mt-0" id="carousel-controls-lp">
                <button class="me-3" type="button"><i class="fi-chevron-left fs-xs"></i></button>
                <button type="button"><i class="fi-chevron-right fs-xs"></i></button>
            </div>
        </section>
        
        <script>
        	$(document).ready(function() {
        		$('.btn-group-sm').find('button').click(function() {
        			var on_id = $(this).attr('id');
        			
        			$('.btn-group-sm button').removeClass('on');
        			
        			$("#" + on_id).addClass('on'); // 클릭한 클래스에 on 추가
        			
        			var i = -1;
        			
        			var sky = 100;
	        		var tmp = 100;
	        		var tmn = 100;
	        		var tmx = 100;
	        		var reh = 100;
	        		var pop = 100;
	        		var pcp = "";
	        			
	        		if(on_id == 'today') {      
		        		sky = ${today.sky};   
		        		tmp = ${today.tmp};   
		        		tmn = ${today.tmn};   
		        		tmx = ${today.tmx};   
		        		reh = ${today.reh};   
		        		pop = ${today.pop};   
		        		pcp = '${today.pcp}';   
        				$('#weaStr').html('현재 공원의 날씨는?')
        			} 
					if(on_id == 'one') {
						sky = ${one.sky};   
		        		tmp = ${one.tmp};   
		        		tmn = ${one.tmn};   
		        		tmx = ${one.tmx};   
		        		reh = ${one.reh};   
		        		pop = ${one.pop};   
		        		pcp = '${today.pcp}';  
					    $('#weaStr').html('내일 공원의 날씨는?')
					} 
					if(on_id == 'two') {
						sky = ${two.sky};   
		        		tmp = ${two.tmp};   
		        		tmn = ${two.tmn};   
		        		tmx = ${two.tmx};   
		        		reh = ${two.reh};   
		        		pop = ${two.pop};   
		        		pcp = '${today.pcp}';  
						$('#weaStr').html('모레 공원의 날씨는?')
					} 
					
					var one = '${weaList.get(i).sky}'
					console.log(one)
					str = "";
					
					str += '	 <div class="weather_now m-0 p-0">                                                                                            '
	                str += '     <div class="summary_img m-0 p-0">                                                                                            '
	                
	                if(pcp != '강수없음') {
	                	str += '<i class="ico_animation _cnLazy ico_animation_wt8" data-ico="ico_animation_wt8" data-ymdt="2022092623"></i>           '
	                } else if(sky <= 5) {
		            	str += '<i class="ico_animation _cnLazy ico_animation_wt1" data-ico="ico_animation_wt1" data-ymdt="2022092623"></i>           '
			        } else if(sky > 5 && sky <= 8) {
						str += '<i class="ico_animation _cnLazy ico_animation_wt5" data-ico="ico_animation_wt5" data-ymdt="2022092623"></i>           '
			        } else if(sky > 8) {
						str += '<i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022092623"></i>           '
					}
	                
	                str += '         <strong class="current">                                                                                                 '
	                str += '         <span class="blind">현재 온도</span>'+ tmp +'<span class="degree">°</span>                                   '
	                str += '     </strong>                                                                                                                    '
	                str += '     </div>                                                                                                                       '
	                str += '     <p class="summary p-0">                                                                                                      '
	                str += '         <span class="weather">                                                                                                   '
	                
	                if(sky <= 5) {
	                	str += '&nbsp&nbsp맑음';
	                } else if(sky > 5 && sky <= 8) {
	                	str += '구름많음'
	                } else if(sky > 8) {
						str += '&nbsp&nbsp흐림'
					}
					
	                str += '         </span>                                                                                                                  '
	                str += '         <span class="lowtem">'+ tmn +'</span>/<span class="hightem">'+ tmx +'</span>                     '
	                str += '     </p>                                                                                                                         '
	                str += ' </div>                                                                                                                           '
	                str += ' <div>                                                                                                                            '
	                str += '     <span class="secondary">습도 </span><span class="secondaryInfo">'+ reh +'%</span>                                '
	                str += '     <span class="secondary">강수확률 </span><span class="secondaryInfo">'+ pop +'%</span>                            '
	                str += '     <span class="secondary">강수량 </span><span class="secondaryInfo">'+ pcp +'</span>                               '
	                str += ' 		</div>                                                                                                                    '
	             	str += '		</div>                                                                                                                    '
	             	
	             	$('.weather_area').html(str);
        		})
        	})
        </script>
        <!-- @@@@@@ 인기공원 끝 @@@@@@-->




        <!--@@@@@@@@@@ 공원 미리보기 시작 @@@@@@@@@@-->
        <section class="container mb-sm-4 mb-3 pb-lg-4">
            <div class="d-flex align-items-end justify-content-between mb-1 pb-md-2">
                <div class="d-flex align-items-end justify-content-between">
                    <h2 class=" mb-0" style="color:#687519">공원&nbsp;</h2>
                    <h2 class=" mb-0">둘러보기</h2>
                </div><a class="btn btn-link fw-normal ms-2 p-0" href="${path}/park/parkList">더보기<i class="fi-arrow-long-right ms-2"></i></a>
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
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36495'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/neighbor3.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">신송공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36051'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/neighbor4.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">비둘기공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="pe" role="tabpanel">
                                <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                    <div class="card-body" style="text-align: center; ">
                                    </div>
                           		</div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=51259'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/pe1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">율하체육공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=40317'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/pe2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">용담체육공원</p>
                                </div>
                            </div>
                        </div>




                        <div class="tab-pane fade row" id="kids" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36162'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/kids3.jpg">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">해바라기공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36609'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/kids2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">하늘어린이공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="history" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                </div>
                            </div>

                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=35721'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/history1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">화산공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=37862'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/history2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">호국공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="small" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=35990'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/small1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">평산공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36263'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/small2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">송원공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="culture" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=35766'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/culture2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">팔복문화공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=40809'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/culture1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">점말문화공원</p>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade row" id="water" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=36394'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/water1.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">윗맹골공원</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 32rem; border: none; float: left; background:none;">
                                <div class="card-body p-0" OnClick="location.href ='${path}/park/parkDetail?no=38590'" style="text-align: center; cursor:pointer; width:480px; height:280px;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" style="width:480px; height:240px;" src="${path}/resources/image/water2.png">
                                    <p style="font-size:15pt; margin-top:10px; margin-bottom: 10px; font-weight: 800;">가람울공원</p>
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
                <h2 class=" mb-0">포토갤러리</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="${path}/photo/main">더보기<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
					<c:if test="${!empty photoList}">
						<c:forEach var="i" begin="0" end="5">
		                    <!-- Item-->
		                    <div class="col">
		                        <a class="card shadow-sm card-hover border-0" href="${path}/photo/view?no=${photoList.get(i).no}">
		                        	<c:set var="renamefile" value="${photoList.get(i).renamefile}"/>
		                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span>
		                            <c:if test="${fn:contains(renamefile,',')}">
		                            	<c:set var="split" value="${fn:split(renamefile,',')}"/>
                                    	<img src="/resources/upload/image/${split[0]}" style="width:100%; height:265px">
                                    </c:if>
		                            <c:if test="${not fn:contains(renamefile,',')}">
		                            	<img src="/resources/upload/image/${photoList.get(i).renamefile}" style="width:100%; height:265px">
		                            </c:if>
		                            </div>
		                            <div class="card-body text-center">
		                                <h3 class="mb-0 fs-base text-nav">${photoList.get(i).cont}</h3>  <!-- title -->
		                            </div>
		                        </a>
		                    </div>
						</c:forEach>
					</c:if>
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


        
        
        
        
        
        