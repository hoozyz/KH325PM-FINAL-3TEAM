<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerTest.jsp">
	<jsp:param value="나의 게시글" name="title"/>
</jsp:include>

<main>
<div class="container-fluid mt-5 pt-5 p-0" style="width: 75%;">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3">
              <div class="offcanvas-header d-flex d-lg-none align-items-center">
                <h2 class="h5 mb-0">Filters</h2>
                <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
              </div>
              <form action="" method="GET">
                <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
                  <h3 class="h6" style="margin-left: 20px;">축제명 검색</h3>
                <div class="form-group mb-lg-2 rounded-pill" style="height: 53px;">
                  <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
                    <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요">
                  </div>
                  <input class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="submit" value="검색">
                  <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button"><i
                      class="fi-search mt-n2"></i></button>
                </div>
              <div class="offcanvas-body py-lg-4">
                <div class="pb-4 mb-2">
                  <h3 class="h6">위치</h3>
                  <select class="form-select mb-2" name="city">
                    <option value="" selected disabled>도/시</option>
                    <option value="1">서울특별시</option>
                    <option value="2">부산광역시</option>
                    <option value="3">대구광역시</option>
                    <option value="4">인천광역시</option>
                    <option value="5">광주광역시</option>
                    <option value="6">대전광역시</option>
                    <option value="7">울산광역시</option>
                    <option value="8">경기도</option>
                    <option value="9">강원도</option>
                    <option value="10">충청도</option>
                    <option value="11">전라도</option>
                    <option value="12">경상도</option>
                    <option value="13">제주특별자치도</option>
                  </select>
                </div>
                <!-- Date range -->
                  <!--calendar-->
                  <h3 class="h6">시작일 선택</h3>
                  <div class="input-group input-daterange pb-3" style="width: 300px; right: 15px;">
                    <input class="form-control date-picker rounded-pill " id="datepicker" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                    <div class="input-group-addon">to</div>
                    <input class="form-control date-picker rounded-pill pi-5 " id="datepicker" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                </div>
                  <!-- calendar End-->
                <div class="border-top py-4">
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
                <li class="breadcrumb-item active" aria-current="page">축제 검색 결과</li>
              </ol>
            </nav>
            <!-- Title--> 
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">축제 검색 결과</h1><a class="d-inline-block fw-bold text-decoration-none py-1" href="#" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-map me-2"></i>위치 보기</a>
            </div>
            <!-- Sorting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <div class="d-flex align-items-center flex-shrink-0">
              </div>
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">148 results</span></div>
            </div>
            <!-- Catalog grid-->
            <div class="row g-4 py-4">
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
              <!-- Item-->
              <div class="col-sm-6 mb-4">
                <div class="card card-light card-hover h-100">
                  <div class="card-img-top card-img-hover"style="border: 1px;">
                    <div class="tns-carousel-inner"><img src="img/car-finder/catalog/01.jpg" alt="Image"></div>
                  </div>
                  <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between pb-1"><span class="fs-sm me-3" style="color: black;">주소</span>
                    </div>
                    <h3 class="h5" style="margin-bottom: 10px;"><a class="nav-link" href="car-finder-single.html">축제명</a></h3>
                    <div class="h6 fw-bold" style="margin-bottom: 20px;">내용</div>
                    <hr>
                    <div class="h6 card-footer align-items-center justify-content-center">시작일 ~ 종료일</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pagination-->
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="visually-hidden">(current)</span></span></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>