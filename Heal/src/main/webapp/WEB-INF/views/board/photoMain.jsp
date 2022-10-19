<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시판" name="title"/>
</jsp:include>

<body class="fixed-bottom-btn">
    <main class="page-wrapper">
        <div class="container-fluid mt-5 pt-5 p-0">
            <div class="row g-0 mt-n3">
                <!-- Page content-->
                <div class="position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
                    <!-- Map popup-->
                    <div class="map-popup invisible" id="map">
                        <button class="btn btn-icon btn-light btn-sm shadow-sm rounded-circle" type="button" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-x fs-xs"></i></button>
                        <div class="interactive-map" data-map-options-json="json/map-options-real-estate-rent.json"></div>
                    </div>
                    <!-- Breadcrumb-->
                    <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">포토 게시판</li>
                        </ol>
                    </nav>
                    <!-- Title-->
                    <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
                        <h1 class="h2 mb-sm-0">포토 게시판</h1>
                        
                    </div>
                    <!-- Sorting-->
                    <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5">
                        <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                            <input class="form-control" type="text" placeholder="What are you looking for?">
                        </div>
                        <hr class="d-md-none my-2">
                        <div class="d-sm-flex">
                            <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                                <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2"></i><span class="dropdown-toggle-label">All categories</span></button>
                                <input type="hidden">
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#"><i class="fi-bed fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">캠핑장</span></a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fi-cafe fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">공원</span></a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fi-shopping-bag fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">축제</span></a></li>
                                </ul>
                            </div>
                            <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button">Search</button>
                        </div>
                    </form>
                    <!-- Catalog grid-->
                    <div class="row g-4 py-4">
                        <!-- 아이템 ::::: 세로 4 x 가로 3... 12개 임의지정-->
                        <div class="col-sm-6 col-xl-4">
                            <div class="card shadow-sm card-hover border-0 h-100">
                                <div class="tns-carousel-wrapper card-img-top card-img-hover">
                                    <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                    <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">캠핑장</span></div>
                                    <div class="tns-carousel-inner"><img src="resource/image/photo/001.jpg" alt="Image" style="width:100%; height:265px"><img src="resource/image/photo/001.jpg" alt="Image" style="width:100%; height:265px"></div>
                                </div>
                                <div class="card-body position-relative pb-3">
                                    <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">게시글 제목</a></h3>
                                </div>

                            </div>
                        </div>                 
                    </div>
                    <!-- Pagination-->
                    <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
                        <ul class="pagination mb-1">
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
            </div>
        </div>
    </main>
</body>

<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="${path}/resources/vendor/rellax/rellax.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />