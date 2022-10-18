<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
 <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메인 홈페이지" name="title"/>
</jsp:include>

<style>          
            .page-spinner {
                display: inline-block;
                width: 2.75rem;
                height: 2.75rem;
                margin-bottom: .75rem;
                vertical-align: text-bottom;
                border: .15em solid #bbb7c5;
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
            
            .container-main {
                width: 80%;
                margin: 0 auto;
                padding-bottom: 30px;
            }
            
            backg-img {
                background-image: url('D001.png');
            }
        </style>
	
	<!-- 메인 페이지 시작 -->
	<main>
  <section class="mb-5">
        <div style="height: 400pt; background-position: 60% 100%; background-image: url(resources/image/cm003.jpg);">
            <div class="container" style="padding-top: 170px">
                <h1 class="text-white text-left" style="padding-left: 180px; font-size:50pt; font-family: DalseoDarling;">
                    일상에서 벗어나
                </h1>
                <h1 class="text-white text-left" style="padding-left: 180px; font-size:50pt; font-family: DalseoDarling; padding-bottom: 30px">
                    나만의 힐링스팟으로
                </h1>
            </div>
            <div class="container" style="max-width: 1000px;">
                <form class="form-group rounded-md-pill" style="padding: 0px;" name="MainSearch" id="searchFrm" action="" method="GET">
                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-5"><i class="fi-search"></i></span>
                        <input class="form-control" name="keyword" type="text" placeholder="가보고 싶은 곳이 있으세요?">
                    </div>
                    <hr class="d-md-none my-2">
                    <div class="d-sm-flex">
                    <div class="dropdown w-100 mb-sm-0 mb-3 border-end-md">      	
                    <select class="form-select mb-2" name="city">			
					<option value="" selected disabled>도/시</option>
                    <option value="서울특별시">서울특별시</option>                                             
                    <option value="부산광역시">부산광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청도">충청도</option>
                    <option value="전라도">전라도</option>
                    <option value="경상도">경상도</option>
                    <option value="제주특별자치도">제주특별자치도</option>                
                 	 </select>                
                        </div>
                        <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">                       
                    <select class="form-select mb-2" name="typeCtg" onchange="setType(this.value);">			
					<option value="캠핑장">캠핑장</option>
                    <option value="공원">공원</option>                                             
                    <option value="축제">축제</option>
                    </select>                         
                        </div>
                        <input class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="Search"/>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <!-- 카테고리 검색 ~ 액션태그 --> 
    <script>
function setType(param){

alert(param);

if(param == "캠핑장"){
	$("#searchFrm").attr("action","${path}/camp/campSearch")
	}
	
else if(param == "공원"){
	$("#searchFrm").attr("action","${path}/park/parkList")
	}
	
else if(param == "축제"){
	$("#searchFrm").attr("action","${path}/festival/festivalSearch")
	}
	
else{
	$("#searchFrm").attr("action", "")
	}

}
</script>
    
    
    <!-- Top properties-->
    <section class="container-main">
        <div class="d-flex align-items-end align-items-lg-center justify-content-between mb-4 pb-md-2">
            <div class="d-flex w-100 align-items-center justify-content-between justify-content-lg-start">
                <h2 class="h3 mb-0 me-md-4 text-center">추천 캠핑장</h2>
                <div class="dropdown d-md-none" data-bs-toggle="select">
                    <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"><span class="dropdown-toggle-label">자동차 야영장</span></button>
                    <input type="hidden">
                    <div class="dropdown-menu"><a class="dropdown-item" href="#"><span class="dropdown-item-label">일반 야영장</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">자동차 야영장</span></a><a class="dropdown-item" href="#"><span class="dropdown-item-label">글램핑</span></a>
                        <a class="dropdown-item" href="#"><span class="dropdown-item-label">카라반</span></a>
                    </div>
                </div>
                <ul class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0">
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">일반 야영장</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm active mb-2 mb-md-0" href="#">자동차 야영장</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">글램핑</a></li>
                    <li class="nav-item"><a class="nav-link fs-sm mb-2 mb-md-0" href="#">카라반</a></li>
                </ul>
            </div><a class="btn btn-link fw-normal d-none d-lg-block p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush mx-n2">
            <div class="tns-carousel-inner row gx-4 mx-0" data-carousel-options="{&quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;controlsContainer&quot;: &quot;#carousel-controls-tp&quot;, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;1320&quot;:{&quot;items&quot;:2}}}">
                <!-- Carousel item-->
                <div class="col">
                    <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                        <div class="col-md-7">
                            <a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(${path}/resources/image/c01.jpg); height:600px;"><span class="img-gradient-overlay"></span>
                                    <div class="card-body content-overlay pb-0"></div>
                                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                                        <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                            <div class="pe-2">
                                                <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                        </div>
                        <div class="col-md-5">
                            <a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c02.png" style="height:270px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                            <a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c03.jpg" style="height:150px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Carousel item-->
                <div class="col">
                    <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                        <div class="col-md-7">
                            <a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(${path}/resources/image/c04.png); height:600px;"><span class="img-gradient-overlay"></span>
                                    <div class="card-body content-overlay pb-0"></div>
                                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                                        <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                            <div class="pe-2">
                                                <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                        </div>
                        <div class="col-md-5">
                            <a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c05.jpg" style="height:270px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                            <a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c06.jpg" style="height:150px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Carousel item-->
                <div class="col">
                    <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                        <div class="col-md-7">
                            <a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(${path}/resources/image/c07.jpg); height:600px;"><span class="img-gradient-overlay"></span>
                                    <div class="card-body content-overlay pb-0"></div>
                                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                                        <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                            <div class="pe-2">
                                                <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                                <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                        </div>
                        <div class="col-md-5">
                            <a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c08.jpg" style="height:270px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                            <a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                                <div class="card-body p-0 position-relative"><img src="${path}/resources/image/c09.jpg" style="height:150px;" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                                    <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                                        <h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
                                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i># 캠핑장 주소</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel custom controls-->
        <div class="tns-carousel-controls justify-content-center pt-md-2 mt-4" id="carousel-controls-tp">
            <button class="me-3" type="button"><i class="fi-chevron-left fs-xs"></i></button>
            <button type="button"><i class="fi-chevron-right fs-xs"></i></button>
        </div>
    </section>

    <section class="container-fluid mb-5 mt-n3 mt-lg-0 pt-3" style="background: #e4dabe; height:500px;">
        <section class="container mb-5 pb-2">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="h3 mb-0">진행중인 축제</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 py-md-4 py-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/p05.png" alt="New York" style="height:200pt; width:100%;">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">창릉천 코스모스 축제 고양시</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.09.14~2022.09.20</h5>
                                </h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/p04.jpg" alt="Chicago" style="height:200pt; width:100%;">

                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">창릉천 코스모스 축제 고양시</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.09.14~2022.09.20</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/p03.jpg" alt="Los Angeles" style="height:200pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">창릉천 코스모스 축제 고양시</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.09.14~2022.09.20</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/p02.jpg" alt="San Diego" style="height:200pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">창릉천 코스모스 축제 고양시</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.09.14~2022.09.20</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/p01.jpg" alt="Dallas" style="height:200pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">창릉천 코스모스 축제 고양시</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.09.14~2022.09.20</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <section class="container mb-5 pb-lg-2">
        <div class="d-md-flex align-items-center justify-content-between mb-4 pb-md-2">
            <h2 class="h3 w-100 mb-md-0">전국 주요 공원</h2>
            <!-- Sorting by date-->
            <a class="btn btn-link fw-normal ms-md-3 pb-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        </div>
        <!-- Carousel-->
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center">
            <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;: true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}}">
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/Suwon.png)">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0"> 광교 호수공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 경기도 수원시 영통구 하동 광교호수로 57</h6>
                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="#">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/Unjeong.jpg);">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0">운정 호수공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 경기도 파주시 와동동 1412</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="#">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/Yeouido.jpg);">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0">여의도 공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 서울특별시 영등포구 여의공원로 68 (여의도동)</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="#">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="width:200px; height:150px; margin-bottom:50px;">
        <div class="container mb-5">
            <div class="row">
                <div class="col-lg-7">
                    <h2 class="h3 w-100 mb-4">전국 맛집</h2>
                </div>
                <div class="col-lg-5">
                    <h2 class="h3 w-100 mb-4">00몰</h2>
                </div>
            </div>
            <div class="row">
                <!-- Banner-->
                <div class="col-lg-3">
                    <a class="d-block text-decoration-none bg-faded-accent rounded-3 h-100" href="#" style="background-image: url(${path}/resources/image/food3.png); position: relative;">
                        <div style="position: absolute; left:5%; bottom:0; ">
                            <h3 style="color:#ffffff; margin: 0;">농가의 식탁</h3>
                            <h6 style="color:#ffffff;  margin: 0;"><i class="fi-map-pin me-1"></i>인천광역시 강화군</h6>
                            <h6 style="color:#ffffff;">선원면 해안동로 1037-8</h6>
                        </div>
                    </a>
                </div>
                <!-- Where to eat-->
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative mb-4"><img class="me-3 rounded-3" style="width: 130px; height: 130px;" src="${path}/resources/image/food2.png" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=63399">삼겹 구운 야채구이</a></h3>
                                    <h5 class="mb-2 fs-sm">강화 새우젓과 생와사비를 곁들인 삼겹살 야채구이</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                        <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>5.0</b><span class="text-muted">&nbsp;(48)</span></li>
                                        <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>25,000 ₩</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative mb-4"><img class="me-3 rounded-3" style="width: 130px; height: 130px;" src="${path}/resources/image/food1.png" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="city-guide-single.html">바질 크림 파스타</a></h3>
                                    <h5 class="mb-2 fs-sm">깻잎바질페스토/진한 크림과 베이컨 그리고 야채의 조화</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                        <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>5.0</b><span class="text-muted">&nbsp;(48)</span></li>
                                        <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>20,000 ₩</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative"><img class="me-3 rounded-3" style="width: 130px; height: 130px;" src="${path}/resources/image/food4.png" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="city-guide-single.html">초록 깻잎 파스타</a></h3>
                                    <h5 class="mb-2 fs-sm">쉬림프/신선한 생바질/깻잎페스토의 야채를 강조한 농가의 파스타</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                        <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>5.0</b><span class="text-muted">&nbsp;(48)</span></li>
                                        <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>19,000 ₩</li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-active col-xl-5 col-lg-6" style="background: #eceefa; border-radius: 10px;">
                    <br>
                    <article class="d-flex align-items-start" style="max-width: 640px;">
                        <a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="${path}/img/real-estate/blog/th01.jpg" width="100" alt="Blog post"></a>
                        <div>
                            <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Your Guide to a Smart Apartment Searching</a></h5>
                            <p class="mb-2 fs-sm">Mi justo, varius vitae cursus ipsum sem massa amet pellentesque. Ipsum enim sit nulla ridiculus semper nam...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Dec 4</a>
                            <a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>2 comments</a>
                        </div>
                    </article>
                    <hr class="text-dark opacity-10 my-4">
                    <article class="d-flex align-items-start" style="max-width: 640px;">
                        <a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="${path}/img/real-estate/blog/th02.jpg" width="100" alt="Blog post"></a>
                        <div>
                            <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Top 10 Ways to Refresh Your Space</a></h5>
                            <p class="mb-2 fs-sm">Volutpat, orci, vitae arcu feugiat vestibulum ultricies nisi, aenean eget. Vitae enim, tellus tempor consequat mi vitae...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Nov 23</a>
                            <a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>No comments</a>
                        </div>
                    </article>
                    <hr class="text-dark opacity-10 my-4">
                    <article class="d-flex align-items-start" style="max-width: 640px;">
                        <a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="${path}/img/real-estate/blog/th02.jpg" width="100" alt="Blog post"></a>
                        <div>
                            <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Top 10 Ways to Refresh Your Space</a></h5>
                            <p class="mb-2 fs-sm">Volutpat, orci, vitae arcu feugiat vestibulum ultricies nisi, aenean eget. Vitae enim, tellus tempor consequat mi vitae...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Nov 23</a>
                            <a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>No comments</a>
                        </div>
                    </article>
                </div>
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
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
