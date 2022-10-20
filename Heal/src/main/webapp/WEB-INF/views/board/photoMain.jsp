<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시판" name="title"/>
</jsp:include>

        <!-- 글쓰기 팝업-->
        <div class="modal fade" id="write-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0" style="margin-right: 730px;">
                <div class="modal-content" style="width: 1200px;">
                    <div class="modal-body px-0 py-2 py-sm-0" style="height: 700px; width:1200px">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                			<div class="col-md-6 pb-4 pt-md-5 border-end-md" style="width: 550px;padding-left: 48px;">
                                <form class="needs-validation" action="${path}/photo/write" method="POST" enctype="multipart/form-data">
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-name">아이디</label>
                                        <input class="form-control" name="id" type="text" style="width:430px" value="${loginMember.id}" readonly>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-title" style="float: left;">제목</label>
                                        <select id="category" name="category" style="margin-left: 250px; width:150px; float: left; height:40px; margin-bottom: 10px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>카테고리</option> <!-- select 는 name하고 옵션에 value값 적은게 modelattribute로 넘어감 -->
                    				<option value="캠핑장">캠핑장</option>
                    				<option value="공원">공원</option>
                    				<option value="축제">축제</option>
			                      </select>
                                        <input class="form-control" name="title" style="width:430px" type="text" placeholder="제목을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4" style="height: 350px;">
                 						<label class="form-label mb-2" for="signin-content">내용</label>
                                        <input type="file" value="" style="margin-left: 150px;width: 250px;" multiple="multiple" name="files" id="writeFile" accept="image/gif, image/jpg, image/jpeg, image/png"> <!-- 사진만 첨부 가능 -->
                                        <textarea class="form-control" style="height:320px; width:430px; word_wrap:break-word;" name="cont" id="signin-content" placeholder="내용을 입력해주세요" required></textarea>
                                    </div>
                                    <div style="margin-left: 60px;">
                                        <input class="btn btn-lg rounded-pill" id="write" style="width:70%; color: #D9E2F2;background-color:#201627;" type="submit" value="게시글 작성">
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6" style="width: 570px;margin-left: 20px;">
                            	<div>이미지 미리보기</div>
                            	<div style="width: 570px;height: 480px; margin-top: 20px;"><img id="image" style="width: 570px;height: 480px;" src=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
        	$("#writeFile").on('change', function() {
        		readURL(this);        		
        	});
        	
        	function readURL(input) {
                if (input.files && input.files[0]) {
                   var reader = new FileReader();
                   reader.onload = function (e) {
                      $('#image').attr('src', e.target.result);
                   }
                   reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

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
                        <c:if test="${loginMember != null }">
                        	<a href="#write-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right; text-decoration: none;">게시글 작성</a>
                        </c:if>
                        <c:if test="${loginMember == null }">
                        	<a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right; text-decoration: none;">게시글 작성</a>
                        </c:if>
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
                        <c:if test="${!empty list}">
                        	<c:forEach var="i" begin="0" end="${list.size() - 1}">
                        		<c:set var="renamefile" value="${list.get(i).renamefile}"/>
                        		<div class="col-sm-6 col-xl-4">
                            <div class="card shadow-sm card-hover border-0 h-100">
                                <div class="tns-carousel-wrapper card-img-top card-img-hover">
                                    <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                    <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${list.get(i).category}</span></div>
                                  	<div class="tns-carousel-inner">
                                    	<c:if test="${fn:contains(renamefile,',')}">
                                    	<c:set var="split" value="${fn:split(renamefile,',')}"/>
                                    	<c:set var="length" value="${fn:length(split)}"/>
                                    	<c:forEach var="i" begin="0" end="${length-1}">
                                    		<img src="${path}/resources/upload/image/${split[i]}" alt="Image" style="width:100%; height:265px">
                                    	</c:forEach>
                                    </c:if>
                                    <c:if test="${not fn:contains(renamefile,',')}">
                                    	<img src="${path}/resources/upload/image/${list.get(i).renamefile}" alt="Image" style="width:100%; height:265px">
                                    </c:if>
                                    </div>
                                    </div>
                                <div class="card-body position-relative pb-3">
                                    <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${list.get(i).title}</a></h3>
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

<script>
	$(document).ready(function() {
		$(".tns-liveregion").html('');
	});
</script>

<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="${path}/resources/vendor/rellax/rellax.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />