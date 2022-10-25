<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="축제 검색" name="title"/>
</jsp:include>

<c:set var="keyword" value="${param.keyword}"/>
<c:set var="addr" value="${param.addr}"/>
<c:set var="startdate" value="${param.startdate}"/>
<c:set var="enddate" value="${param.enddate}"/>
<input type="hidden" id="keyword" value="${keyword}" > 
<input type="hidden" id="addr" value="${addr}" > 
<input type="hidden" id="startdate" value="${startdate}" > 
<input type="hidden" id="enddate" value="${enddate}" > 

<main>
<section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-50" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
            <div class="jarallax-img" style="background-image: url(${path}/resources/image/festivalHero4.png);"></div>
            <div class="content-overlay container py-md-5" style="margin-top: 50px;">
                <div class="mt-5 mb-md-5 py-5 ">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0" style="width: 1000px; height: 0px;">
                        <h1 class="display-5 text-white" style="margin-bottom: 50px; text-align: center; font-size: 75px;">Festival</h1>
                    </div>
                </div>
        </section>
	<div class="container-fluid mt-5 pt-5 p-0" style="width: 75%;">
		<div class="row g-0 mt-n3">
			<!-- Filters sidebar (Offcanvas on mobile)-->
			<aside
				class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3">
				<div class="offcanvas-header d-flex d-lg-none align-items-center">
					<h2 class="h5 mb-0">Filters</h2>
					<button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
				</div>
				<form action="${path}/festival/festivalSearch" method="GET">
					<div
						class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
						<h3 class="h6" style="margin-left: 20px;">축제명 검색</h3>
						<div class="form-group mb-lg-2 rounded-pill" style="height: 53px;">
							<div class="input-group">
								<span class="input-group-text text-muted"><i
									class="fi-search"></i></span> <input class="form-control" type="text"
									name="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요">
							</div>
							<input
								class="btn btn-primary rounded-pill d-lg-inline-block d-none"
								type="submit" value="검색">
							<button
								class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex"
								type="button">
								<i class="fi-search mt-n2"></i>
							</button>
						</div>
						<div class="offcanvas-body py-lg-4">
							<div class="pb-4 mb-2">
								<h3 class="h6">위치</h3>
								<select class="form-select mb-2" name="addr">
									<option value="${param.addr}" selected disabled>${param.addr}</option>
									<option value="서울특별시">서울특별시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="대구광역시">대구광역시</option>
									<option value="인천광역시">인천광역시</option>
									<option value="광주광역시">광주광역시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="울산광역시">울산광역시</option>
									<option value="세종특별시">세종특별시</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="충청북도">충청북도</option>
									<option value="충청남도">충청남도</option>
									<option value="전라북도">전라북도</option>
									<option value="전라남도">전라남도</option>
									<option value="경상북도">경상북도</option>
									<option value="경상남도">경상남도</option>
									<option value="제주특별자치도">제주특별자치도</option>
								</select>
							</div>
							<!-- Date range -->
							<!--calendar-->
							<h3 class="h6">시작/종료일 선택</h3>
							<div class="input-group input-daterange pb-3"
								style="width: 300px; right: 15px;">
								<input class="form-control date-picker rounded-pill "
									name="startdate" value="${param.startdate}" type="date" placeholder="날짜를 선택해주세요" style="font-size:15px;"
									data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
									<div class="mt-2">&nbsp;~&nbsp;</div>
								<input class="form-control date-picker rounded-pill pi-5 "
									name="enddate" value="${param.enddate}" type="date" placeholder="날짜를 선택해주세요" style="font-size:15px;"
									data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
							</div>
							<!-- calendar End-->
							<div class="border-top py-4">
								<button class="btn btn-outline-primary" type="button">
									<i class="fi-rotate-right me-2"></i>조건 새로고침
								</button>
							</div>
						</div>
				</form>
		</div>
		</aside>
		<!-- Page content-->
		<div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
			<!-- Map popup-->
			<!-- Breadcrumb-->
			<nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">HEALING</a></li>
					<li class="breadcrumb-item active" aria-current="page">축제 검색 결과</li>
				</ol>
			</nav>
			<!-- Title-->
			<div
				class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
				<h1 class="h2 mb-sm-0">축제 검색 결과</h1>
				<a class="d-inline-block fw-bold text-decoration-none py-1" id="mapOpen"><i class="fi-map me-2"></i>위치 보기</a>
			</div>
			<!-- Sorting-->
            <div id="map" style="width: 980px; height: 1490px; border-radius:2%; display: none;"></div>
            <div id="rightSide" style="">
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <div class="d-flex align-items-center flex-shrink-0">
              </div>
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${listCount} 건</span></div>
            </div>
			<!-- Catalog grid-->
			<div class="search-data row g-4 py-4">

				<c:if test="${empty list}">
				검색내역이 없습니다.
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="i" begin="0" end="${list.size() - 1}">
						<!-- Item-->
						<div class="col-sm-6 mb-4">
							<div class="card card-light card-hover h-100">
								<div class="card-img-top card-img-hover" style="border: 1px;">
									<div class="tns-carousel-inner">
									<img src="${path}/resources/image/festivalSearch${i+1}.jpg" alt="Image" style="width: 500px;  height: 300px;  object-fit: cover;">
									</div>
								</div>
								<div class="card-body">
									<div
										class="d-flex align-items-center justify-content-between pb-1">
										<span class="fs-sm me-3" style="color: black;">${list.get(i).addr}</span>
									</div>
									<h3 class="h5" style="margin-bottom: 10px;">
										<a class="nav-link"
											href="${path}/festival/festivalDetail?no=${list.get(i).no}">${list.get(i).name}</a>
									</h3>
									<div class="h6 fw-bold" style="margin-bottom: 20px;">${list.get(i).phone}</div>
									<hr>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<!-- Pagination-->
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                <!-- 맨 처음으로 -->
                <li class="page-item"><a class="page-link" onclick="movePage('${path}/festival/festivalSearch?page=1');" aria-label="Next"><i class="fi-chevrons-left"></i></a></li>
				<!-- 이전 페이지 -->
                <li class="page-item"><a class="page-link" onclick="movePage('${path}/festival/festivalSearch?page=${pageInfo.prevPage}');" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
	                
	            <!-- 10개 페이지 목록 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
					<c:if test="${pageInfo.currentPage == status.current}">
	               		 <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><c:out value="${status.current}"/><span class="visually-hidden">(current)</span></span></li>
					</c:if>
					<c:if test="${pageInfo.currentPage != status.current}">
						<li class="page-item d-none d-sm-block"><a class="page-link" onclick="movePage('${path}/festival/festivalSearch?page=${status.current}');"><c:out value="${status.current}"/></a></li>
					</c:if>
				</c:forEach>    
	                
	            <!-- 다음 페이지 -->
				 <li class="page-item"><a class="page-link" onclick="movePage('${path}/festival/festivalSearch?page=${pageInfo.nextPage}');" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
				<!-- 마지막 페이지 -->
             	<li class="page-item"><a class="page-link" onclick="movePage('${path}/festival/festivalSearch?page=${pageInfo.maxPage}');" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>
				</ul>
			</nav>
          </div>
        </div>
    </main>
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8cddaf5bb7b88f487cf47627b52b649b"></script>
    <script>
         	 $(document).ready(() => {
         		$(document).on('click',"#mapOpen",function() {
         			$("#map").css('display','');
					$("#rightSide").css('display','none')         			
         			$(this).html('위치 닫기');
         			$(this).attr('id','mapClose');
         			
         			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			              mapOption = { 
			                  center: new kakao.maps.LatLng(36.13961603184461, 128.11362285164773), // 지도의 중심좌표
			                  level: 13 // 지도의 확대 레벨
			              };
			          var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			           
			          // 마커를 표시할 위치와 title 객체 배열입니다 
			         var positions = [
					    {
					    	content: '<div>${list.get(0).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(0).lat}', '${list.get(0).lng}')
					    },
					    {
					    	content: '<div>${list.get(1).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(1).lat}', '${list.get(1).lng}')
					    },
					    {
					    	content: '<div>${list.get(2).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(2).lat}', '${list.get(2).lng}')
					    },
					    {
					    	content: '<div>${list.get(3).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(3).lat}', '${list.get(3).lng}')
					    },
					    {
					    	content: '<div>${list.get(4).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(4).lat}', '${list.get(4).lng}')
					    },
					    {
					    	content: '<div>${list.get(5).name}</div>', 
					        latlng: new kakao.maps.LatLng('${list.get(5).lat}', '${list.get(5).lng}')
					    }
					];
					 
			          for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng // 마커의 위치
					    });
					
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });
					
					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}
					
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
					    return function() {
					        infowindow.open(map, marker);
					    };
					}
					
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}
         		});
         		
         	 });
         	 
         	$(document).on('click','#mapClose',function() {
     			$("#map").css('display','none');
				$("#rightSide").css('display','');
				$(this).html('<i class="fi-map me-2"></i>위치 보기');
     			$(this).attr('id','mapOpen');
     		});
        </script>
    	<script type="text/javascript" charset="UTF-8">
	    	function movePage(pageUrl){
				var keyword = document.getElementById("keyword"); 
	 			var addr = document.getElementById("addr");  
	 			var startdate = document.getElementById("startdate");  
	 			var enddate = document.getElementById("enddate");  
			
				pageUrl = pageUrl + '&keyword='+ keyword.value + '&addr=' + addr.value + '&startdate=' + startdate.value + '&enddate=' + enddate.value;  
			
				location.href = encodeURI(pageUrl);	
			}
		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>