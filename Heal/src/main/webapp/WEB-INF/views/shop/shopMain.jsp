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
                overflow:hidden;
                text-overflow:ellipsis;
                white-space:nowrap;
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
                <div class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5">
                <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                    <input class="form-control" type="text" id="keyword" placeholder="검색어를 입력해주세요">
                </div>
                <hr class="d-md-none my-2">
                <div class="d-sm-flex">
                    <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button" id="search">검색</button>
                </div>
                </div>
            </div>
            <div class="row row-cols-lg-6 row-cols-sm-3 row-cols-2 g-3 g-xl-4">
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-real-estate-house" style="margin-top: 11px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">텐트/침낭</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-apartment" style="margin-top: 11px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">음식</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-shop" style="margin-top: 12px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">가구</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-sale.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-rent" style="margin-top: 12px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">도구</h3>
                    </a>
                </div>
                <div class="col">
                    <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover h-100 text-center" href="real-estate-catalog-rent.html">
                        <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-house-chosen" style="margin-top: 12px;"></i></div>
                        <h3 class="icon-box-title fs-base mb-0">차량용</h3>
                    </a>
                </div>
                <div class="col">
                    <div class="dropdown h-100">
                        <a class="icon-box card card-body h-100 border-0 shadow-sm card-hover text-center" href="#" data-bs-toggle="dropdown">
                            <div class="icon-box-media bg-faded-primary text-primary rounded-circle mb-3 mx-auto"><i class="fi-dots-horisontal" style="margin-top: 12px;"></i></div>
                            <h3 class="icon-box-title fs-base mb-0">ETC</h3>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-single-bed fs-base opacity-60 me-2"></i>Room</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-computer fs-base opacity-60 me-2"></i>Office</a>
                            <a class="dropdown-item fw-bold" href="real-estate-catalog-sale.html"><i class="fi-real-estate-buy fs-base opacity-60 me-2"></i>Land</a><a class="dropdown-item fw-bold" href="real-estate-catalog-rent.html"><i class="fi-parking fs-base opacity-60 me-2"></i>Parking lot</a></div>
                    </div>
                </div>
            </div>
        </section>
        
        
        
        <script>
   			$(document).ready(() => {
   				$("#search").click(function() {
   					var keyword = $("#keyword").val();
   					
   					$.ajax({
   						type: 'GET',
   						url: '/shop/search',
   						data: {
   							keyword: keyword
   						},
   						
   						success:function(list) {
   							console.log(list)
   							str = "";
   							
	   						str += '	<div><h2 class="h3 mb-sm-0" style="display:inline;">'+ keyword +'</h2></div>                                                                                                                                                                                                                        '
	   				        str += '<div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">                                                                                                                                                                                     '
	   				        str += '    <div class=row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">'
   							$.each(list, function (i, obj) {
   								if(i == 4 || i == 8) {
	   				       			str += '<div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">                                                                                                                                                                                     '
	   				        		str += '<div class="row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">'
   								}
	   				            str += '  <div class="col">                                                                                                                                                '
	   				            str += '         <div class="card shadow-sm card-hover border-0 h-100">                                                                                                                                                '
	   				            str += '             <div class="card-img-top card-img-hover">                                                                                                                                                '
	   				            str += '                 <a class="img-overlay" href="'+ obj.link+'"></a>                                                                                                                                                '
	   				            str += '                 <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">'+obj.cate2+'</span><span class="d-table badge bg-info">'+obj.cate3+'</span></div>                                                                                                              '
	   				            str += '                 <div class="content-overlay end-0 top-0 pt-3 pe-3">                                                                                                                                                '
	   				            str += '                 </div><img src="'+obj.image+'" style="min-height: 300px"  alt="Image">                                                                                                                                                '
	   				            str += '             </div>                                                                                                                                                '
	   				            str += '                 <hr>                                                                                                                                    '
	   				            str += '             <div class="card-body position-relative pb-3">                                                                                                      '
	   				            str += '                 <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">'+ obj.mall +'</h4>                                                                                                                                                '
	   				            str += '                 <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="'+obj.link+'">'+obj.title+'</a></h3>                                                                                                                                                '
	   				            str += '                 <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>'+obj.price+'원</div>                                                                                                                                                '
	   				            str += '             </div>                                                                                                                                                '
	   				            str += '         </div>                                                                                                                          '
	   				            str += '     </div>                                                                                                                                                '
   								if(i==3 || i == 7) {
   									str += '    </div>                                                                                                                                                                                                                                                                                  '
   			   				        str += '</div>'
   								}
   							});
	   				     	str += '    </div>                                                                                                                                                                                                                                                                                  '
		   				    str += '</div>'
   							
   							$("#shopSection").addClass("container mb-5 pb-2 pb-lg-4");
   							$("#shopSection").html(str);
   						},
   						
   						error:function(e) {
   							console.log(e)
   						}
   					})
   				})
   			});
   		</script>


        <section id="shopSection">
        	<!-- Services-->
        <section class="container-fluid mb-5 mt-n3 mt-lg-0" style="background: #f6f7fb; height:550px;">
            <div class="container-fluid mb-5 pt-5 mt-n3 mt-lg-0" style="width: 1500px;;">
                <h2>시선집중</h2>
                <div class="row ">
                
                    <div class="col-4 ">
                        <div class="card ">
                        	<a href="${saleList.get(0).link}" style="text-decoration: none;">
                            <img src="${saleList.get(0).image}" class="card-img-top " style="height: 200px;" alt="Card image ">
                            <div class="card-body">
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
                                    <fmt:parseNumber var="price0" integerOnly="true" value="${fn:replace(price0,'.0','')}"/>
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
                                    <fmt:parseNumber var="price1" integerOnly= "true" value= "${fn:replace(price1,'.0','')}"/>
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
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"></div><img class="rounded-3 zindex-5" style="width: 550px;height: 270px;" src="${meat.image}" alt="Article image">
                                </div>
                            </div>

                            <div class="col-6 ">
                                    <span style="color:#ff0038;  font-size: 25px;" id="clock1"></span>
                                <div class="timer">
                                </div>
                                <span class="badge bg-accent fs-sm me-2 ">타임딜</span>
                                <!-- 타이머 -->


                                <div class="from-start delay-2">
                                    <div style="margin-bottom: 20px;">
                                        <div>캠핑갈때 즐거운 고.기.파티</div>
                                        <h4>${meat.title}</h4>
                                        <span class="discount-rate">30%</span>
                                        <c:set var="price1" value="${meat.price * 0.7}"/>
                                        <fmt:parseNumber var="price1" integerOnly="true" value= "${price1}" />
                                        <span class="sales-price">${price1}원</span>
                                        <span class="dimmed-price">${meat.price}원</span>
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
                                    <div class="position-absolute top-0 start-0 zindex-1 m-3 p-1"></div><img class="rounded-3 zindex-5" style="width: 550px;height: 270px;" src="${shrimp.image}" alt="Article image">
                                </div>
                            </div>

                            <div class="col-6 ">
                                <div class="timer">
                                    <span style="color:#ff0038; font-size: 25px;" id="clock2"></span>
                                </div>
                                <span class="badge bg-accent fs-sm me-2 ">타임딜</span>
                                <!-- 타이머 -->


                                <div class="from-start delay-2">
                                    <div style="margin-bottom: 20px;">
                                        <div>캠핑갈때 즐거운 새.우.파티</div>
                                        <h4>${shrimp.title}</h4>
                                        <span class="discount-rate">30%</span>
                                        <c:set var="price2" value="${shrimp.price * 0.7}"/>
                                        <fmt:parseNumber var="price2" integerOnly="true" value="${price2}" />
                                        <span class="sales-price">${price2}원</span>
                                        <span class="dimmed-price">${shrimp.price}원</span>
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
        const  clock1 = document.querySelector('#clock1');
        const  clock2 = document.querySelector('#clock2');

            // 0d 00h 00m 00s
            function getClock1() {
               const masTime = new Date("2022-11-03 00:00:00");
                const todayTime = new Date();
                
                const diff = masTime - todayTime;

                const diffDay = String(Math.floor(diff / (1000*60*60*24)));
                const diffHour =String( Math.floor((diff / (1000*60*60)) % 24)).padStart(2,"0");
                const diffMin = String(Math.floor((diff / (1000*60)) % 60)).padStart(2,"0");
                const diffSec = String(Math.floor(diff / 1000 % 60)).padStart(2,"0");
                
                clock1.innerText = diffHour + ' : ' + diffMin + ' : ' + diffSec;
                clock2.innerText = diffHour + ' : ' + diffMin + ' : ' + diffSec;
               
            }

            getClock1();
            setInterval(getClock1, 1000);

        </script>

        <!-- Top offers (carousel)-->
        <section class="container mb-5 pb-md-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="mb-0">인생은 먹는 재미</h2>
                <a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item 6개 -->
                    <c:if test="${!empty foodList}"> <!-- 음식 리스트 -->
                    	<c:forEach var="i" begin="0" end="${foodList.size() - 1}">
                    		<div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover" style="height:300px;">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                 <img src="${foodList.get(i).image}" style="width: 100%;  height: 100%;  object-fit: cover; alt="Image">
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${foodList.get(i).cate2}</span><span class="d-table badge bg-info">${foodList.get(i).cate3}</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                                <hr>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${foodList.get(i).mall}</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${foodList.get(i).title}</a></h3>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${foodList.get(i).price}원</div>
                            </div>
                        </div>
                    </div>
                    	</c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- Top offers (carousel)-->
        <section class="container mb-5 pb-md-4">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class=" mb-0">요리는 도구빨</h2><a class="btn btn-link fw-normal p-0" href="real-estate-catalog-rent.html">View all<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                  <!-- Item 6개 -->
                    <c:if test="${!empty supList}"> <!-- 용품 리스트 -->
                    	<c:forEach var="i" begin="0" end="${supList.size() - 1}">
                    		<div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${supList.get(i).cate2}</span><span class="d-table badge bg-info">${supList.get(i).cate3}</span></div>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${supList.get(i).image}" style="min-height: 300px"  alt="Image">
                            </div>
                                <hr>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${supList.get(i).mall}</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${supList.get(i).title}</a></h3>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${supList.get(i).price}원</div>
                            </div>
                        </div>
                    </div>
                    	</c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
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






