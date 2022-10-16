<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <!-- Vendor Styles-->
        <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
        <link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
        <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="쇼핑메인" name="title"/>
</jsp:include>

  <!-- @@@@@@@@@@@@ shopping 스타일 -->

        <style>
            .discount-rate {
                font-size: 20px;
                font-weight: 800;
                line-height: 1.5;
                white-space: nowrap;
                color: rgb(250, 98, 47);
            }
            
            .sales-price {
                font-size: 20px;
                font-weight: 800;
                line-height: 1.5;
                white-space: nowrap;
            }
            
            .dimmed-price {
                font-size: 16px;
                margin-left: 6px;
                color: rgb(181, 181, 181);
                font-size: 14px;
                font-weight: 400;
                line-height: normal;
                text-decoration: line-through;
            }
            
            .timer {
                -webkit-box-pack: justify;
                justify-content: space-between;
                -webkit-box-align: center;
                align-items: center;
                font-size: 50px;
                font-weight: 800;
                color: rgb(51, 51, 51);
            }
            
            .card-title {
                font-size: 22px;
                font-weight: bold;
                margin: 5px;
            }
            
            .rate {
                color: #ff0038;
                font-size: 20px;
                constter-spacing: 0;
            }
            
            .rate2 {
                margin-right: 8px;
                font-size: 16px;
            }
            
            .price {
                margin-right: 4px;
                color: #111;
                font-size: 20px;
                font-weight: bold;
                constter-spacing: 0;
            }
            
            .price_regular {
                margin: 0 0 -2px 4px;
                font-size: 16px;
                color: #999;
                constter-spacing: 0;
                text-decoration: line-through;
            }
            
            .c_prd_price {
                vertical-align: middle;
                margin-bottom: 5px;
            }
            
            .cover {
                display: flex;
                justify-content: space-between;
                font-size: 12px;
            }
            
            .c-flag {
                position: absolute;
                left: 20px;
                right: 20px;
                bottom: 189px;
                display: inline-block;
                vertical-align: middle;
                overflow: hidden;
                zoom: 1;
                height: 22px;
            }
            
            .c-flag_body {
                float: left;
            }
            
            .c-flag__item {
                font-weight: 500;
                color: #f43142;
                background: #FBC1C6;
                border-color: rgba(244, 49, 66, 0.4);
                display: block;
                height: 22px;
                padding: 2px 4px 1px;
                border: 1px solid transparent;
                font-size: 12px;
                line-height: 1.4;
                white-space: nowrap;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                overflow: hidden;
            }
            
            h2 {
                font-size: 30px;
            }
        </style>




        <!-- Hero-->

        <!-- 히어로 어두워짐 style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));" -->
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-0"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/shoppingHero.jpg);"></div>
            <div class="content-overlay container py-md-5">
                <div class="mt-5 mb-md-5 py-5">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
                        <h1 class="display-3 mt-sm-5 my-4">SHOPPING</h1>
                        <p class="fs-lg text-white">Find great places to stay, eat, shop, or visit from our partners and local experts. Plan your trip with Finder now</p>
                    </div>

                </div>
            </div>
            <div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
        </section>



        <!-- Property categories-->
        <section class="container mb-5">
            <div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-0">
                <!-- Search form-->
                <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5">
                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                        <input class="form-control" type="text" placeholder="검색어를 입력해주세요">
                    </div>
                    <hr class="d-md-none my-2">
                    <div class="d-sm-flex">
                        <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button">검색</button>
                    </div>
                </form>
            </div>
            <div class="row row-cols-lg-6 row-cols-sm-3 row-cols-2 g-3 g-xl-4">
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-real-estate-house" style="margin-top: 10px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">텐트/침낭</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-apartment"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">음식</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-shop"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">가구</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-rent"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">도구</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-house-chosen"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">차량용</h3>
                    </a>
                </div>
                <div class="col">
                    <div class="dropdown h-100">
                        <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" href="#" data-bs-toggle="dropdown">
                            <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-dots-horisontal"></i></div>
                            <h3 class="icon-box-title fs-base mb-0">ETC</h3>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-computer fs-base opacity-60 me-2"></i>Office</a>
                            <a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Services-->
        <section class="container-fluid mb-5 mt-n3 mt-lg-0" style="background: #f6f7fb; height:550px;">
            <div class="container-fluid mb-5 pt-5 mt-n3 mt-lg-0" style="width: 1500px;;">
                <h2>시선집중</h2>
                <div class="row ">
                    <div class="col-4 ">
                        <div class="card ">
                        	<a href="${saleList.get(0).link}" style="text-decoration: none;">
                            <img src="${saleList.get(0).image}" class="card-img-top " style="height: 200px;" alt="Card image ">
                            <div class="card-body ">
                                <div class="c-flag">
                                    <div class="c-flag_body">
                                        <span class="c-flag__item">시선집중</span>
                                    </div>
                                </div>
                                <h5 class="card-title ">${saleList.get(0).title}</h5>
                                <div class="c_prd_price">
                                    <span class="rate">
                                        <span>20<span class="rate2">%</span></span> <!-- 20 30 40 퍼 순서로 할인 -->
                                    </span>
                                    
                                    <c:set var="price0" value="${saleList.get(0).price * 0.8}" />
                                    <fmt:parseNumber var= "price0" integerOnly= "true" value= "${fn:replace(price0,'.0','')}"/>
                                    <span class="price">
                                        <span class="value">${price0}</span><span class="unit">원</span>
                                    </span>
                                    <span class="price_regular">
                                        <span class="value">${saleList.get(0).price}</span><span class="unit">원</span>
                                    </span>
                                </div>
                                </a>
                                <div class="cover">
                                    <c:set var="saleTitle0" value="${saleList.get(0).title}"/>

                                    <c:if test="${fn:contains(saleTitle0, '입장권')}"> <!-- 입장권 --> 
                                		<span><i class="fi-ticket fs-6 me-2"></i>E-Mail & SMS전송 상품</span>
                                	</c:if>
                                	<c:if test="${not fn:contains(saleTitle0, '입장권')}"> <!-- 입장권 아닐 때 -->
                                		<span><i class="fi-truck fs-6 me-2"></i>무료배송</span>
                                	</c:if>
                                	
                                	<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 500) %></c:set> <!-- 랜덤 숫자 -->
                                    <span class="prd_count"><span class="number">${ran}</span>개 구매</span>
                                </div>
                            </div>
                            <div class="card-footer text-muted" style="font-size :16px;">ㅁㅁㅁ추천 상품</div>
                        </div>
                    </div>
                    <div class="col-4 ">
                        <div class="card ">
                        	<a href="${saleList.get(1).link}" style="text-decoration: none;">
                            <img src="${saleList.get(1).image}" class="card-img-top " style="height: 200px;" alt="Card image ">
                            <div class="card-body ">
                                <div class="c-flag">
                                    <div class="c-flag_body">
                                        <span class="c-flag__item">시선집중</span>
                                    </div>
                                </div>
                                <h5 class="card-title ">${saleList.get(1).title}</h5>
                                <div class="c_prd_price">
                                    <span class="rate">
                                        <span>25<span class="rate2">%</span></span>
                                    </span>
                                    
                                    <c:set var="price1" value="${saleList.get(1).price * 0.75}" />
                                    <fmt:parseNumber var= "price1" integerOnly= "true" value= "${fn:replace(price1,'.0','')}"/>
                                    <span class="price">
                                        <span class="value">${price1}</span><span class="unit">원</span>
                                    </span>
                                    <span class="price_regular">
                                        <span class="value">${saleList.get(1).price}</span><span class="unit">원~</span>
                                    </span>
                                </div>
                                </a>
                                <div class="cover">
                                    <c:set var="saleTitle1" value="${saleList.get(1).title}"/>

                                    <c:if test="${fn:contains(saleTitle1, '입장권')}"> <!-- 입장권 --> 
                                		<span><i class="fi-ticket fs-6 me-2"></i>E-Mail & SMS전송 상품</span>
                                	</c:if>
                                	<c:if test="${not fn:contains(saleTitle1, '입장권')}"> <!-- 입장권 아닐 때 -->
                                		<span><i class="fi-truck fs-6 me-2"></i>무료배송</span>
                                	</c:if>
                                	
                                	<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 500) %></c:set> <!-- 랜덤 숫자 -->
                                    <span class="prd_count"><span class="number">${ran}</span>개 구매</span>
                                </div>
                            </div>
                            <div class="card-footer text-muted" style="font-size :16px;">ㅁㅁㅁ추천 상품</div>
                        </div>
                    </div>
                    <div class="col-4 ">
                        <div class="card ">
                        	<a href="${saleList.get(2).link}" style="text-decoration: none;">
                            <img src="${saleList.get(2).image}" class="card-img-top " style="height: 200px;" alt="Card image">
                            <div class="card-body ">
                                <div class="c-flag">
                                    <div class="c-flag_body">
                                        <span class="c-flag__item">시선집중</span>
                                    </div>
                                </div>
                                <h5 class="card-title">${saleList.get(2).title}</h5>
                                <div class="c_prd_price">
                                    <span class="rate">
                                        <span>30<span class="rate2">%</span></span>
                                    </span>
                                    <c:set var="price2" value="${saleList.get(2).price * 0.7}" />
                                    <fmt:parseNumber var= "price2" integerOnly= "true" value= "${fn:replace(price2,'.0','')}"/>
                                    <span class="price">
                                        <span class="value">${price2}</span><span class="unit">원</span>
                                    </span>
                                    <span class="price_regular">
                                        <span class="value">${saleList.get(2).price}</span><span class="unit">원</span>
                                    </span>
                                </div>
                                </a>
                                <div class="cover">
                                	<c:set var="saleTitle2" value="${saleList.get(2).title}"/>

                                    <c:if test="${fn:contains(saleTitle2, '입장권')}"> <!-- 입장권 --> 
                                		<span><i class="fi-ticket fs-6 me-2"></i>E-Mail & SMS전송 상품</span>
                                	</c:if>
                                	<c:if test="${not fn:contains(saleTitle2, '입장권')}"> <!-- 입장권 아닐 때 -->
                                		<span><i class="fi-truck fs-6 me-2"></i>무료배송</span>
                                	</c:if>
                                
                                	<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 500) %></c:set> <!-- 랜덤 숫자 -->
                                    <span class="prd_count"><span class="number">${ran}</span>개 구매</span>
                                </div>
                            </div>
                            <div class="card-footer text-muted" style="font-size :16px;">ㅁㅁㅁ추천 상품</div>
                        </div>
                    </div>

                </div>
            </div>
        </section>




        <!-- Newly listed properties-->
        <!-- Newly listed properties-->
        <section class="container mt-n3 mt-md-0 mb-5 pb-3 pb-lg-4">
            <div class="d-flex align-items-end  mb-4 pb-md-2">
                <h2 class="mb-0">타임딜</h2>
                <span class="ms-2 p-0">망설이면 늦어요</span>
            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;mode&quot;: &quot;gallery&quot;, &quot;speed&quot;: 800, &quot;nav&quot;: false, &quot;controlsContainer&quot;: &quot;#carousel-controls-lp&quot;}">
                    <!-- Item-->
                    <div>
                        <div class="row">
                            <div class="col-6 mb-md-0 mb-3">
                                <div class="position-relative pe-lg-5">
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"></div><img class="rounded-3 zindex-5" style="width: 550px;height: 270px;" src="${path}/resources/image/shopTimer.jpg" alt="Article image">
                                </div>
                            </div>

                            <div class="col-6 ">
                                    <span style="color:#ff0038" id="clock1"></span>
                                <div class="timer">
                                </div>
                                <span class="badge bg-accent fs-sm me-2 ">타임딜</span>
                                <!-- 타이머 -->


                                <div class="from-start delay-2">
                                    <div style="margin-bottom: 20px;">
                                        <div>캠핑갈때 즐거운 고.기.파티</div>
                                        <h4>특수부위 6종 모듬세트 1.2kg (냉동) 캠핑고기</h4>
                                        <span class="discount-rate">35%</span>
                                        <span class="sales-price">19,450원</span>
                                        <span class="dimmed-price">29,900원</span>
                                    </div>

                                </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist"><a class="btn btn-primary" href="real-estate-single-v2.html">상세보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="row">
                            <div class="col-6 mb-md-0 mb-3">
                                <div class="position-relative pe-lg-5">
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"></div><img class="rounded-3 zindex-5" style="width: 550px;height: 270px;" src="${path}/resources/image/showTimer2.jpg" alt="Article image">
                                </div>
                            </div>

                            <div class="col-6 ">
                                <div class="timer">
                                    <span style="color:#ff0038" id="clock2"></span>
                                </div>
                                <span class="badge bg-accent fs-sm me-2 ">타임딜</span>
                                <!-- 타이머 -->


                                <div class="from-start delay-2">
                                    <div style="margin-bottom: 20px;">
                                        <div>캠핑갈때 즐거운 고.기.파티</div>
                                        <h4>국산 제철 특대 활새우1kg 대(25-30미내외)왕새우 흰다리새우 통통하고 달달한맛</h4>
                                        <span class="discount-rate">30%</span>
                                        <span class="sales-price">21,600원</span>
                                        <span class="dimmed-price">30,900원</span>
                                    </div>

                                </div>
                                <div class="btn-group btn-group-lg scale-up delay-3" role="group" aria-label="Buy now or add to wishlist"><a class="btn btn-primary" href="real-estate-single-v2.html">Sale for $16,850</a>
                                    <button class="btn btn-primary px-3 border-start border-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><i class="fi-heart fs-5"></i></button>
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

        ​​​​
        <script>
            const clock = document.querySelector('#clock1');

            // 0d 00h 00m 00s
            function getClock1() {
                const nowDate = new Date();
                const nowYear = nowDate.getFullYear();
                const dDate = new Date(`${nowYear + 1}/1/1`);
                const dDay = dDate.getTime() - nowDate.getTime();
                const day = Math.floor(dDay / (1000 * 60 * 60 * 24));
                const hours = String(Math.floor((dDay % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).padStart(2, "0");
                const minutes = String(Math.floor((dDay % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, "0");
                const seconds = String(Math.floor((dDay % (1000 * 60)) / 1000)).padStart(2, "0");
                
                clock1.innerText = `${hours}:${minutes}:${seconds}`;
            }

            getClock();
            setInterval(getClock, 1000);
            const clock2 = document.querySelector("#clock2");

            // 0d 00h 00m 00s
           	function getClock2() {
                const nowDate = new Date();
                const nowYear = nowDate.getFullYear();
                const dDate = new Date(`${nowYear + 1}/1/1`);
                const dDay = dDate.getTime() - nowDate.getTime();
                const day = Math.floor(dDay / (1000 * 60 * 60 * 24));
                const hours = String(Math.floor((dDay % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).padStart(2, "0");
                const minutes = String(Math.floor((dDay % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, "0");
                const seconds = String(Math.floor((dDay % (1000 * 60)) / 1000)).padStart(2, "0");
                clock2.innerText = `${hours}:${minutes}:${seconds}`;
            }

            getClock2();
            setInterval(getClock2, 1000);
        </script>

        <!-- Top offers (carousel)-->
        <section class="container mb-5 pb-md-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="mb-0">캠핑을 부탁해</h2>
                <a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>




                </div>
            </div>
        </section>
        <!-- Top offers (carousel)-->
        <section class="container mb-5 pb-md-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class=" mb-0">캠핑의 기본</h2><a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                  <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/01.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">3-bed Apartment | 67 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">3811 Ditmars Blvd Astoria, NY 11105</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$1,629</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">3<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-danger">Featured</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/img/real-estate/catalog/02.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For sale</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">Family Home| 120 sq.m</a></h3>
                                <p class="mb-2 fs-sm text-muted">67-04 Myrtle Ave Glendale, NY 11385</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>$84,000</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm">4<i class="fi-bed ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-bath ms-1 mt-n1 fs-lg text-muted"></i></span><span class="d-inline-block mx-1 px-2 fs-sm">2<i class="fi-car ms-1 mt-n1 fs-lg text-muted"></i></span></div>
                        </div>
                    </div>
                    







                </div>
            </div>
        </section>

    </main>
    
     <!-- Vendor scrits: js libraries and plugins-->
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js"></script>
    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>






