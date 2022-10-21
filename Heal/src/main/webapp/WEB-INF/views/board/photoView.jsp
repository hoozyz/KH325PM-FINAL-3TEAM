<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시글" name="title"/>
</jsp:include>

	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
    
    <!-- Reply modal-->
        <div class="modal fade" id="modal-reply" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">댓글 작성</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" action="${path}/reply/write" method="POST">
                        	<input type="hidden" name="type" value="camp">
                        	<input type="hidden" name="no" value="${camp.no}">
                            <div class="mb-3">
                                <label class="form-label" for="review-name">아이디<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-id" name="id" value="${loginMember.id}" readonly>
                                <div class="invalid-feedback">아이디을 입력해주세요.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점<span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star" required>
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">평점을 입력해주세요.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">캠핑후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" name="cont" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">후기를 입력해주세요.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
<main>
	<div class="container mt-5 mb-md-4 pt-5">
        <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">About</li>
          </ol>
        </nav>
      </div>
         
    <section class="container mb-5 pb-2">
        <div class="row align-items-center justify-content-center">
        	<!-- Hero content-->
          <div class="col-lg-4 col-md-5 col-sm-9 order-md-1 order-2 text-md-start text-center">
            <h1 class="mb-4">${photo.title} / ${photo.id}</h1>
            <p class="mb-4 pb-3 fs-lg">${photo.cont}</p>
          </div>
          <!-- Hero carousel-->
          <c:set var="renamefile" value="${photo.renamefile}"/>
         		<div class="col-sm-6 col-xl-4" style="width: 800px;">
          <div class="card shadow-sm card-hover border-0 h-100">
              <div class="tns-carousel-wrapper card-img-top card-img-hover">
                  <a class="img-overlay" href="${path}/photo/view?no=${photo.no}"></a>
                  <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${photo.category}</span></div>
                	<div class="tns-carousel-inner">
                  	<c:if test="${fn:contains(renamefile,',')}">
                  	<c:set var="split" value="${fn:split(renamefile,',')}"/>
                  	<c:set var="length" value="${fn:length(split)}"/>
                  	<c:forEach var="i" begin="0" end="${length-1}">
                  		<img src="/resources/upload/image/${split[i]}" style="width:800px; height:485px; border-radius: 2%">
                  	</c:forEach>
                  	</c:if>
                  	<c:if test="${not fn:contains(renamefile,',')}">
                  		<img src="/resources/upload/image/${renamefile}" style="width:800px; height:485px; border-radius: 2%">
                  	</c:if>
                  </div>
                  </div>
              </div>
          </div>
        </div>
      </section>
      
      <section class="container mb-5 pb-2" style="border-top: 2px solid black;">
      	<div>
      		<a class="btn btn-outline-primary mb-sm-0 mb-3" style="margin-top: 30px;" href="#modal-reply" data-bs-toggle="modal"><i class="fi-edit me-1"></i>후기 등록</a>
      	</div>
      	<div id="revDiv" style="margin-left: 30px;">
	        	<c:if test="${empty repList}">
	        		댓글이 없습니다.
	        	</c:if>
	        	<c:if test="${!empty repList}">
	        		<c:forEach var="i" begin="0" end="${repList.size() - 1}">
	        			<div class="mb-4 pb-4 border-bottom"><div class="d-flex justify-content-between mb-3"><div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/i3.jpg" width="48" alt="Avatar">
	                    <div class="ps-2"><h6 class="fs-base mb-i">${repList.get(i).id}</h6>
	                </div><span class="text-muted fs-sm">${repList.get(i).createdate}</span></div><p>${repList.get(i).cont}</p>
	            </div></div>
	        		</c:forEach>
	         	</c:if>
	        </div>
	        <!-- Pagination-->
	        <nav class="mt-2 mb-4" aria-label="Reviews pagination" style="margin-left: 30px;">
	            <ul class="pagination">
	                <li class="page-item active d-none d-sm-block" aria-current="page"><a class="page-link" id="page(1)" onclick="goPage(1); return false;">1</a></li>
	                <c:if test="${pageInfo.getEndPage() > 1}">
		    			<c:forEach var="i" begin="2" end="${pageInfo.getEndPage()}">
		    				<li class="page-item d-none d-sm-block"><a class="page-link" id="page(${i})" onclick="goPage(${i}); return false;">${i}</a></li>
		    			</c:forEach>
		    		</c:if>
	                <li class="page-item"><a class="page-next" onclick="goPage(${pageInfo.getNextPage()}); return false;" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
	                <li class="page-item"><a class="page-end" onclick="goPage(${pageInfo.getMaxPage()}); return false;" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>
	            </ul>
	        </nav>
      </section>
      </main>
      
<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="${path}/resources/vendor/rellax/rellax.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />