<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포토게시글" name="title"/>
</jsp:include>

	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css"/>
	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
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
                        	<input type="hidden" name="photono" value="${photo.no}">
                            <div class="mb-3">
                                <label class="form-label" for="review-name">아이디<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-id" name="id" value="${loginMember.id}" readonly>
                                <div class="invalid-feedback">아이디을 입력해주세요.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">내용<span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" name="cont" rows="5" placeholder="자유롭게 의견을 적어주세요." required></textarea>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="댓글 작성">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
<main>
	<div class="container mt-5 mb-md-4 pt-5">
        <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">HEALERS</a></li>
            <li class="breadcrumb-item active" aria-current="page">포토게시판</li>
          </ol>
        </nav>
      </div>
         
    <section class="container mb-5 pb-2">
        <div class="row align-items-center justify-content-center">
        	<!-- Hero content-->
          <form class="col-lg-4 col-md-5 col-sm-9 order-md-1 order-2 text-md-start text-center" id="photoForm" method="get">
            <c:if test="${loginMember != null}">
	          	<input type="hidden" name="no" value="${photo.no}">
	            <div>
	            	<div class="mb-4 h1" style="float: left;">제목</div>
		            <div style="margin-left: 150px;">작성자 : ${photo.id}</div>
		           		
		           		<c:set var = "string1" value = "${photo.modifydate}"/>
		            <div style="margin-left: 150px;">작성일 : ${fn:substring(string1, 0, 19)}</div>
		            
	            </div>
	          	<c:if test="${loginMember.no == photo.memberno}">
	          		<input class="form-control" name="title" type="text" value="${photo.title}">
	          		<p class="fs-lg" style="margin-top: 20px; margin-left:10px;">내용</p>
	            	<textarea class="form-control" style="height:220px; width: 100%; margin-bottom: 20px;" name="cont" id="update-content">${photo.cont}</textarea>
	            	<input class="btn btn-primary btn-lg rounded-pill" formaction="${path}/photo/update" type="submit" value="수정" style="float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">
            		<input class="btn btn-primary btn-lg rounded-pill" onclick="deletePhoto(${photo.no})" formaction="${path}/photo/delete" type="submit" value="삭제" style="float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">
	          	</c:if>
	          	<c:if test="${loginMember.no != photo.memberno}">
	          		<input class="form-control" name="title" type="text" value="${photo.title}" readonly>
	          		<p class="fs-lg" style="margin-top: 20px; margin-left:10px;">내용</p>
	            	<textarea class="form-control" style="height:220px; width: 100%;" name="cont" id="update-content" readonly>${photo.cont}</textarea>
	          	</c:if>
	          	<c:if test="${loginMember.id == 'admin'}">
	          		<input class="form-control" name="title" type="text" value="${photo.title}" readonly>
	          		<p class="fs-lg" style="margin-top: 20px; margin-left:10px;">내용</p>
	            	<textarea class="form-control" style="height:220px; width: 100%;" name="cont" id="update-content" readonly>${photo.cont}</textarea>
	            	<input class="btn btn-primary btn-lg rounded-pill" onclick="deletePhoto(${photo.no})" formaction="${path}/photo/delete" type="submit" value="삭제" style="float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">
	          	</c:if>
            </c:if>
            <c:if test="${loginMember == null}">
            	<div>
	            	<div class="mb-4 h1" style="float: left;">제목</div>
		            <div style="margin-left: 150px;">작성자 : ${photo.id}</div>
		            <div style="margin-left: 150px;">작성일 : ${photo.modifydate}</div>
	            </div>
            	<input class="form-control" name="title" type="text" value="${photo.title}" readonly>
	          		<p class="fs-lg" style="margin-top: 20px; margin-left:10px;">내용</p>
	            	<textarea class="form-control" style="height:220px; width: 100%; margin-bottom: 20px;" name="cont" id="update-content" readonly>${photo.cont}</textarea>
            </c:if>
          </form>
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
      		<c:if test="${loginMember != null}">
      			<a class="btn btn-outline-primary mb-sm-0 mb-3" style="margin-left: 30px; margin-top: 30px;" href="#modal-reply" data-bs-toggle="modal"><i class="fi-edit me-1"></i>댓글 작성</a>
      		</c:if>
      		<c:if test="${loginMember == null}">
      			<a class="btn btn-outline-primary mb-sm-0 mb-3" style="margin-left: 30px; margin-top: 30px;" href="#signin-modal" data-bs-toggle="modal"><i class="fi-edit me-1"></i>댓글 작성</a>
      		</c:if>
      	</div>
      	<div id="revDiv" style="margin-left: 30px; margin-top: 30px;">
	        	<c:if test="${empty repList}">
	        		댓글이 없습니다.
	        	</c:if>
	        	<c:if test="${!empty repList}">
	        		<c:forEach var="i" begin="0" end="${repList.size() - 1}">
	        			<div class="mb-4 pb-4 border-bottom"><div class="d-flex justify-content-between mb-3">
	        			<div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/i3.jpg" width="48" alt="Avatar">
	                    <div class="ps-2"><h6 class="fs-base mb-i">${repList.get(i).id}</h6>${repList.get(i).cont}</div></div>
	                    <p>${repList.get(i).modifydate}</p>
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
      
      <script>
      function deletePhoto(no) {
    	  if(confirm("정말로 삭제하시겠습니까?!")) {
  		}
      }
      
      function goPage(no) {
  		var photo = ${photo.no}; 
  		
  		console.log(sort)
  		
  		$.ajax({
  			type: 'GET',
  			url: "/reply/list",
  			data: {
  				page: no,
  				photo: photo
  			},
  			
  			success:function(map) {
  				console.log(map)	
  				var list = map.list;
  				var pageInfo = map.pageInfo;
  				console.log(list)
  				
  				str = "";
  				$.each(list, function (i, obj) { // list.get(i) = obj   
                  	str += '	<div class="mb-4 pb-4 border-bottom"><div class="d-flex justify-content-between mb-3"><div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">          '
                      str += '        <div class="ps-2"><h6 class="fs-base mb-0">'+ obj.id +'</h6>                                                                                                                                                      '
                      str += '            <span class="star-rating">   '
                      for(var j = 1; j <= 5; j++) {
                      	if(j <= obj.revstar) {
                      		str += '<i class="star-rating-icon fi-star-filled active"></i>'
                      	} else {
                      		str += '<i class="star-rating-icon fi-star"></i>'
                      	}
                      }
                      var revNo = obj.no
                      var like = obj.revlike
                      str += '            </span></div>                                                                                                                                                                                                         '
                      str += '    </div><span class="text-muted fs-sm">'+ obj.createdate +'</span></div><p>'+ obj.cont +'</p>                                                                                                                   '
                      str += '<div class="d-flex align-items-center" id="like'+ revNo +'"><button class="btn-like" type="button" onclick="likePlus('+ revNo +')"><i class="fi-heart"></i>(<span id="revLike'+ revNo +'">'+ like +'</span>)</button></div></div>                       '
                  	str += '</div>                                                                                                                              '                                                                                             
  				});                                                                                                                                                                                                                                           
  				
  				$("#revDiv").html(str);
  				
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
	            		str += '<li class="page-item"><a class="page-end" onclick="goPage('+ endPage +'); return false;" aria-label="Next"><i class="fi-chevrons-right"></i></a></li>';
	            	}
       			
       			$('.pagination').html(str);
  			},
  			
  			error:function(e) {
  				console.log(e)
  			}
  		});
  	}
      </script>
      
<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="${path}/resources/vendor/rellax/rellax.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />