<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="나의 리뷰" name="title"/>
</jsp:include>

<style>
	a{
		text-decoration: none;
	}
</style>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">HEALERS</a></li>
            <li class="breadcrumb-item"><a href="${path}/member/myInfo">마이페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">나의 리뷰</li>
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
                  <a class="card-nav-link" href="${path}/reserve/myCamp"><i class="fi-calendar opacity-60 me-2"></i>나의 예약</a>
                  <a class="card-nav-link" href="${path}/photo/myPhoto"><i class="fi-file opacity-60 me-2"></i>나의 게시글</a>
                  <a class="card-nav-link" href="${path}/like/myLike"><i class="fi-heart opacity-60 me-2"></i>나의 찜</a>
                  <a class="card-nav-link active" href="${path}/review/myReview"><i class="fi-star opacity-60 me-2"></i>나의 리뷰/댓글</a>
              </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <h1 class="h2">나의 리뷰/댓글</h1>
            <!-- Nav tabs-->
            <ul class="nav nav-tabs flex-column flex-sm-row align-items-stretch align-items-sm-start border-bottom mb-4" role="tablist">
              <li class="nav-item me-sm-3 mb-3"><a class="nav-link text-center active" href="#review" data-bs-toggle="tab" role="tab" aria-controls="reviews-about-you" aria-selected="true">나의 리뷰</a></li>
              <li class="nav-item mb-3"><a class="nav-link text-center" href="#reply" data-bs-toggle="tab" role="tab" aria-controls="reviews-by-you" aria-selected="false">나의 댓글</a></li>
            </ul>
            <!-- Tabs content-->
            <div class="tab-content pt-2">
              <!-- Reviews about you tab-->
              <div class="tab-pane fade show active" id="review" role="tabpanel">
                <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                </div>
                <c:if test="${empty revList}">
                	리뷰내역이 없습니다.
                </c:if>
                <c:if test="${!empty revList}">
            		<c:forEach var="i" begin="0" end="${revList.size() - 1}">
			        	<c:if test="${revList.get(i).getCampno() != 0}"> <!-- 캠프에 관한 리뷰 -->
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="${path}/resources/image/avatar.png" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <a href="${path}/camp/detail?no=${revList.get(i).campno}"><h6 class="fs-base mb-0"><span class="badge bg-primary">캠핑장명</span>&nbsp :&nbsp&nbsp ${revList.get(i).title}</h6></a>
		                        <span class="star-rating">
								<c:forEach var="j" begin="1" end="5"> <!-- 별점 숫자만큼 별개수 -->
									<c:if test="${revList.get(i).revstar >= j}">
		                       			<i class="star-rating-icon fi-star-filled active"></i>
									</c:if>
									<c:if test="${revList.get(i).revstar < j}">
										<i class="star-rating-icon fi-star"></i>
									</c:if>
								</c:forEach>
		                        </span>
		                      </div>
		                    </div><span class="text-muted fs-sm"><fmt:formatDate value="${revList.get(i).createdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
		                  </div>
		                  <p>${revList.get(i).cont}</p>
		                  <div class="d-flex align-items-center">
		                    <i class="fi-like"></i><span>(${revList.get(i).revlike})</span>
		                    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 770px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/board/delete?no=${boardList.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		                </c:if>
		                <c:if test="${revList.get(i).getHotelno() != 0}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="${path}/resources/image/avatar.png" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <a href="${path}/hotel/detail?no=${revList.get(i).hotelno}"><h6 class="fs-base mb-0"><span class="badge bg-secondary">호텔명</span>&nbsp :&nbsp&nbsp ${revList.get(i).title}</h6></a>
		                        <span class="star-rating">
								<c:forEach var="j" begin="1" end="5"> <!-- 별점 숫자만큼 별개수 -->
									<c:if test="${revList.get(i).revstar >= j}">
		                       			<i class="star-rating-icon fi-star-filled active"></i>
									</c:if>
									<c:if test="${revList.get(i).revstar < j}">
										<i class="star-rating-icon fi-star"></i>
									</c:if>
								</c:forEach>
		                        </span>
		                      </div>
		                      
		                      
		                     </div><span class="text-muted fs-sm"><fmt:formatDate value="${revList.get(i).createdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
		                    
		                    
		                  </div>
		                  <p>${revList.get(i).cont}</p>
		                  <div class="d-flex align-items-center">
		                    <i class="fi-like"></i><span>(${revList.get(i).revlike})</span>
		                    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 770px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteRev(${revList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		                </c:if>
		                <c:if test="${revList.get(i).getFestivalno() != 0}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="${path}/resources/image/avatar.png" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <a href="${path}/festival/detail?no=${revList.get(i).festivalno}"><h6 class="fs-base mb-0"><span class="badge bg-warning">축제명</span>&nbsp :&nbsp&nbsp ${revList.get(i).title}</h6></a>
		                        <span class="star-rating">
								<c:forEach var="j" begin="1" end="5"> <!-- 별점 숫자만큼 별개수 -->
									<c:if test="${revList.get(i).revstar >= j}">
		                       			<i class="star-rating-icon fi-star-filled active"></i>
									</c:if>
									<c:if test="${revList.get(i).revstar < j}">
										<i class="star-rating-icon fi-star"></i>
									</c:if>
								</c:forEach>
		                        </span>
		                      </div>
		                     </div><span class="text-muted fs-sm"><fmt:formatDate value="${revList.get(i).createdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
		                  </div>
		                  <p>${revList.get(i).cont}</p>
		                  <div class="d-flex align-items-center">
		                    <i class="fi-like"></i><span>(${revList.get(i).revlike})</span>
		                    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 770px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteRev(${revList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		                </c:if>
		                <c:if test="${revList.get(i).getFoodno() != 0}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="${path}/resources/image/avatar.png" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <a href="${path}/near/foodDetail?no=${revList.get(i).foodno}"><h6 class="fs-base mb-0"><span class="badge bg-info">음식점명</span>&nbsp :&nbsp&nbsp ${revList.get(i).title}</h6></a>
		                        <span class="star-rating">
								<c:forEach var="j" begin="1" end="5"> <!-- 별점 숫자만큼 별개수 -->
									<c:if test="${revList.get(i).revstar >= j}">
		                       			<i class="star-rating-icon fi-star-filled active"></i>
									</c:if>
									<c:if test="${revList.get(i).revstar < j}">
										<i class="star-rating-icon fi-star"></i>
									</c:if>
								</c:forEach>
		                        </span>
		                      </div>
		                     </div><span class="text-muted fs-sm"><fmt:formatDate value="${revList.get(i).createdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
		                  </div>
		                  <p>${revList.get(i).cont}</p>
		                  <div class="d-flex align-items-center">
		                    <i class="fi-like"></i><span>(${revList.get(i).revlike})</span>
		                    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 770px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteRev(${revList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		                </c:if>
		                <c:if test="${revList.get(i).getParkno() != 0}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="${path}/resources/image/avatar.png" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <a href="${path}/park/detail?no=${revList.get(i).parkno}"><h6 class="fs-base mb-0"><span class="badge bg-success">공원명</span>&nbsp :&nbsp&nbsp ${revList.get(i).title}</h6></a>
		                        <span class="star-rating">
								<c:forEach var="j" begin="1" end="5"> <!-- 별점 숫자만큼 별개수 -->
									<c:if test="${revList.get(i).revstar >= j}">
		                       			<i class="star-rating-icon fi-star-filled active"></i>
									</c:if>
									<c:if test="${revList.get(i).revstar < j}">
										<i class="star-rating-icon fi-star"></i>
									</c:if>
								</c:forEach>
		                        </span>
		                      </div>
		                    </div><span class="text-muted fs-sm"><fmt:formatDate value="${revList.get(i).createdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
		                  </div>
		                  <p>${revList.get(i).cont}</p>
		                  <div class="d-flex align-items-center">
		                    <i class="fi-like"></i><span>(${revList.get(i).revlike})</span>
		                    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 770px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteRev(${revList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		                </c:if>
              		</c:forEach>
              	</c:if>
              </div>
              <!-- 댓글 -->
              <div class="tab-pane fade" id="reply" role="tabpanel">
                <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                </div>
                <c:if test="${empty repList}">
                	댓글내역이 없습니다.
                </c:if>
                <c:if test="${!empty repList}">
            		<c:forEach var="i" begin="0" end="${repList.size() - 1}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="pe-2">
		                      <h6 class="mb-0">포토게시판 제목&nbsp :&nbsp&nbsp ${repList.get(i).title}</h6>
		                    </div><span class="text-muted fs-sm">${repList.get(i).modifydate}</span>
		                  </div>
		                  <div style="display: inline-block;">
	                  		<div style="word-break:break-all; width: 700px; float: left;">&nbsp&nbsp&nbsp&nbsp ${repList.get(i).cont}</div>
		                <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteRev(${repList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
	                		</div>
		                </div>
                	</c:forEach>
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <script>
   			function deleteRev(no) {
   				if(confirm("정말로 삭제하시겠습니까?!")) {
   					location.href='${path}/review/delete?no=' + no;
   				}
   			}
   			function deleteRev(no) {
   				if(confirm("정말로 삭제하시겠습니까?!")) {
   					location.href='${path}/reply/delete?no=' + no;
   				}
   			}
   	</script>
   	
   	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>