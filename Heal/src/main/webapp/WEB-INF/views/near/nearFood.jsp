<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerTest.jsp">
	<jsp:param value="음식검색" name="food"/>
</jsp:include>

<c:set var="keyword" value="${param.keyword}"/>
<c:set var="searchcity" value="${param.city}"/>
<c:set var="searchtype" value="${param.type}"/>

<input type="hidden" id="keyword" value="${keyword}" > 
<input type="hidden" id="city" value="${searchcity}" >  
<input type="hidden" id="type" value="${searchtype}" >

<main>
<div class="container-fluid mt-5 pt-5 p-0">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
            <div class="offcanvas offcanvas-start offcanvas-collapse" id="filters-sidebar">
              <div class="offcanvas-header d-flex d-lg-none align-items-center">
                <h2 class="h5 mb-0">Filters</h2>
                <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
              </div>
              <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                <ul class="nav nav-tabs mb-0">
                  <li class="nav-item"><a class="nav-link active" href="/front/nearFood.html"><i class="fi-rent fs-base me-2"></i>음식점</a></li>
                  <li class="nav-item"><a class="nav-link" href="/front/nearHotel.html"><i class="fi-home fs-base me-2"></i>숙박업소</a></li>
                </ul>
              </div>
              <!-- Search form-->
              <form action="${path}/near/nearFood" method="GET">
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                <div class="form-group mb-lg-2 rounded-pill" style="height: 53px;">
                  <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
                    <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요">
                  </div>
                  <input class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="submit" value="검색">
                  <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button"><i class="fi-search mt-n2"></i></button>
                </div>
                </div>
                <div class="offcanvas-body py-lg-4">
                <div class="pb-4 mb-2">
                  <h3 class="h6">위치</h3>
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
                <div class="pb-4 mb-2">
                  <h3 class="h6">음식 종류</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="한식">
                      <label class="form-check-label fs-sm" for="korea">한식</label>            
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="일식">
                      <label class="form-check-label fs-sm" for="japan">일식</label> 
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="중식">
                      <label class="form-check-label fs-sm" for="china">중식</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="양식">
                      <label class="form-check-label fs-sm" for="america">양식</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="뷔페">
                      <label class="form-check-label fs-sm" for="buffet">뷔페</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="분식">
                      <label class="form-check-label fs-sm" for="bunsik">분식</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="type" value="기타">
                      <label class="form-check-label fs-sm" for="etc">기타</label>
                    </div>
                  </div>
                </div>
                <div class="border-top py-4">
                  <!-- ajax -->
                  <button class="btn btn-outline-primary" type="button"><i class="fi-rotate-right me-2"></i>조건 새로고침</button>
                </div>
                </div>
              </form>
            </div>
          </aside>
          <!-- Page content-->
          <div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
            <!-- Map popup-->
            <div class="map-popup invisible" id="map">
              <button class="btn btn-icon btn-light btn-sm shadow-sm rounded-circle" type="button" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-x fs-xs"></i></button>
              <div class="interactive-map" data-map-options-json="json/map-options-real-estate-rent.json"></div>
            </div>
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">HEALING</a></li>
                <li class="breadcrumb-item active" aria-current="page">음식점 검색 결과</li>
              </ol>
            </nav>
            <!-- Title--> <!-- 검색하면 결과 뒤에 붙음-->
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">음식점 검색</h1><a class="d-inline-block fw-bold text-decoration-none py-1" href="#" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-map me-2"></i>위치 보기</a>
            </div>
            <!-- Sorting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">총 ${listCount}</span></div>
            </div> 
            <!-- 음식 리스트 -->
				<div class="row g-4 py-4">
					<c:if test="${!empty FoodList}">
						<c:forEach var="food" items="${FoodList}">

							<div class="col-sm-6 col-xl-4" style="margin-bottom: 20px;">
								<div class="card shadow-sm card-hover border-0 h-100">
									<div class="tns-carousel-wrapper card-img-top card-img-hover"
										style>
										<a class="img-overlay" href="real-estate-single-v1.html"></a>
										<div class="position-absolute start-0 top-0 pt-3 ps-3">
											<span class="d-table badge bg-success mb-1">${food.type}</span><span class="d-table badge bg-info">${food.main}</span>
										</div>
										<div class="content-overlay end-0 top-0 pt-3 pe-3">
											<button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist">
												<i class="fi-heart"></i>
											</button>
										</div>
										<div class="">
										<!-- 이미지는 임시, 페이징 다 끝내면 디폴트로 첫 페이지는 임의로 12개 구성 -->
											<img src="${path}/resources/image/food5.png" alt="Image">
										</div>
									</div>
									<div class="card-body position-relative pb-3"
										style="margin-top: 20px;">
										<h3 class="h6 mb-2 fs-base" style="margin-bottom: 10px;">
											<a class="nav-link stretched-link"
												href="real-estate-single-v1.html">${food.addr}</a>
										</h3>
										<p class="mb-2 fs-sm text-muted">${food.name}</p>
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
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">			
				<c:if test="${pageInfo.currentPage != status.current}">					
				<li class="page-item d-none d-sm-block"><a class="page-link" href="${path}/near/nearFood?page=${status.current}">
				<c:out value="${status.current}"/></a></li>		
				</c:if>
				</c:forEach>		
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="${path}/near/nearFood?page=${pageInfo.maxPage}">${pageInfo.maxPage}</a></li>
                <li class="page-item"><a class="page-link" href="${path}/near/nearFood?page=${pageInfo.nextPage}" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
              </ul>
            </nav> 
			</div>			
			 <!-- page부 시작 -->
		<div align="center">
			<!-- 맨 처음으로 -->
			<button onclick="movePage('${path}/near/nearFood?page=1');">&lt;&lt;</button>
			<!-- 이전 페이지 -->
			<button onclick="movePage('${path}/near/nearFood?page=${pageInfo.prevPage}');">&lt;</button>			
			<!-- 10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${pageInfo.currentPage == status.current}">
					<button disabled ><c:out value="${status.current}"/></button>
				</c:if>
				<c:if test="${pageInfo.currentPage != status.current}">
					<button onclick="movePage('${path}/near/nearFood?page=${status.current}');">
						<c:out value="${status.current}"/>
					</button>
				</c:if>
			</c:forEach>		
			<!-- 다음 페이지 -->
			<button onclick="movePage('${path}/near/nearFood?page=${pageInfo.nextPage}');">&gt;</button>		
			<!-- 마지막 페이지 -->
			<button onclick="movePage('${path}/near/nearFood?page=${pageInfo.maxPage}');">&gt;&gt;</button>		
		</div>
		<!-- page부 종료 -->			
        </div>
      </div>
    </main>
    
	<script type="text/javascript" charset="UTF-8">
		function movePage(pageUrl) {
			var keyword = document.getElementById("keyword");
			var addr = document.getElementById("city");
			var type = document.getElementById("type");

			pageUrl = pageUrl 
			+ '&keyword=' + keyword.value 
			+ '&city=' + city.value 
			+ '&type=' + type.value;
			location.href = encodeURI(pageUrl);
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>