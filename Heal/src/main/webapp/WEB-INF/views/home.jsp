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
                    <select class="form-select mb-2" style="width:75pt" name="city">			
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
                    <select class="form-select mb-2" name="typeCtg" style="width:80pt" onchange="setType(this.value);">			
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
    <section class="container-main mb-2">
        <div class="d-flex align-items-end align-items-lg-center justify-content-between mb-4 pb-md-2">
            <div class="d-flex w-100 align-items-center justify-content-between justify-content-lg-start">
                <h2 class="h3 mb-0 me-md-4 text-center">추천 캠핑장</h2>
           		<nav>
	                <div class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0" role="tablist">
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="campsite-tab" data-bs-toggle="tab" data-bs-target="#campsite" type="button" role="tab" aria-controls="campsite" aria-selected="true">일반 야영장</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="carcampsite-tab" data-bs-toggle="tab" data-bs-target="#carcampsite" type="button" role="tab" aria-controls="carcampsite" aria-selected="true">자동차 야영장</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="glamping-tab" data-bs-toggle="tab" data-bs-target="#glamping" type="button" role="tab" aria-controls="glamping" aria-selected="true">글램핑</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="caravan-tab" data-bs-toggle="tab" data-bs-target="#caravan" type="button" role="tab" aria-controls="caravan" aria-selected="true">카라반</button>
	               	</div>
             	</nav> 
           	</div><a class="btn btn-link fw-normal d-none d-lg-block p-0" href="${path}/camp/campMain">View all<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
			
             	
    	<div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush mx-n2">
					<div class="tns-carousel-inner row gx-4 mx-0"
						data-carousel-options="{&quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;controlsContainer&quot;: &quot;#carousel-controls-tp&quot;, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;1320&quot;:{&quot;items&quot;:2}}}">
						<!-- Carousel item-->
						<div class="col">
							<div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
								<div class="col-md-7">
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="real-estate-single-v1.html"
										style="background-image: url(${path}/resources/image/c01.jpg); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1"></h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1"></i>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c02.png" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
											</div>
										</div>
									</a>
									<a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c03.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
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
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="real-estate-single-v1.html"
										style="background-image: url(${path}/resources/image/c04.png); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1"></i># 캠핑장 주소
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c05.jpg" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
											</div>
										</div>
									</a>
									<a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c06.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
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
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="real-estate-single-v1.html"
										style="background-image: url(${path}/resources/image/c07.jpg); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1"></i># 캠핑장 주소
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c08.jpg" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
											</div>
										</div>
									</a> <a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="real-estate-single-v2.html">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c09.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">@ 캠핑장 이름</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i># 캠핑장 주소
												</div>
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

    <section class="container-fluid mb-5 mt-n3 mt-lg-0 pt-4" style="background: #e4dabe; height:550px;">
        <section class="container mb-5 pb-2">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="h3 mb-0">진행중인 축제</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="${path}/festival/festivalMain">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pb-md-4 pb-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3787">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main4.jpg" alt="New York" style="height:250pt; width:100%;">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">굿모닝양림축제 </h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.01~2022.10.31</h5>
                                </h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3775">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main2.jpg" alt="Chicago" style="height:250pt; width:100%;">

                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">용전들노래 가을걷이 한마당</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.26~2022.10.26</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3352">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main.jpg" alt="Los Angeles" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">제20회광안리어방축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.14~2022.10.16</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3256">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main5.jpg" alt="San Diego" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">보수동책방골목문화축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.14~2022.10.15</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3654">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main3.jpg" alt="Dallas" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">전포커피축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.28~2022.10.29</h5>
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
            <a class="btn btn-link fw-normal ms-md-3 pb-0" href="${path}/park/parkMain">View all<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        </div>
        <!-- Carousel-->
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center">
            <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;: true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}}">
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/famousPark2.png)">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0"> 낙산 공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 서울특별시 종로구 창신동 611-19</h6>
                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=53216">공원으로 이동하기</a>
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
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 경기도 파주시 야당동 1058</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=48668">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/park-main.jpg);">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0">한림 공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 제주특별자치도 제주시 한림읍 협재리 2610</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=39915">공원으로 이동하기</a>
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
                    <a class="d-block text-decoration-none bg-faded-accent rounded-3 h-100" href="${path}/near/foodDetail?no=62612" style="background-image: url(${path}/resources/image/food3.png); position: relative;">
                        <div style="position: absolute; left:5%; bottom:0; ">
                            <h4 style="color:#ffffff; margin: 0;">청어림</h4>
                            <h6 style="color:#ffffff;  margin: 0;"><i class="fi-map-pin me-1"></i>제주특별자치도 제주시</h6>
                            <h6 style="color:#ffffff;  margin: 0;">노형동 911-3</h6>
                            <br>
                        </div>
                    </a>
                </div>
                <!-- Where to eat-->
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative " style="margin-top:9px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">갈치찜</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                         <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i> 12,000 </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative " style="margin-top: 18px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main2.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">고등어구이(조림)</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                         <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i> 11,000 </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative" style="margin-top: 18px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main3.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">물회</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                        <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i>14,000 </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
                
                <div class="card-active col-xl-5 col-lg-6 pt-3" style="background: #eceefa; border-radius: 10px;">
                	<c:if test="${!empty shopList}">
	                    <c:forEach var= "i"  begin="0" end="${shopList.size() - 1}">
	                    <article class="d-flex align-items-start" style="max-width: 640px;">
	                        <a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="${shopList.get(i).image}" style="width:130px; height: 130px; " alt="여행"></a>
	                        <div>
	                            <h5 class="fs-base mt-1" style="margin-bottom: 10px">
		                            <c:if test="${shopList.get(i).cate3 eq '액티비티'}">
			                            <span class="d-table badge bg-info">${shopList.get(i).cate3}</span>
		                            </c:if>
		                            <c:if test="${shopList.get(i).cate3 eq '국내숙박'}">
			                            <span class="d-table badge bg-success">${shopList.get(i).cate3}</span>
		                            </c:if>
	                            </h5>
	                            <p class="mb-2 fs-sm"><a class="nav-link" href="real-estate-blog-single.html" style="padding: 0;">${shopList.get(i).title}</a></p>
	                            <a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-cash mt-n1 me-1 fs-sm align-middle opacity-70"></i>${shopList.get(i).price}원</a>
	                        </div>
	                    </article>
	                    <c:if test="${i < 2}">
	                         <hr class="text-dark opacity-10 my-3">
	                    </c:if>
	                    </c:forEach>
                    </c:if>
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
