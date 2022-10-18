<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판 관리" name="title"/>
</jsp:include>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">관리자 페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">자유게시판 관리</li>
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
                  <a class="card-nav-link active" href="${path}/board/admin"><i class="fi-home opacity-60 me-2"></i>자유게시판 관리</a>
                  <a class="card-nav-link" href="${path}/photo/admin"><i class="fi-home opacity-60 me-2"></i>포토게시판 관리</a>
              </div>
            </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <h1 class="h2">자유게시판 관리</h1>
            <!-- Tabs content-->
            <div class="tab-content pt-2">
              <!-- Reviews about you tab-->
              <div class="tab-pane fade show active" id="review" role="tabpanel">
                <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                <h3 class="h4 mb-sm-0"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>총 게시글 수 : ${count}개</h3>
                </div>
               <div id="board">
               	 <c:if test="${!empty list}">
            		<c:forEach var="i" begin="0" end="${list.size() - 1}">
		                <!-- Review-->
		                <div class="mb-4 pb-4 border-bottom">
		                  <div class="d-flex justify-content-between mb-3">
		                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">
		                      <div class="ps-2">
		                        <h6 class="fs-base mb-0">${list.get(i).title}</h6><span class="star-rating">${memList.get(i).id}</span>
		                      </div>
		                    </div><span class="text-muted fs-sm">${list.get(i).modifydate}</span>
		                  </div>
		                  <div style="display: inline-block;">
	                  		<div style="word-break:break-all; width: 700px; float: left;">&nbsp&nbsp&nbsp&nbsp ${list.get(i).cont}</div>
		                <button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
		                  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">
		                    <li>
		                      <button class="dropdown-item" type="button" onclick="deleteBoard(${list.get(i).no})"><i class="fi-trash opacity-60 me-2"></i>게시글 삭제</button>
		                    </li>
		                  </ul>
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
      </div>
    </main>
    
    <script>
    	function goPage(no) {
			$.ajax({
				type: 'GET',
				url: "/board/list",
				data: {
					page: no,
					type: 1 // admin 체크
				},
				
				success:function(map) {
					var list = map.list;
					var pageInfo = map.pageInfo;
					var memList = map.memList;
					
					str = "";
					$.each(list, function (i, obj) { // list.get(i) = obj
						var id = memList[i].id;
						str += '<div class="mb-4 pb-4 border-bottom">                                                                                                                                                                                                      '
		                str += '  <div class="d-flex justify-content-between mb-3">                                                                                                                                                                                        '
		                str += '    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">                                                                                                         '
		                str += '      <div class="ps-2">                                                                                                                                                                                                                   '
		                str += '        <h6 class="fs-base mb-0">'+ obj.title +'</h6><span class="star-rating">'+ id +'</span>                                                                                                                            '
		                str += '      </div>                                                                                                                                                                                                                               '
		                str += '    </div><span class="text-muted fs-sm">'+ obj.modifydate +'</span>                                                                                                                                                                  '
		                str += '  </div>    '
			            str += '    	<div style="display: inline-block;">                                                                                                                                                                                               '
	                  	str += '	<div style="word-break:break-all; width: 700px; float: left;">&nbsp&nbsp&nbsp&nbsp '+ obj.cont +'</div>                                                                                                                           '
		                str += '<button class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" type="button" style="float: left; margin-left: 120px;" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>  '
		                str += '  <ul class="dropdown-menu my-1" aria-labelledby="contextMenu1">                                                                                                                                                                           '
		                str += '    <li>                                                                                                                                                                                                                                   '
		                str += '      <button class="dropdown-item" type="button" onclick="deleteBoard('+ obj.no +')"><i class="fi-trash opacity-60 me-2"></i>게시글 삭제</button>                                                                                                     '
		                str += '    </li>                                                                                                                                                                                                                                  '
		                str += '  </ul>'
	                	str += '	</div>'
		                str += '</div>    '
					});                                                                                                                                                                                                                                           
					
					$("#board").html(str);
					
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
		
   		function deleteBoard(no) {
	   		if(confirm("정말로 삭제하시겠습니까?!")) {
	   			location.href='${path}/board/admin?no=' + no;
	   		}
	   	}
   	</script>

 	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>