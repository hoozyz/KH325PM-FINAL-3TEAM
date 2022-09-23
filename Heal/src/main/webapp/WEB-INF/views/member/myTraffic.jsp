<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerTest.jsp">
	<jsp:param value="나의 교통 예약" name="title"/>
</jsp:include>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">Account</a></li>
            <li class="breadcrumb-item active" aria-current="page">나의 예약</li>
          </ol>
        </nav>
        <!-- Page content-->
        <div class="row">
          <!-- Sidebar-->
          <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
            <!-- Account nav-->
            <div class="card card-body border-0 shadow-sm pb-1 me-lg-1">
              <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" src="img/avatars/03.jpg" width="48" alt="Annette Black">
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
                  <a class="card-nav-link" href="${path}/shop/myShop"><i class="fi-bell opacity-60 me-2"></i>나의 쇼핑</a>
                  <a class="card-nav-link" href="${path}/like/myLike"><i class="fi-heart opacity-60 me-2"></i>나의 찜</a>
                  <a class="card-nav-link" href="${path}/review/myReview"><i class="fi-star opacity-60 me-2"></i>나의 리뷰/댓글</a>
              </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <div class="d-flex align-items-center justify-content-between mb-3">
            <h1>나의 교통 예약</h1>
            </div>
            <!-- Nav tabs-->
            <ul class="nav nav-tabs border-bottom mb-4" role="tablist">
              <li class="nav-item mb-3"><a class="nav-link" href="${path}/reserve/myCamp" role="tab" aria-selected="false"><i class="fi-file fs-base me-2"></i>캠핑장/숙박</a></li>
              <li class="nav-item mb-3"><a class="nav-link active" href="${path}/reserve/myTraffic" role="tab" aria-selected="true"><i class="fi-file-clean fs-base me-2"></i>교통</a></li>
            </ul>
            <!-- Item-->
            <c:if test="${airList != null}">
            	<c:forEach var="i" begin="0" end="${airList.size() - 1}">
		            <div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/catalog/08.jpg);">
		                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${airList.get(i).airline}</span></div></a> <!-- 항공사 명 -->
		              <div class="card-body position-relative pb-3">
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
		                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                  	<%-- <li> 나중에 지도에 넣을거면 쓸 코드
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/reserve/delete?no=${airReserve.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>위치 보기</button>
		                    </li> --%>
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/reserve/delete?no=${airReserve.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                </div>
		                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${airList.get(i).flight}</h4>
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${airList.get(i).startsta} >> ${airList.get(i).endsta}</a></h3>
		                <p class="mb-2 fs-sm text-muted">${airList.get(i).starttime} ~ ${airList.get(i).endtime}</p>
		                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${airReserve.get(i).price} 원 | ${airReserve.get(i).count} 명</div>
		              </div>
		            </div>
            	</c:forEach>
            </c:if>
            <!-- Item-->
            <c:if test="${trainList != null}"> <!-- 나중에 교통 예매할 때(reserve 테이블에 넣을때) 가격없으면 없애기. -->
            	<c:forEach var="i" begin="0" end="${trainList.size() - 1}">
		            <div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/catalog/08.jpg);">
		                <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${trainList.get(i).trainclass}</span></div></a>
		              <div class="card-body position-relative pb-3">
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
		                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/reserve/delete?no=${trainReserve.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                </div>
		                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${trainList.get(i).railname}</h4>
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${trainList.get(i).startsta} >> ${trainList.get(i).endsta}</a></h3>
		                <p class="mb-2 fs-sm text-muted">${trainList.get(i).starttime} ~ ${trainList.get(i).endtime}</p>
		                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${trainReserve.get(i).price} 원 | ${trainReserve.get(i).count} 명</div>
		              </div>
		            </div>
            </c:forEach>
            </c:if>
            <!-- Item-->
            <c:if test="${busList != null}"> <!-- 버스  -->
            	<c:forEach var="i" begin="0" end="${busList.size() - 1}">
		            <div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/catalog/08.jpg);">
		              <div class="card-body position-relative pb-3">
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
		                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/reserve/delete?no=${busReserve.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                </div>
		                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">For rent</h4>
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${busList.get(i).startsta} >> ${busList.get(i).endsta}</a></h3>
		                <p class="mb-2 fs-sm text-muted">출발시간 : ${busReserve.get(i).starttime} | 소요시간 : ${busList.get(i).wastetime}</p>
		                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${busReserve.get(i).price} 원 | ${busReserve.get(i).count} 명</div>
		              </div>
		            </div>
            </c:forEach>
            </c:if>
          </div>
        </div>
      </div>
    </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>