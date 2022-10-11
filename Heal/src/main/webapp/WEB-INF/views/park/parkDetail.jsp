<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공원 상세" name="title"/>
</jsp:include>

<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
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
                }<style>
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

        <!-- Review modal-->
        <div class="modal fade" id="modal-review" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">공원후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름 <span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-name" name="name" value="${loginMember.name}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점 <span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" required>
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">공원후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="공원 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page content-->
        <section class="container mt-5 mb-lg-5 mb-4 pt-5 pb-lg-5">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="real-estate-home-v1.html">홈페이지</a></li>
                    <li class="breadcrumb-item"><a href="real-estate-catalog-rent.html">공원</a></li>
                    <li class="breadcrumb-item active" aria-current="page">칠십리공원</li>
                </ol>
            </nav>
            <div class="row gy-5 pt-lg-2">
                <div class="col-lg-7">
                    <div class="d-flex flex-column">
                        <!-- Carousel with slides count-->
                        <div class="order-lg-1 order-2">
                            <div class="tns-carousel-wrapper">
                                <div class="tns-slides-count text-light"><i class="fi-image fs-lg me-2"></i>
                                    <div class="ps-1"><span class="tns-current-slide fs-5 fw-bold"></span><span class="fs-5 fw-bold">/</span><span class="tns-total-slides fs-5 fw-bold"></span></div>
                                </div>
                                <div class="tns-carousel-inner" data-carousel-options="{&quot;navAsThumbnails&quot;: true, &quot;navContainer&quot;: &quot;#thumbnails&quot;, &quot;gutter&quot;: 12, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false},&quot;500&quot;:{&quot;controls&quot;: true}}}">
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail1.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail2.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail3.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail4.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail5.jpg" alt="Image"></div>
                                </div>
                            </div>
                            <!-- Thumbnails nav-->
                            <ul class="tns-thumbnails mb-4" id="thumbnails">
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail1.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail2.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail3.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail4.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail5.jpg" alt="Thumbnail"></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Reviews-->
                    <div class="mb-4 pb-4 border-bottom">
                        <h3 class="h4 pb-3"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>4,9 (32 후기)</h3>
                        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between"><a class="btn btn-outline-primary mb-sm-0 mb-3" href="#modal-review" data-bs-toggle="modal"><i class="fi-edit me-1"></i>후기 등록</a>
                            <div class="d-flex align-items-center ms-sm-4">
                                <label class="me-2 pe-1 text-nowrap" for="reviews-sorting"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>정렬순:</label>
                                <select class="form-select" id="reviews-sorting">
                      <option>최신순</option>
                      <option>오래된순</option>
                      <option>좋아요순</option>
                      <option>별점 높은순</option>
                    </select>
                            </div>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0">Annette Black</h6><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                </div>
                            </div><span class="text-muted fs-sm">Jan 17, 2021</span>
                        </div>
                        <p>Elementum ut quam tincidunt egestas vitae elit, hendrerit. Ullamcorper nulla amet lobortis elit, nibh condimentum enim. Aliquam felis nisl tellus sodales lectus dictum tristique proin vitae. Odio fermentum viverra tortor quis.</p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(3)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i class="fi-dislike"></i><span>(0)</span></button>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0">Darrell Steward</h6><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
                                </div>
                            </div><span class="text-muted fs-sm">Dec 1, 2020</span>
                        </div>
                        <p>Vel dictum nunc ut tristique. Egestas diam amet, ut proin hendrerit. Dui accumsan at phasellus tempus consequat dignissim.</p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(0)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i class="fi-dislike"></i><span>(1)</span></button>
                        </div>
                    </div>
                    <!-- Pagination-->
                    <nav class="mt-2 mb-4" aria-label="Reviews pagination">
                        <ul class="pagination">
                            <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                            <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="visually-hidden">(current)</span></span>
                            </li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                            <li class="page-item d-none d-sm-block">...</li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Sidebar with details-->
                <aside class="col-lg-5">
                    <div class="ps-lg-5">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <span class="badge bg-success me-2"><c:out value="${park.category}"/></span>
                            <div class="text-nowrap">
                                <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="tooltip" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                <div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="Share">
                                    <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>
                                    <div class="dropdown-menu dropdown-menu-end my-1">
                                        <button class="dropdown-item" type="button"><i class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>
                                        <button class="dropdown-item" type="button"><i class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>
                                        <button class="dropdown-item" type="button"><i class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Property details-->
                        <h2 class="h2"><c:out value="${park.name}"/></h2>
                        <div class="card border-0 bg-secondary mb-4">
                            <div class="card-body">
                                <ul class="list-unstyled mt-n2 mb-0">
                                    <li class="mt-2 mb-0"><b>주소 | </b><c:out value="${park.addr}"/></li>
                                    <li class="mt-2 mb-0"><b>전화번호 | </b><c:out value="${park.phone}"/></li>
                                    <li class="mt-2 mb-0"><b>운동시설 | </b><c:out value="${park.sport}"/></li>
                                </ul>
                            </div>
                        </div>
                        <!--Map-->
                        <div id="map" style="width: 480px; height: 300px; border-radius:2%;"></div>
                        <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8cddaf5bb7b88f487cf47627b52b649b"></script>
                        <script>
                            var container = document.getElementById('map');
                            var options = {
                                center: new kakao.maps.LatLng(33.2449710617, 126.5561556775),
                                level: 3
                            };

                            var map = new kakao.maps.Map(container, options);

                            var markerPosition = new kakao.maps.LatLng(33.2449710617, 126.5561556775);

                            var marker = new kakao.maps.Marker({
                                position: markerPosition
                            });

                            marker.setMap(map);
                        </script>
                        <br>
                        
                        
                        <h3 class="h4">오늘의 날씨</h3>
                        <!-- Not included in rent-->
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
                    </div>
                </aside>
            </div>
        </section>
        <!-- Recently viewed-->
        <section class="container mb-5 pb-2 pb-lg-4">
            <div>
                <h2 class="h3 mb-sm-0" style="display:inline;">근처 </h2>
                <h2 class="h3 mb-sm-0" style="display:inline; color: #F7B202;"> 음식점</h2>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/image/nearFood6.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">비원</a></h3>
                                <p class="mb-2 fs-sm text-muted">제주특별자치도 제주시 노형동 100</p>
                                <div class="fw-bold">064-744-1919</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">#한식&nbsp;&nbsp;#한우등심&nbsp;&nbsp;#흑돼지&nbsp;&nbsp;#삼계탕</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/image/nearFood7.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">우정횟집</a></h3>
                                <p class="mb-2 fs-sm text-muted">제주특별자치도 제주시 건입동 1319</p>
                                <div class="fw-bold">064-757-4202</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">#일식&nbsp;&nbsp;#활어회</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/image/nearFood8.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">만부정</a></h3>
                                <p class="mb-2 fs-sm text-muted">제주특별자치도 제주시 연동 298-9</p>
                                <div class="fw-bold">064-743-1119</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">#한식&nbsp;&nbsp;#복어요리</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/image/nearFood9.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">흑돼지가있는풍경</a></h3>
                                <p class="mb-2 fs-sm text-muted">제주특별자치도 제주시 노형동 668</p>
                                <div class="fw-bold">064-742-1108</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">#한식&nbsp;&nbsp;#흑돼지</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="${path}/resources/image/nearFood10.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">탑동산호전복</a></h3>
                                <p class="mb-2 fs-sm text-muted">제주특별자치도 제주시 삼도이동 1206</p>
                                <div class="fw-bold">064-758-0123</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">#한식&nbsp;&nbsp;#전복죽</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        
        <!-- Vendor scrits: js libraries and plugins-->
        <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
        <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
        <script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js"></script>
        <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
        <!-- Main theme script-->
        <script src="${path}/resources/js/theme.min.js"></script>
