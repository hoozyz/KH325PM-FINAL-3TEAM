<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="나의 캠핑장 예약" name="title"/>
</jsp:include>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">마이페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">나의 예약</li>
          </ol>
        </nav>
        <!-- Page content-->
        <div class="row">
          <!-- Sidebar-->
          <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
            <!-- Account nav-->
            <div class="card card-body border-0 shadow-sm pb-1 me-lg-1">
              <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" src="${path}/resources/image/13.png" width="48" alt="Annette Black">
                <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3">
                  <h2 class="fs-lg mb-0">${loginMember.name}</h2>
                  <ul class="list-unstyled fs-sm mt-3 mb-0">
                    <li><a class="nav-link fw-normal p-0"><i class="fi-phone opacity-60 me-2"></i>${loginMember.phone}</a></li>
                    <li><a class="nav-link fw-normal p-0"><i class="fi-mail opacity-60 me-2"></i>${loginMember.email}</a></li>
                  </ul>
                </div>
              </div>
              <div class="collapse d-md-block mt-3" id="account-nav">
                <div class="card-nav">
                  <a class="card-nav-link" href="${path}/member/myInfo"><i class="fi-user opacity-60 me-2"></i>나의 정보</a>
                  <a class="card-nav-link active" href="${path}/reserve/myCamp"><i class="fi-home opacity-60 me-2"></i>나의 예약</a>
                  <a class="card-nav-link" href="${path}/photo/myPhoto"><i class="fi-home opacity-60 me-2"></i>나의 게시글</a>
                  <a class="card-nav-link" href="${path}/like/myLike"><i class="fi-heart opacity-60 me-2"></i>나의 찜</a>
                  <a class="card-nav-link" href="${path}/review/myReview"><i class="fi-star opacity-60 me-2"></i>나의 리뷰/댓글</a>
              </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <h1>나의 캠핑장 예약</h1>
            <!-- Nav tabs-->
            <ul class="nav nav-tabs border-bottom mb-4" role="tablist">
              <li class="nav-item mb-3"><a class="nav-link active" href="${path}/reserve/myCamp" role="tab" aria-selected="true"><i class="fi-file fs-base me-2"></i>캠핑장/숙박</a></li>
              <li class="nav-item mb-3"><a class="nav-link" href="${path}/reserve/myTraffic" role="tab" aria-selected="false"><i class="fi-file-clean fs-base me-2"></i>교통</a></li>
            </ul>
            <c:if test="${empty campList && empty hotelList}"> <!-- 다 없을때 -->
            	예약내역이 없습니다.
            </c:if>
            
            <!-- Item-->
            <c:if test="${!empty campList}">
            	<c:forEach var="i" begin="0" end="${campList.size() - 1}">
		           	<div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="${path}/camp/detail?no=${campList.get(i).no}" style="background-image: url(${campList.get(i).image});">
		                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${campReserve.get(i).reservedate}</span></div></a>
		              		<div class="card-body position-relative pb-3">
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
		                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteReserve(${campReserve.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                </div>
		                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${campList.get(i).category}</h4>
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${campList.get(i).name}</a></h3>
		                <p class="mb-2 fs-sm text-muted">${campList.get(i).addr}</p>
		                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${campReserve.get(i).price} 원</div>
		                <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
		                <span class="d-inline-block me-4 fs-sm"><i class="fi-bed ms-1 mt-n1 fs-lg text-muted">${campReserve.get(i).count}</i></span> <!-- 캠핑장은 인원 대신 소형/중형/대형 -> x인용 적어주기  -->
		                </div>
		              </div>
		            </div>
            	</c:forEach>
            </c:if>
            <!-- Item-->
            <c:if test="${!empty hotelList}">
            	<c:forEach var="i" begin="0" end="${hotelList.size() - 1}"> <!-- 전에꺼 가져와서 버튼 id 만들기 -->
		            		<div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="${path}/hotel/detail?no=${hotelList.get(i).no}" style="background-image: url();"> <!-- 호텔 이미지 없음. -->
		                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${hotelReserve.get(i).reservedate}</span></div></a>
		              <div class="card-body position-relative pb-3">
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
		                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteReserve(${hotelReserve.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                </div>
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${hotelList.get(i).name}</a></h3>
		                <p class="mb-2 fs-sm text-muted">${hotelList.get(i).addr}</p>
		                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${hotelReserve.get(i).price} 원</div>
		                <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
		                <span class="d-inline-block me-4 fs-sm"><i class="fi-bed ms-1 mt-n1 fs-lg text-muted">${hotelReserve.get(i).count}</i></span>
		                </div>
		              </div>
		            </div>
            	</c:forEach>
            </c:if>
          </div>
        </div>
      </div>
    </main>
    
   	<script>
	   	function deleteReserve(no) {
	   		console.log(no)
	   		if(confirm("정말로 삭제하시겠습니까?!")) {
	   			location.href='${path}/reserve/delete?no=' + no;
	   		}
	   	}
   	</script>
    
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>