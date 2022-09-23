<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerTest.jsp">
	<jsp:param value="나의 게시글" name="title"/>
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
                  <a class="card-nav-link active" href="${path}/member/myInfo"><i class="fi-user opacity-60 me-2"></i>나의 정보</a>
                  <a class="card-nav-link" href="${path}/reserve/myCamp"><i class="fi-home opacity-60 me-2"></i>나의 예약</a>
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
            <h1>나의 게시글</h1>
            </div>
            <!-- Nav tabs-->
            <ul class="nav nav-tabs border-bottom mb-4" role="tablist">
              <li class="nav-item mb-3"><a class="nav-link" href="${path}/photo/myPhoto" role="tab" aria-selected="false"><i class="fi-file fs-base me-2"></i>포토게시판</a></li>
              <li class="nav-item mb-3"><a class="nav-link active" href="${path}/board/myBoard" role="tab" aria-selected="true"><i class="fi-file-clean fs-base me-2"></i>자유게시판</a></li>
            </ul>
            <!-- Item-->
            <c:if test="${boardList != null}">
            	<c:forEach var="i" begin="0" end="${boardList.size() - 1}">
			            <div class="mb-4 pb-4 border-bottom">
	                  <div class="d-flex justify-content-between mb-3">
	                    <div class="d-flex align-items-center pe-2">
	                    <div class="ps-2">
                        <h6 class="fs-base mb-0">${boardList.get(i).title}</h6>
                      </div>
	                    </div><span class="text-muted fs-sm">&nbsp ${boardList.get(i).createdate}</span>
	                  </div>
	                  	<div style="display: inline-block;">
	                  		<div style="word-break:break-all; width: 700px; float: left;">&nbsp&nbsp&nbsp&nbsp ${boardList.get(i).cont}</div>
		                <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="location.href='${path}/board/delete?no=${boardList.get(i).no}'"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
	                		</div>
	                  	</div>
            	</c:forEach>
            </c:if>
          </div>
        </div>
      </div>
      </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>