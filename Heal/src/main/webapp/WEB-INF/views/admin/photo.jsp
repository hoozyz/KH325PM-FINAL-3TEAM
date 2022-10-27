<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시판 관리" name="title"/>
</jsp:include>

<!-- Page content-->
<main>
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
              <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" src="${path}/resources/image/13.png" width="48" alt="Annette Black">
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
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                <h3 class="h4 mb-sm-0"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>총 게시글 수 : ${count}개</h3>
            </div>
            <c:if test="${empty list}">
            	포토게시글이 없습니다.
            </c:if>
            <!-- Item-->
            <div id="photo">
            	<c:if test="${!empty list}">
            	<c:forEach var="i" begin="0" end="${list.size() - 1}">
           			<div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
           			<c:set var="renamefile" value="${list.get(i).renamefile}"/>
           			<c:if test="${fn:contains(renamefile,',')}">
                        <c:set var="split" value="${fn:split(renamefile,',')}"/>
                        <a class="card-img-top" href="${path}/photo/view?no=${list.get(i).no}" style="background-image: url(/resources/upload/image/${split[0]});">
                    </c:if>
                    <c:if test="${not fn:contains(renamefile,',')}">
                    	<a class="card-img-top" href="${path}/photo/view?no=${list.get(i).no}" style="background-image: url(/resources/upload/image/${list.get(i).renamefile});">
                    </c:if>
             		   <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">${list.get(i).category}</span></div></a>
		         		<div class="card-body position-relative pb-3">
		                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="${path}/photo/view?no=${list.get(i).no}">${list.get(i).title}</a></h3>
		                <p class="mb-2 fs-sm text-muted" style="word-break:break-all;">${list.get(i).cont}</p>
		                <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
		                <span class="d-inline-block me-4 fs-sm">조회수 : ${list.get(i).readcount}</span>
		                <span class="d-inline-block me-4 fs-sm">작성일 : ${list.get(i).modifydate}</span>
		                <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3" style="padding-top: 105px;">
		                <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deletePhoto(${list.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
		                    </li>
		                  </ul>
		                  </div>
		                </div>
		              </div>
		            </div>
            	</c:forEach>
            </c:if>
            </div>
            
            <!-- Pagination-->
          <nav class="mt-2 mb-4" aria-label="Reviews pagination">
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
          </div>
        </div>
      </div>
      </main>
      
       <script>
   		function goPage(no) {
			$.ajax({
				type: 'GET',
				url: "/photo/ajax",
				data: {
					page: no
				},
				
				success:function(map) {
					var list = map.list;
					var pageInfo = map.pageInfo;
					var memList = map.memList;
					console.log(list)
					str = "";
					$.each(list, function (i, obj) { // list.get(i) = obj
						var id = memList[i].id;
						var file = obj.renamefile;
						str += '<div class="card card-hover card-horizontal border-0 shadow-sm mb-4">   '
						if(file.includes(',')) {
							var split = file.split(',');
							console.log(split[0])
		                    str += '    <a class="card-img-top" href="${path}/photo/view?no='+obj.no+'" style="background-image: url(/resources/upload/image/'+split[0]+');">                                                                                   '
						} else {
		                    str += '	<a class="card-img-top" href="${path}/photo/view?no='+obj.no+'" style="background-image: url(/resources/upload/image/'+file+');">                                                                     '
						}
	             		str += '   <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-info">'+obj.category+'</span></div></a>                                                                                            '
			         	str += '	<div class="card-body position-relative pb-3">                                                                                                                                                                                '
			            str += '    <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="${path}/photo/view?no='+obj.no+'">'+obj.title+'</a></h3>                                                                                                '
			            str += '    <p class="mb-2 fs-sm text-muted" style="word-break:break-all;">'+obj.cont+'</p>                                                                                                                                        '
			            str += '    <div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">                                                                                                 '
			            str += '    <span class="d-inline-block me-4 fs-sm">조회수 : '+obj.readcount+'</span>                                                                                                                                              '
			            str += '    <span class="d-inline-block me-4 fs-sm">작성일 : '+obj.modifydate+'</span>                                                                                                                                             '
			            str += '    <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3" style="padding-top: 105px;">                                                                                                                           '
			            str += '    <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>  '
			            str += '      <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">                                                                                                                                                              '
			            str += '        <li>                                                                                                                                                                                                                      '
			            str += '          <button class="dropdown-item" type="button" onclick="deletePhoto('+obj.no+')"><i class="fi-trash opacity-60 me-2"></i>삭제</button>                                                                              '
			            str += '        </li>                                                                                                                                                                                                                     '
			            str += '      </ul>   '
			            str += '      </div>  '
			            str += '    </div>    '
			            str += '  </div>      '
			            str += '</div>        '
					});                                                                                                                                                                                                                                           
					
					$("#photo").html(str);
					
					str = "";
					
					var maxPage =     pageInfo.maxPage     ;
	     			var startPage =   pageInfo.startPage   ;
	     			var endPage =     pageInfo.endPage     ;
	     			var currentPage = pageInfo.currentPage ;
	     			var prevPage =    pageInfo.prevPage    ;
	     			var nextPage =    pageInfo.nextPage    ;
	     			var startList =   pageInfo.startList   ;
	     			var endList =     pageInfo.endList     ;
	     			
	     			if(currentPage != 1) {
		            		str += '<li class="page-item"><a class="page-first" onclick="goPage(1); return false;" aria-label="Next"><i class="fi-chevrons-left"></i></a></li>';
		            		str += '<li class="page-item"><a class="page-prev" onclick="goPage('+ prevPage +'}); return false;" aria-label="Next"><i class="fi-chevron-left"></i></a></li>';
		            	} 
		
		            	for (var i = startPage; i <= endPage; i++) { // 페이지 5개마다 페이지 바뀜
		            		if(i == currentPage) {
		            			str += '<li class="page-item active d-none d-sm-block"><a class="page-link" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a></li>';
		            		} else {
		            			str += '<li class="page-item d-none d-sm-block"><a class="page-link" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a></li>';
		            		}
		            	}
		
		            	if(currentPage != maxPage) {
		            		str += '<li class="page-item"><a class="page-next" onclick="goPage('+ nextPage +'); return false;" aria-label="Next"><i class="fi-chevron-right"></i></a></li>';
		            		str += '<li class="page-item"><a class="page-end" onclick="goPage('+ maxPage +'); return false;" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>';
		            	}
	     			
	     			$('.pagination').html(str);
				},
				
				error:function(e) {
					console.log(e)
				}
			});
		}
		
  		function deletePhoto(no) {
	   		if(confirm("정말로 삭제하시겠습니까?!")) {
	   			location.href='${path}/photo/admin?no=' + no;
	   		}
	   	}
  	</script>
   	</script>

 <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>