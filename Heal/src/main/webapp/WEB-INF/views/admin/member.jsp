<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멤버 관리" name="title"/>
</jsp:include>

	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
    
    <main>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">관리자 페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">멤버 관리</li>
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
                  <h2 class="fs-lg mb-0">관리자</h2>
                  <ul class="list-unstyled fs-sm mt-3 mb-0">
                    <li><a class="nav-link fw-normal p-0"><i class="fi-phone opacity-60 me-2"></i>-----</a></li>
                    <li><a class="nav-link fw-normal p-0"><i class="fi-mail opacity-60 me-2"></i>admin@admin.com</a></li>
                  </ul>
                </div>
              </div>
              <div class="collapse d-md-block mt-3" id="account-nav">
                <div class="card-nav">
                	<a class="card-nav-link active" href="${path}/member/admin"><i class="fi-user opacity-60 me-2"></i>멤버 관리</a>
                  <a class="card-nav-link" href="${path}/board/admin"><i class="fi-home opacity-60 me-2"></i>자유게시판 관리</a>
                  <a class="card-nav-link" href="${path}/photo/admin"><i class="fi-home opacity-60 me-2"></i>포토게시판 관리</a>
              </div>
            </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <h1 class="h2">멤버 관리</h1>
            <div class="border-top pt-4 mt-3"></div>
            <h2 class="h5 pt-2 mb-4">멤버 정보</h2>
            <!-- <div class="d-flex border-bottom pb-3 mb-3"><i class="fi-device-desktop fs-5 text-muted me-1"></i>
              <div class="ps-2">
                <div class="fw-bold mb-1">test – 홍길동, 역삼동</div>
                <span class="d-inline-block fs-sm text-muted border-end pe-2 me-2">Chrome</span><span class="fs-sm fw-bold text-success">Active now</span>
              </div>
            </div> -->
            
            <c:if test="${!empty list}">
            	<c:forEach var="i" begin="0" end="${list.size() - 1}">
            		<div class="d-flex border-bottom pb-3 mb-3"><i class="fi-device-mobile fs-5 text-muted me-1"></i>
              <div class="ps-2">
              	<div class="fw-bold mb-1">${list.get(i).id} – ${list.get(i).name}, ${list.get(i).dong}</div>
              </div>
              <div class="align-self-center ms-auto">
                <div class="dropdown">
                  <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
                  <ul class="dropdown-menu pb-3 my-1" aria-labelledby="contextMenu1">
                    <li><a class="d-block px-3" onclick="deleteMember()">멤버 탈퇴</a></li>
                  </ul>
                </div>
              </div>
            </div>
            	</c:forEach>
            </c:if>
            
            
            <script>
            	function deleteMember(no) {
            		if(confirm("정말로 탈퇴시키시겠습니까?!")) {
	    				location.replace('${path}/member/admin?no='+no);
	    			}
            	}
            </script>
            
          </div>
        </div>
      </div>
    </main>
    
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>