<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑 검색" name="title"/>
</jsp:include>


<c:set var="keyword" value="${param.name}"/>
<c:set var="searchAddr" value="${param.addr}"/>
<input type="hidden" id="keyword" value="${keyword}" > 
<input type="hidden" id="addr" value="${searchAddr}" >  

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
                    <input class="form-control" type="text"  name="name" placeholder="검색어를 입력하세요">
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
                    <option value="1">일몰명소</option>
                    <option value="2">일출명소</option>
                    <option value="3">낚시</option>
                    <option value="4">물놀이</option>
                    <option value="5">단풍명소</option>
                    <option value="6">눈꽃명소</option>
                    <option value="7">걷기길</option>
                    <option value="8">액티비티</option>
                    <option value="9">수상레저</option>
                    <option value="10">봄꽃여행</option>
                    <option value="11">스키</option>
                    <option value="12">항공레저</option>
                  </select>
                </div>
                <div class="pb-4">
                  <h3 class="h6">카테고리</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="glam">
                      <label class="form-check-label fs-sm" for="house">글램핑</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="cara">
                      <label class="form-check-label fs-sm" for="apartment">카라반</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="normal">
                      <label class="form-check-label fs-sm" for="room">일반야영장</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="category" value="car">
                      <label class="form-check-label fs-sm" for="office">자동차야영장</label>
                    </div>
                  </div>
                </div>
                <div class="pb-4">
                  <h3 class="h6">소형기준 1박 가격</h3>
                  <div class="range-slider" data-start-min="50000" data-start-max="100000" data-min="30000" data-max="300000" data-step="10000">
                    <div class="range-slider-ui"></div>
                    <div class="d-flex align-items-center">
                      <div class="w-50 pe-2">
                        <div class="input-group"><span class="input-group-text fs-base">원</span>
                          <input class="form-control range-slider-value-min" type="text">
                        </div>
                      </div>
                      <div class="text-muted">&mdash;</div>
                      <div class="w-50 ps-2">
                        <div class="input-group"><span class="input-group-text fs-base">원</span>
                          <input class="form-control range-slider-value-max" type="text">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="border-top py-4">
                  <button class="btn btn-outline-primary" type="button"><i class="fi-rotate-right me-2"></i>조건 새로고침</button>
                </div>
              </div>
            </form>
            </div>
          </aside>

          <script>

          </script>
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
                <li class="breadcrumb-item active" aria-current="page">캠핑장 검색 결과</li>
              </ol>
            </nav>
            <!-- Title--> 
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">캠핑장 검색 결과</h1><a class="d-inline-block fw-bold text-decoration-none py-1" href="#map" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-map me-2"></i>위치 보기</a>
            </div>
            <!-- Sorting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <div class="d-flex align-items-center flex-shrink-0">
              </div>
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${listCount} 개</span></div>
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
		                    <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">도/시</span></div>
		                    <div class="tns-carousel-inner"><img src="${camp.image}" alt="Image"></div>
		                  </div>
		                  <div class="card-body">
		                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">${camp.lineintro}</span>
		                    </div>
		                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">${camp.name}</a></h3>
		                    <div class="h6 fw-bold" style="margin-bottom: 20px;"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>60000원 / 소형 </div>
		                    <hr>
		                    <div class="h6 card-footer align-items-center justify-content-center">카테고리 아이콘</div>
		                  </div>
		                </div>
		              </div>
					</c:forEach>
	
	            </c:if>
	            
              <%-- <!-- Item-->
              <div class="col-sm-6">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">도/시</span></div>
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">${Camp.lineintro}</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">${Camp.name}</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>60000원 / 소형 </div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">카테고리 아이콘</div>
                  </div>
                </div>
              </div> --%>
              
            </div>
             <!-- Pagination-->
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1
                <span class="visually-hidden">${pageInfo.currentPage}</span></span></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">4</a></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">5</a></li>
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">${pageInfo.maxPage}</a></li>
                <li class="page-item"><a class="page-link" href="${path}/camp/campSearch?page=${pageInfo.nextPage}?name=${param.name}" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
              </ul>
            </nav> 
            
            
            <!-- page부 시작 -->
		<div align="center">
			<!-- 맨 처음으로 -->
			<button onclick="movePage('${path}/camp/campSearch?page=1');">&lt;&lt;</button>
		
			<!-- 이전 페이지 -->
			<button onclick="movePage('${path}/camp/campSearch?page=${pageInfo.prevPage}');">&lt;</button>
			
			<!-- 10개 페이지 목록 -->
			<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
				<c:if test="${pageInfo.currentPage == status.current}">
					<button disabled ><c:out value="${status.current}"/></button>
				</c:if>
				<c:if test="${pageInfo.currentPage != status.current}">
					<button onclick="movePage('${path}/camp/campSearch?page=${status.current}');">
						<c:out value="${status.current}"/>
					</button>
				</c:if>
			</c:forEach>
		
			<!-- 다음 페이지 -->
			<button onclick="movePage('${path}/camp/campSearch?page=${pageInfo.nextPage}');">&gt;</button>
		
			<!-- 마지막 페이지 -->
			<button onclick="movePage('${path}/camp/campSearch?page=${pageInfo.maxPage}');">&gt;&gt;</button>
		
		</div>
		<!-- page부 종료 -->
            
            
            
            
          </div>
        </div>
      </div>
    </main>
    <script type="text/javascript"  charset="UTF-8">
	function movePage(pageUrl){
		var keyword = document.getElementById("keyword"); 
// 		var addr = document.getElementById("addr");  
		
		pageUrl = pageUrl + '&name='+ keyword.value + '&addr=' + addr.value;  
		
		location.href = encodeURI(pageUrl);	
	}
</script>
    


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>