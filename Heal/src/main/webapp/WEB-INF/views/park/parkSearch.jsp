<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="나의 게시글" name="title"/>
</jsp:include>

<c:set var="keyword" value="${param.keyword}"/>
<c:set var="city" value="${param.city}"/>
<c:set var="category" value="${param.category}"/>
<c:set var="sport" value="${param.sport}"/>

<input type="hidden" id="keyword" value="${keyword}" > 
<input type="hidden" id="city" value="${city}" >  
<input type="hidden" id="category" value="${category}" >
<input type="hidden" id="sport" value="${sport}" >


<style>
	a.page-link {
		cursor:pointer
	}
</style>
<main>
<div class="container-fluid mt-5 pt-5 p-0" style="width: 75%;">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3">
              <div class="offcanvas-header d-flex d-lg-none align-items-center">
                <h2 class="h5 mb-0">Filters</h2>
                <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
              </div>
              <form action="${path}/park/parkList" method="GET">
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                  <h3 class="h6" style="margin-left: 20px;">공원명 검색</h3>
                <div class="form-group mb-lg-2 rounded-pill" style="height: 53px;">
                  <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
                    <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요">
                  </div>
                  <input class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="submit" value="검색">
                  <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button"><i class="fi-search mt-n2"></i></button>
                </div>
              <div class="offcanvas-body py-lg-4">
                <div class="pb-4">
                  <h3 class="h6">도/시</h3>
                  <select class="form-select mb-2" name="city">
                    <option value="" selected disabled>도/시</option>
                    <option value="서울특별시">서울특별시</option>
                    <option value="부산광역시">부산광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="경기">경기도</option>
                    <option value="강원">강원도</option>
                    <option value="충청">충청도</option>
                    <option value="전라">전라도</option>
                    <option value="경상">경상도</option>
                    <option value="제주">제주특별자치도</option>
                  </select>
                </div>
                <div class="pb-4">
                  <h3 class="h6">카테고리</h3>
                  <select class="form-select mb-2" name="category">
                    <option value="" selected disabled>카테고리</option>
                    <option value="근린공원">근린공원</option>
                    <option value="어린이공원">어린이공원</option>
                    <option value="체육공원">체육공원</option>
                    <option value="도시자연공원">도시자연공원</option>
                    <option value="수변공원">수변공원</option>
                    <option value="소공원">소공원</option>
                    <option value="마을마당">마을마당</option>
                    <option value="역사공원">역사공원</option>
                    <option value="문화공원">문화공원</option>
                    <option value="묘지공원">묘지공원</option>
                    <option value="주제공원">주제공원</option>
                    <option value="마을숲">마을숲</option>
                    <option value="도시농업공원">도시농업공원</option>
                    <option value="기타">기타</option>
                  </select>
                </div>
                <div class="pb-4" style="height: 124px;">
                  <h3 class="h6">운동시설</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="sport" value="yes" onclick='checkOnlyOne(this)'>
                      <label class="form-check-label fs-sm">있음</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="sport" value="no" onclick='checkOnlyOne(this)'>
                      <label class="form-check-label fs-sm">없음</label>
                    </div>
                  </div>
                </div>
                <div class="border-top py-4">
                  <button class="btn btn-outline-primary" type="button" onclick="window.location.reload()"><i class="fi-rotate-right me-2"></i>조건 새로고침</button>
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
                <li class="breadcrumb-item active" aria-current="page">공원 검색 결과</li>
              </ol>
            </nav>
            <!-- Title--> 
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">공원 검색 결과</h1>
              <a class="d-inline-block fw-bold text-decoration-none py-1" id="mapOpen"><i class="fi-map me-2"></i>위치 보기</a>
            </div>
            <!-- Sorting-->
            <div id="map" style="width: 980px; height: 1490px; border-radius:2%; display: none;"></div>
            <div id="rightSide" style="">
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <div class="d-flex align-items-center flex-shrink-0">
              </div>
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${searchCount} result</span></div>
            </div>

			<script type="text/javascript">
				function checkOnlyOne(element){
					const checkboxes = document.getElementsByName("sport");
					
					checkboxes.forEach((cb) => {
						cb.checked = false;
					})
					
					element.checked = true;
				}
				
			</script>            
            
            <!-- image 리스트 -->
            <div class="row g-4 py-4">
            
            	<c:if test="${empty list}">
            	
            	</c:if>
            	<c:if test="${!empty list}">
		            <c:forEach var="park" items="${list}">
		              <!-- Item-->
		              <div class="col-sm-6">
		                <div class="card card-light card-hover h-100">
		                  <div class="card-img-top card-img-hover"style="border: 1px;">
		                    <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info"><c:out value="${park.category}"/></span></div>
		                    <div class="tns-carousel-inner" style="height:300px;">
		                    	<c:set var="parkCategory" value="${park.category}"/>
		                    	<c:if test="${fn:contains(parkCategory, '어린이')}">
		                    		<img src="${path}/resources/image/pSearchKids/searchKids<%=Math.round(Math.random()*9 + 1)%>.png" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;">
		                    	</c:if>
		                    	<c:if test="${fn:contains(parkCategory, '수변')}">
		                    		<img src="${path}/resources/image/pSearchWater/searchWater<%=Math.round(Math.random()*9 + 1)%>.png" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;">
		                    	</c:if>
		                    	<c:if test="${fn:contains(parkCategory, '역사')}">
		                    		<img src="${path}/resources/image/psearchHis/searchHis<%=Math.round(Math.random()*9 + 1)%>.png" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;">
		                    	</c:if>
		                    	<c:if test="${!fn:contains(parkCategory, '수변') && !fn:contains(parkCategory, '어린이') && !fn:contains(parkCategory, '역사')}">
		                    		<img src="${path}/resources/image/pSearchOther/park<%=Math.round(Math.random()*12 + 1)%>.png" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;">
		                    	</c:if>
		                    </div>
		                  </div>
		                  <div class="card-body">
		                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;"><c:out value="${park.category}"/></span>
		                    </div>
		                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="${path}/park/parkDetail?no=${park.no}"><c:out value="${park.name}"/></a></h3>
		                    <div class="h6 fw-bold" style="margin-bottom: 20px;"><c:out value="${park.addr}"/></div>
		                    <hr>
		                    <div class="h6 card-footer align-items-center justify-content-center"><c:out value="${park.sport}"/></div>
		                  </div>
		                </div>
		              </div>
		            </c:forEach>
	            </c:if>
            </div>
            
            
          <!-- page부 시작 -->
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
			
				<!-- 맨 처음으로 -->
	                <li class="page-item"><a class="page-link" onclick="movePage('${path}/park/parkList?page=1');" aria-label="Next"><i class="fi-chevrons-left"></i></a></li>
				<!-- 이전 페이지 -->
	                <li class="page-item"><a class="page-link" onclick="movePage('${path}/park/parkList?page=${pageInfo.prevPage}');" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
				
				<!-- 10개 페이지 목록 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
					<c:if test="${pageInfo.currentPage == status.current}">
	               		 <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><c:out value="${status.current}"/><span class="visually-hidden">(current)</span></span></li>
					</c:if>
					<c:if test="${pageInfo.currentPage != status.current}">
						<li class="page-item d-none d-sm-block"><a class="page-link" onclick="movePage('${path}/park/parkList?page=${status.current}');"><c:out value="${status.current}"/></a></li>
					</c:if>
				</c:forEach>
			
				<!-- 다음 페이지 -->
				 <li class="page-item"><a class="page-link" onclick="movePage('${path}/park/parkList?page=${pageInfo.nextPage}');" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
				<!-- 마지막 페이지 -->
             	<li class="page-item"><a class="page-link" onclick="movePage('${path}/park/parkList?page=${pageInfo.maxPage}');" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>
			</ul>
			</nav>
          </div>
          
		<!-- page부 종료 -->
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
					        latlng: new kakao.maps.LatLng('${campList.get(2).lat}', '${list.get(2).lng}')
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
				var city = document.getElementById("city");
				var category = document.getElementById("category");
				var sport = document.getElementById("sport");
				
				pageUrl = pageUrl + '&keyword=' + keyword.value + '&city=' + city.value + '&category=' + category.value + '&sport=' + sport.value; 
				
				location.href = encodeURI(pageUrl);	
			}
		</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>