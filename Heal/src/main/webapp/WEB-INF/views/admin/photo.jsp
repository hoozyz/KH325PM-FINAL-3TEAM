<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시판 관리" name="title"/>
</jsp:include>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">마이페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">포토게시판 관리</li>
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
                  <a class="card-nav-link" href="${path}/member/admin"><i class="fi-user opacity-60 me-2"></i>멤버 관리</a>
                  <a class="card-nav-link" href="${path}/board/admin"><i class="fi-home opacity-60 me-2"></i>자유게시판 관리</a>
                  <a class="card-nav-link active" href="${path}/photo/admin"><i class="fi-home opacity-60 me-2"></i>포토게시판 관리</a>
              </div>
            </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <div class="d-flex align-items-center justify-content-between mb-3">
            <h1>포토게시판 관리</h1>
            </div>
            <!-- Item-->
            <c:if test="${!empty photoList}">
            	<c:forEach var="i" begin="0" end="${photoList.size() - 1}">
           			<div class="card card-hover card-horizontal border-0 shadow-sm mb-4"><a class="card-img-top" href="#" style="background-image: url(${path}/resources/img/campTest.jpg);">
             		   <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${photoList.get(i).category}</span></div></a>
		         		<div class="card-body position-relative pb-3">
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${photoList.get(i).title}</a></h3>
		                <p class="mb-2 fs-sm text-muted" style="word-break:break-all;"><%-- ${photoList.get(i).cont} --%> 길이가 매ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ우 긴 내용</p>
		                <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
		                <span class="d-inline-block me-4 fs-sm">조회수 : ${photoList.get(i).readcount}</span>
		                <span class="d-inline-block me-4 fs-sm">작성일 : ${photoList.get(i).modifydate}</span>
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3" style="padding-top: 105px;">
		                <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deletePhoto(${photoList.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
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
   			function deletePhoto(no) {
   				if(confirm("정말로 삭제하시겠습니까?!")) {
   					location.href='${path}/photo/delete?no=' + no;
   				}
   			}
   	</script>

 <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>