<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="나의 찜" name="title"/>
</jsp:include>

</main>
<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">마이페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">나의 찜</li>
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
                  <a class="card-nav-link" href="${path}/reserve/myCamp"><i class="fi-home opacity-60 me-2"></i>나의 예약</a>
                  <a class="card-nav-link" href="${path}/board/myPhoto"><i class="fi-home opacity-60 me-2"></i>나의 게시글</a>
                  <a class="card-nav-link" href="${path}/shop/myShop"><i class="fi-bell opacity-60 me-2"></i>나의 쇼핑</a>
                  <a class="card-nav-link active" href="${path}/like/myLike"><i class="fi-heart opacity-60 me-2"></i>나의 찜</a>
                  <a class="card-nav-link" href="${path}/review/myReview"><i class="fi-star opacity-60 me-2"></i>나의 리뷰/댓글</a>
              </div>
            </div>
          </aside>
          <div class="col-lg-8 col-md-7 mb-5">
			  <div class="d-flex align-items-center justify-content-between mb-4 pb-2">
			  <h1>나의 찜</h1>
			  </div>
          <!-- Content-->
          <c:if test="${!empty allList}">
            	<c:forEach var="i" begin="0" end="${allList.size() - 1}">
			        <c:if test="${allList.get(i).getClass().toString().contains('Camp')}"> <!-- 캠핑장에 대한 찜일때 -->
			        	<!-- Item-->
			        	<div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
			          <div class="card-img-top position-relative" style="background-image: url(${allList.get(i).image});"><a class="stretched-link" href="real-estate-single-v1.html"></a>
			            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5">
			              <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" onclick="deleteLike(${likeList.get(i).no})" title="찜 삭제"><i class="fi-heart-filled"></i></button>
			            </div>
			          </div>
			          <div class="card-body position-relative pb-3">
			            <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${allList.get(i).category}</h4>
			            <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${allList.get(i).name}</a></h3>
			            <p class="mb-2 fs-sm text-muted">${allList.get(i).addr}</p>
			            <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${allList.get(i).price} 원</div>
			          	</div>
			        	</div>
			        </c:if>
			        <c:if test="${allList.get(i).getClass().toString().contains('Hotel')}"> 
			        	<!-- Item-->
			        	<div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
			          <div class="card-img-top position-relative" style="background-image: url()});"><a class="stretched-link" href="real-estate-single-v1.html"></a>
			            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5">
			              <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" onclick="deleteLike(${likeList.get(i).no})" title="찜 삭제"><i class="fi-heart-filled"></i></button>
			            </div>
			          </div>
			          <div class="card-body position-relative pb-3">
			            <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${allList.get(i).name}</a></h3>
			            <p class="mb-2 fs-sm text-muted">${allList.get(i).addr}</p>
			            <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>${allList.get(i).price} 원</div>
			          	</div>
			        	</div>
			        </c:if>
			        <c:if test="${allList.get(i).getClass().toString().contains('Festival')}"> 
			        <!-- Item-->
			        <div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
			          <div class="card-img-top position-relative" style="background-image: url(img/real-estate/catalog/16.jpg);"><a class="stretched-link" href="real-estate-single-v1.html"></a>
			            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5">
			              <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" onclick="deleteLike(${likeList.get(i).no})" title="찜 삭제"><i class="fi-heart-filled"></i></button>
			            </div>
			          </div>
			          <div class="card-body position-relative pb-3">
			            <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${allList.get(i).place}</h4>
			            <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${allList.get(i).name}</a></h3>
			            <p class="mb-2 fs-sm text-muted">${allList.get(i).addr}</p>
			            <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
			            <span class="d-inline-block me-4 fs-sm">${allList.get(i).startdate} ~ ${allList.get(i).enddate}</span>
			            </div>
			          </div>
			        </div>
			        </c:if>
			        <c:if test="${allList.get(i).getClass().toString().contains('Food')}"> 
			        <!-- Item-->
			        <div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
			          <div class="card-img-top position-relative" style="background-image: url(img/real-estate/catalog/16.jpg);"><a class="stretched-link" href="real-estate-single-v1.html"></a>
			          <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${allList.get(i).type}</span></div>
			            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5">
			            <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" onclick="deleteLike(${likeList.get(i).no})" title="찜 삭제"><i class="fi-heart-filled"></i></button>
			            </div>
			          </div>
			          <div class="card-body position-relative pb-3">
			            <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${allList.get(i).name}</a></h3>
			            <p class="mb-2 fs-sm text-muted">${allList.get(i).addr}</p>
			            <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
			            <span class="d-inline-block me-4 fs-sm">주요음식&nbsp :&nbsp&nbsp ${allList.get(i).main}</span>
			            </div>
			          </div>
			        </div>
			        </c:if>
			        <c:if test="${allList.get(i).getClass().toString().contains('Park')}"> 
			        <!-- Item-->
			        <div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
			          <div class="card-img-top position-relative" style="background-image: url(img/real-estate/catalog/16.jpg);"><a class="stretched-link" href="real-estate-single-v1.html"></a>
			            <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">${allList.get(i).category}</span></div>
			            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5">
			            <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" onclick="deleteLike(${likeList.get(i).no})" title="찜 삭제"><i class="fi-heart-filled"></i></button>
			            </div>
			          </div>
			          <div class="card-body position-relative pb-3">
			            <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${allList.get(i).name}</a></h3>
			            <p class="mb-2 fs-sm text-muted">${allList.get(i).addr}</p>
			            <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
			            <span class="d-inline-block me-4 fs-sm">운동시설 &nbsp :&nbsp&nbsp ${allList.get(i).sport}</span>
			            ></div>
			          </div>
			        </div>
			        </c:if>
            	</c:forEach>
            </c:if>
          </div>
        </div>
      </div>
    </main>
    
    <script>
   			function deleteLike(no) {
   				if(confirm("정말로 삭제하시겠습니까?!")) {
   					location.href='${path}/like/delete?no=' + no;
   				}
   			}
   	</script>
    
     <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>