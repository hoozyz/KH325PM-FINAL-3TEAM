<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑 검색" name="title"/>
</jsp:include>


<c:set var="keyword" value="${param.keyword}"/>
<c:set var="addr" value="${param.addr}"/>
<c:set var="theme" value="${param.theme}"/>
<c:set var="category" value="${param.category}"/>
<c:set var="price" value="${param.price}"/>
<c:set var="price2" value="${param.price2}"/>

<input type="hidden" id="keyword" value="${keyword}" > 
<input type="hidden" id="addr" value="${addr}" >  
<input type="hidden" id="theme" value="${theme}" >  
<input type="hidden" id="category" value="${category}" >  
<input type="hidden" id="price" value="${price}" >  
<input type="hidden" id="price2" value="${price2}" >  


<main>
<!-- Page container-->
      <div class="container-fluid mt-5 pt-5 p-0" style="width: 75%">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3">
              <div class="offcanvas-header d-flex d-lg-none align-items-center">
                <h2 class="h5 mb-0">Filters</h2>
                <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
              </div>
              <form action="${path}/camp/campSearch" method="GET">
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                  <h3 class="h6" style="margin-left: 20px;">캠핑장명 검색</h3>
                <div class="form-group mb-lg-2 rounded-pill" style="height: 53px;">
                  <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
                    <input class="form-control" type="text"  name="keyword" placeholder="검색어를 입력하세요">
                  </div>
                  <input class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="submit" value="검색">
                  <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button">
                  <i class="fi-search mt-n2"></i></button>
                
                </div>
                
                
                
              <div class="offcanvas-body py-lg-4">
                <div class="pb-4">
                  <h3 class="h6">위치</h3>
                  <select class="form-select mb-2" name="addr">
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
                  <h3 class="h6">테마</h3>
                  <select class="form-select mb-2" name="theme">
                    <option value="" selected disabled>테마</option>
                    <option value="일몰명소">	일몰명소		</option>
                    <option value="일출명소">	일출명소		</option>
                    <option value="낚시">		낚시		</option>
                    <option value="물놀이">	물놀이		</option>
                    <option value="단풍명소">	단풍명소			</option>
                    <option value="눈꽃명소">	눈꽃명소			</option>
                    <option value="걷기길">	걷기길		</option>
                    <option value="액티비티">	액티비티		</option>
                    <option value="수상레저">	수상레저		</option>
                    <option value="봄꽃여행">	봄꽃여행		</option>
                    <option value="스키">		스키		</option>
                    <option value="항공레저">	항공레저			</option>
                  </select>
                </div>
                
                
                <div class="pb-4">
                  <h3 class="h6">카테고리</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="글램핑">
                      <label class="form-check-label fs-sm" for="house">글램핑</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="카라반">
                      <label class="form-check-label fs-sm" for="apartment">카라반</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="일반야영장">
                      <label class="form-check-label fs-sm" for="room">일반야영장</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="자동차야영장">
                      <label class="form-check-label fs-sm" for="office">자동차야영장</label>
                    </div>
                  </div>
                </div>
                
                
                <div class="pb-4">
                  <h3 class="h6">소형기준 1박 가격</h3>
                  <div class="ps-2" style="width:180px;">
                        <div class="input-group">
                          <input class="form-control range-slider-value-min" type="text" name="price" >
                          <span class="input-group-text fs-base">원</span>
                        </div>
                      </div>
                      <div class="text-muted" style="margin-left: 90px;">~</div>
                      <div class="ps-2" style="width:180px;">
                        <div class="input-group">
                          <input class="form-control" type="text" name="price2">
                          <span class="input-group-text fs-base">원</span>
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
                <li class="breadcrumb-item"><a href="${path}/">HEALING</a></li>
                <li class="breadcrumb-item active" aria-current="page">캠핑장 검색 결과</li>
              </ol>
            </nav>
            <!-- Title--> 
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class=" mb-sm-0">캠핑장 검색 결과</h1>
              <a class="d-inline-block fw-bold text-decoration-none py-1" id="mapOpen"><i class="fi-map me-2"></i>위치 보기</a>
            </div>
            <!-- Sorting-->
            <div id="map" style="width: 980px; height: 1490px; border-radius:2%; display: none;"></div>
            <div id="rightSide" style="">
            	<div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">총 ${listCount}</span></div>
            </div>
            <!-- Catalog grid-->
            <div class="row g-4 py-4">
            
            
	            <c:if test="${empty campList}">
	            	<div>검색결과가 없습니다</div>
	            </c:if>
	            
	            <c:if test="${!empty campList}">
	            	<c:forEach var="camp" items="${campList}">
						 <!-- Item-->
		              <div class="col-sm-6">
		                <div class="card card-light card-hover h-100">
		                  <div class="card-img-top card-img-hover"style="border: 1px;">
		                    <div class="position-absolute start-0 top-0 pt-3 ps-3">
		                    
		                    <c:if test="${fn : contains(camp, '글램핑')}">
			                    <span class="d-table badge bg-primary">글램핑</span>
		                    </c:if>
		                    <c:if test="${fn : contains(camp, '카라반')}">
			                    <span class="d-table badge bg-info">카라반</span>
		                    </c:if>
		                    <c:if test="${fn : contains(camp, '일반야영장')}">
			                    <span class="d-table badge bg-success">일반야영장</span>
		                    </c:if>
		                    <c:if test="${fn : contains(camp, '자동차야영장')}">
			                    <span class="d-table badge bg-warning">자동차야영장</span>
		                    </c:if>
		                    </div>
		                    <a class="img-overlay" href="${path}/camp/campDetail?no=${camp.no}"></a>
		                     <div class="tns-carousel-inner"  style="height: 300px;">
			                    <c:if test="${empty camp.image}">
				                   <img src="${path}/resources/image/campImg<%=Math.round(Math.random()*18 + 1)%>.jpg" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;">
			                    </c:if>
			                    
			                    <c:if test="${!empty camp.image}">
				                    <img src="${camp.image}" alt="Image" style="width: 100%;  height: 100%;  object-fit: cover;" >
			                    </c:if>
		                    </div>
		                    
		                  </div>
		                  <div class="card-body">
		                    <div class="d-flex align-items-center justify-content-between pb-1">
		                    	<c:if test="${camp.lineintro == null}">
		                    		<span class="fs-sm me-3" style="color: black;">&nbsp;</span>
		                    	</c:if>
		                    		<span class="fs-sm me-3" style="color: black;">${camp.lineintro}</span>
		                    </div>
		                    <h4 class="" style="margin-bottom: 10px;"><a class="nav-link" href="${path}/camp/campDetail?no=${camp.no}">${camp.name}</a></h4>
		                    
		                    <div class="h6 fw-bold" style="margin-bottom: 20px;"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${camp.price}원</div>
		                    <hr>
		                    <div class="h6 card-footer align-items-center justify-content-center mb-2 fs-sm text-muted  Noto">
		                    <c:if test="${camp.theme == null}">
		                    	#걷기 길
		                    </c:if>
		                    
		                    <c:forEach var="foot" items="${camp.theme}">
								#${foot}&nbsp;
		                    </c:forEach>
		                    
							</div>
		                  </div>
		                </div>
		              </div>
					</c:forEach>
	            </c:if>
	            
            </div>
            </div>
             <!-- Pagination-->
             
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                <!-- 맨 처음으로 -->
                <li class="page-item"><a class="page-link" onclick="movePage('${path}/camp/campSearch?page=1');" aria-label="Next"><i class="fi-chevrons-left"></i></a></li>
				<!-- 이전 페이지 -->
                <li class="page-item"><a class="page-link" onclick="movePage('${path}/camp/campSearch?page=${pageInfo.prevPage}');" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
	                
	            <!-- 10개 페이지 목록 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
					<c:if test="${pageInfo.currentPage == status.current}">
	               		 <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><c:out value="${status.current}"/><span class="visually-hidden">(current)</span></span></li>
					</c:if>
					<c:if test="${pageInfo.currentPage != status.current}">
						<li class="page-item d-none d-sm-block"><a class="page-link" onclick="movePage('${path}/camp/campSearch?page=${status.current}');"><c:out value="${status.current}"/></a></li>
					</c:if>
				</c:forEach>    
	                
	            <!-- 다음 페이지 -->
				 <li class="page-item"><a class="page-link" onclick="movePage('${path}/camp/campSearch?page=${pageInfo.nextPage}');" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
				<!-- 마지막 페이지 -->
             	<li class="page-item"><a class="page-link" onclick="movePage('${path}/camp/campSearch?page=${pageInfo.maxPage}');" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>
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
			          var positions = [];
		        	  
						<c:forEach items="${campList}" var="item">
							var name = "${item.name}";
							var lat = "${item.lat}";
							var lng = "${item.lng}";
							var position = {
								content: '<div>'+name+'</div>', 
								latlng: new kakao.maps.LatLng(lat, lng)
							}
					       	positions.push(position);
						</c:forEach>
		        	  
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
    <script>
	function movePage(pageUrl){
		var keyword = document.getElementById("keyword"); 
		var addr = document.getElementById("addr");  
		var theme = document.getElementById("theme");  
		var category = document.getElementById("category");  
		var price = document.getElementById("price");  
		var price2 = document.getElementById("price2");  

		
		
		pageUrl = pageUrl + '&keyword='+ keyword.value + '&addr=' + addr.value + '&theme=' + theme.value + '&category=' + category.value + '&price=' + price.value + '&price2=' + price2.value  ;  
		
		location.href = encodeURI(pageUrl);	
	}
</script>
    


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>