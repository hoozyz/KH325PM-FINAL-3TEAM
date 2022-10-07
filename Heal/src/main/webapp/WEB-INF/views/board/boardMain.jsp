<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판" name="title"/>
</jsp:include>

<style>
    .board tr {
        cursor: pointer;
    }
    
    .td-no,
    .td-title,
    .td-writer,
    .td-date {
        border-right: 1px solid lightgray;
    }
    
    .board-page>a {
        display: inline-block;
        width: 30px;
        height: 30px;
        color: #222;
        line-height: 30px;
        text-align: center;
        background: #fff;
        margin-right: 8px;
        text-decoration: none;
        cursor: pointer;
    }
    
    .board-page>.page-on {
        border: 1px solid #293243;
        background: #222;
        color: #fff;
        cursor: pointer;
    }
    
    .board-page>.page-prev {
        background-color: #fff;
    }
    
    .board-page>.page-next {
        background-color: #fff;
    }
    
    .board-write>a {
        background: #2a2a4e;
        color: #fff;
        padding: 3px 15px 3px;
        display: inline-block;
        text-align: center;
        border-radius: 50px;
        text-decoration: none;
    }
    
    .board-data > tr {
    	border-bottom: 1px solid lightgray; height: 70px;
    }
    
    
    
    h1 {
             font-family: 'Gugi', cursive;
            font-weight: 800;
            color: black;
            font-size:50px;
   }
   a {
   	text-decoration: none;
   	color: black;
   }     
   
   a:hover{
   text-decoration: none;
   	color: black;
   }
   *{
       font-family: 'NanumSquareRound', sans-serif;
       font-weight: 500;
   
   }
   
   .td-writer{
   text-align:center;
   }
   
   .td-no{
   text-align:center;
   }
   
   .td-date{
   text-align:center;
   }
   
   .td-count{
   text-align:center;
   }
   
   .td-title a{
   margin-left: 10px;
   }
   
</style>


<!-- 글쓰기 팝업-->
        <div class="modal fade" id="write-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="width: 600px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0" style="height: 700px;">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                            <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5" style="width: 100%;">
                                <form class="needs-validation" action="${path}/board/write" method="POST">
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-name">아이디</label>
                                        <input class="form-control" name="id" type="text" value="${loginMember.id}" readonly>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-title">제목</label>
                                        <input class="form-control" name="title" type="text" placeholder="제목을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4" style="height: 350px;">
                                        <label class="form-label mb-2" for="signin-content">내용</label>
                                        <textarea class="form-control" style="height:320px; width:480px; word_wrap:break-word;" name="cont" id="signin-content" placeholder="내용을 입력해주세요" required></textarea>
                                    </div>
                                    <div style="text-align: center;">
                                        <input class="btn  btn-lg rounded-pill" style="width:60%; color: #D9E2F2;background-color:#201627;" type="submit" value="게시글 작성">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 번호, 이름, 제목, 내용, 날짜, 수정, 삭제 -->
        <!-- 게시글 상세 팝업 -->
        <div class="modal fade" id="view-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="width: 750px;">
                <div class="modal-content" style="height: 500px;">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center" style="height: 500px;">
                            <div class="col-md-6" style="width: 750px;padding-bottom: 20px;padding-right: 20px;padding-top: 20px;padding-left: 20px;height: 500px;">
                                <form class="viewForm" method="POST">
                                	<div class style="margin-bottom: 10px;">
                                    NO. <input class="form-no" name="no" style="margin-left: 5px; border:none;" value="123" readonly>
	                                </div>
	                                <div class style="margin-bottom: 10px; float: right;">
	                                    <label class="form-label" for="signup-name">작성자 &nbsp; :&nbsp; 이름&nbsp;&nbsp;&nbsp;|</label>
	                                    <label class="form-label" for="signup-email">&nbsp;&nbsp;&nbsp;날짜 &nbsp;:&nbsp; 2022.08.01</label>
	                                </div>
	                                <div class style="margin-bottom: 20px;">
	                                    <label class="form-label" for="signup-name">&nbsp;&nbsp;제목</label>
	                                    <input class="form-control" name="title" type="text" value="제목" >
	                                </div>
	                                <div class style="margin-bottom: 15px;">
	                                    <label class="form-label" for="signup-name">&nbsp;&nbsp;내용</label>
	                                    <textarea class="form-control" style="height:220px; width: 100%;" name="cont" id="update-content" readonly>내용</textarea>
	                                </div>
	                                <div>
	                                <input class="btn btn-primary btn-lg rounded-pill" formaction="${path}/board/delete" type="submit" value="삭제" style="float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">
                               		</div>
                                <div>
                                	<input class="btn btn-primary btn-lg rounded-pill" formaction="${path}/board/update" type="submit" value="수정" style="float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">
	                            </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="position-absolute top-0 start-0 w-100 bg-dark" style="height: 398px;"></div>
         <div class="container content-overlay mt-5 mb-md-4 py-5">
         <nav class="mb-3 mb-md-4 pt-md-5" aria-label="Breadcrumb">
          <ol class="breadcrumb breadcrumb-light">
            <li class="breadcrumb-item"><a href="${path}/">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="${path}/board/list">자유게시판</a></li>
          </ol>
        </nav>
         <div class="bg-light shadow-sm rounded-3 p-4 p-md-5 mb-2">
        	<section>
            <div style="margin: auto; margin-bottom:30px;">
            <span style="float: left;"><h1>자유게시판</h1></span>
            <span style="float:right; margin-top: 15px;"> 
            <div class="form-group mb-lg-2 rounded-pill" style="height: 40px;width: 300px;float: left;">
                <div class="input-group">
                    <input class="form-control" type="text" id="keyword" placeholder="검색어를 입력하세요">
                    <button class="input-group-text text-muted" onclick="search()"><i class="fi-search"></i></button>
                </div>
            </div>
            </span>


            <div>
                <table class="board" style="width:1200px; margin-top: 30px; margin: 0 auto; border-top: 1px solid black;">
                    <tr style="border-bottom: 1px solid lightgray; height: 50px; text-align:center;">
                        <th style="width:8%; border-right: 1px solid lightgray">번호</th>
                        <th style="border-right: 1px solid lightgray">제목</th>
                        <th style="width:10%; border-right: 1px solid lightgray">작성자</th>
                        <th style="width:15%; border-right: 1px solid lightgray">작성일</th>
                        <th style="width:8%;">조회수</th>
                    </tr>
                    <!-- 공지사항 3개 -->
                    <!-- <tr style="background-color: #c1c1c1; width: 100%; height: 70px; border-bottom: 1px solid lightgray;">
                    	<td class="td-no"></td>
                    	<td class="td-title">
                    	<span style="color:#AB69DD; font-weight:800; margin-right:6px; margin-left:10px;">뉴스</span>
                    	<a href="https://www.nocutnews.co.kr/news/5798033" style= " font-weight:700;">"해상왕 장보고 삶, 뮤지컬로 만든다…'오션스' 쇼케이스"</a>
                    	</td>
                    	<td class="td-writer">관리자</td>
                    	<td class="td-date"></td>
                    	<td class="td-count"></td>
                    </tr>
                    <tr style="background-color: #c1c1c1; width: 100%; height: 70px; border-bottom: 1px solid lightgray;">
                    	<td class="td-no"></td>
                    	<td class="td-title">
                    	<span style="color:#AB69DD; font-weight:800; margin-right:6px; margin-left:10px;">뉴스</span>
                    	<a href="https://www.segye.com/newsView/20220807511675?OutUrl=naver" style= "font-weight:700;">"남자들을 위한 80㎝ 부츠?…2년 만에 돌아온 쇼뮤지컬 ‘킹키부츠’"</a>
                    	</td>
                    	<td class="td-writer">관리자</td>
                    	<td class="td-date"></td>
                    	<td class="td-count"></td>
                    </tr>
                    <tr style="background-color: #c1c1c1; width: 100%; height: 70px; border-bottom: 1px solid lightgray;">
                    	<td class="td-no"></td>
                    	<td class="td-title">
                    	<span style="color:#AB69DD; font-weight:800; margin-right:6px; margin-left:10px;">뉴스</span>
                    	<a href="https://www.yna.co.kr/view/AKR20220805142700005?input=1195m" style= "none;font-weight:700;">"'160년이 지나도 살아있는 고전의 힘…연극 '레 미제라블'"</a>
                    	</td>
                    	<td class="td-writer">관리자</td>
                    	<td class="td-date"></td>
                    	<td class="td-count"></td>
                    </tr> -->
                    <tbody class="board-data">
                    	<c:if test="${!empty boardList}">
                    		<c:forEach var="i" begin="0" end="${boardList.size() -1}">
                    			<tr style="width: 100%; height: 70px; background-color: #f1f1f1;">
	                            <td class="td-no">${boardList.get(i).no}</td>
	                            <td class="td-title">
	                            <a href="#view-modal" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="goView(${boardList.get(i).no}); return false;">${boardList.get(i).title}</a>
	                            </td>
	                            <td class="td-writer">${boardList.get(i).memberno}</td>
	                            <td class="td-date">${boardList.get(i).createdate}</td>
	                            <td class="td-count">${boardList.get(i).readcount}</td>
	                        	</tr>
                    		</c:forEach>
                    	</c:if>
                    </tbody>
                </table>
            </div>
            
            <c:if test="${loginMember != null}">
            	<div class="board-write" style="padding-top: 20px; height: 60px; margin: 0 auto; width: 1200px;">
                	<a href="#write-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right;">글쓰기</a>
            	</div>
            </c:if>
            <c:if test="${loginMember == null}">
                <div class="board-write" style="padding-top: 20px; height: 60px; margin: 0 auto; width: 1200px;">
                	<a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right;">글쓰기</a>
            	</div>
            </c:if>
            <div class="board-bottom" style="width: 100%; margin: 0 auto; padding-top: 15px;">
                <div class="board-page" style="text-align: center;">
	                <a class="page-on" id="page(1)" style="margin-left: 72px;" onclick="goPage(1); return false;">1</a>
	                <c:if test="${pageInfo.getEndPage() > 1}">
	                	<c:forEach var="i" begin="2" end="${pageInfo.getEndPage()}">
	                		<a class="page" id="page(${i})" onclick="goPage(${i}); return false;">${i}</a>
	                	</c:forEach>
	                </c:if>
	                <a class="page-next" onclick="goPage(${pageInfo.getNextPage()}); return false;"><i class="fi-chevron-right align-middle"></i></a>
	                <a class="page-end" onclick="goPage(${pageInfo.getMaxPage()}); return false;"><i class="fi-chevrons-right align-middle"></i></a>
                </div>
            </div>
        </section>
        </div>
        </div>
        
        <!-- 자유게시판 끝 -->  
        
        <!-- 페이징 ajax -->     
        <script>
        
        	function deleteBoard() {
        		if(confirm("정말로 삭제하시겠습니까?!")) {
        			$('.viewForm').attr("action", "${path}/board/delete")
        		}
        	}
        	
        	function search() {
        		var keyword = $("#keyword").val();
        		
        		$.ajax({
        			url: "${path}/board/list",
        			type: 'GET',
        			data: {
        				page: 1,
        				keyword: keyword
        			},
        			
        			success:function(map) {
        				str = "";
        				var list = map.list;
        				var pageInfo = map.pageInfo;
        				
        				$.each(list, function (i, obj) { // list.get(i) = obj
        					str += '<tr style="width: 100%; height: 70px; background-color: #f1f1f1;">                                                                       '
                            str += '<td class="td-no">'+ obj.no +'</td>                                                                                            '
                            str += '<td class="td-title">                                                                                                                    '
                            str += '<a href="#view-modal" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="goView('+ obj.no +'}); return false;">'+ obj.title +'</a>     '
                            str += '</td>                                                                                                                                    '
                            str += '<td class="td-writer">'+ obj.memberno +'</td>                                                                                  '
                            str += '<td class="td-date">'+ obj.createdate +'</td>                                                                                  '
                            str += '<td class="td-count">'+ obj.readcount +'</td>                                                                                  '
                        	str += '</tr>                                                                                                                                    '
        				});
        				
        				$(".board-data").html(str);
        				
        				var maxPage =     pageInfo.maxPage     ;
             			var startPage =   pageInfo.startPage   ;
             			var endPage =     pageInfo.endPage     ;
             			var currentPage = pageInfo.currentPage ;
             			var prevPage =    pageInfo.prevPage    ;
             			var nextPage =    pageInfo.nextPage    ;
             			var startList =   pageInfo.startList   ;
             			var endList =     pageInfo.endList     ;  

             			str = ""; 
             			var prevEndPage = endPage;
             			
     	        		if(currentPage != 1) {
     	            		str += '<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>';
     	            		str += '<a class="page-prev" onclick="goPage('+ prevPage +'); return false;"><i class="fi-chevron-left align-middle"></i></a>';
     	            	} else {
     	            		str += '<a class="page-on" id="page(1)" style="margin-left: 80px;" onclick="goPage(1); return false;">1</a>';
     	            	}
     	
     	            	for (var i = startPage; i <= endPage; i++) { // 페이지 5개마다 페이지 바뀜
     	            		if(currentPage == 1 && i == 1) {
     	            			continue;
     	            		}
     	            		if(i == currentPage) {
     	            			str += '<a class="page-on" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
     	            		} else {
     	            			str += '<a class="page" id="page'+ i +'" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
     	            		}
     	            	}
     	
     	            	if(currentPage != maxPage) {
     	            		str += '<a class="page-next" onclick="goPage('+ nextPage +'); return false;"><i class="fi-chevron-right align-middle"></i></a>';
     	            		str += '<a class="page-end" onclick="goPage('+ maxPage +'); return false;"><i class="fi-chevrons-right align-middle"></i></a>';
     	            	}
             			
             			$('.board-page').html(str);
        				
        			},
        			
        			error:function(e) {
        				console.log(e)
        			}
        		}); 
        	}
        	
        	function goPage(no) {
        		var page = no;
        		var keyword = $("#keyword").val(); // 페이지에 그대로 있는 keyword 가져오기
        		
        		$.ajax({
        			url: "${path}/board/list",
        			type: 'GET',
        			data: {
        				page: page,
        				keyword: keyword
        			},
        			
        			success:function(map) {
        				str = "";
        				var list = map.list;
        				var pageInfo = map.pageInfo;
        				
        				$.each(list, function (i, obj) { // list.get(i) = obj
        					str += '<tr style="width: 100%; height: 70px; background-color: #f1f1f1;">                                                                       '
                            str += '<td class="td-no">'+ obj.no +'</td>                                                                                            '
                            str += '<td class="td-title">                                                                                                                    '
                            str += '<a href="#view-modal" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="goView('+ obj.no +'); return false;">'+ obj.title +'</a>     '
                            str += '</td>                                                                                                                                    '
                            str += '<td class="td-writer">'+ obj.memberno +'</td>                                                                                  '
                            str += '<td class="td-date">'+ obj.createdate +'</td>                                                                                  '
                            str += '<td class="td-count">'+ obj.readcount +'</td>                                                                                  '
                        	str += '</tr>                                                                                                                                    '
        				});
        				
        				$(".board-data").html(str);
        				
        				var maxPage =     pageInfo.maxPage     ;
             			var startPage =   pageInfo.startPage   ;
             			var endPage =     pageInfo.endPage     ;
             			var currentPage = pageInfo.currentPage ;
             			var prevPage =    pageInfo.prevPage    ;
             			var nextPage =    pageInfo.nextPage    ;
             			var startList =   pageInfo.startList   ;
             			var endList =     pageInfo.endList     ;  

             			str = ""; 
             			var prevEndPage = endPage;
             			
     	        		if(currentPage != 1) {
     	            		str += '<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>';
     	            		str += '<a class="page-prev" onclick="goPage('+ prevPage +'); return false;"><i class="fi-chevron-left align-middle"></i></a>';
     	            	} else {
     	            		str += '<a class="page-on" id="page(1)" style="margin-left: 80px;" onclick="goPage(1); return false;">1</a>';
     	            	}
     	
     	            	for (var i = startPage; i <= endPage; i++) { // 페이지 5개마다 페이지 바뀜
     	            		if(currentPage == 1 && i == 1) {
     	            			continue;
     	            		}
     	            		if(i == currentPage) {
     	            			str += '<a class="page-on" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
     	            		} else {
     	            			str += '<a class="page" id="page'+ i +'" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
     	            		}
     	            	}
     	
     	            	if(currentPage != maxPage) {
     	            		str += '<a class="page-next" onclick="goPage('+ nextPage +'); return false;"><i class="fi-chevron-right align-middle"></i></a>';
     	            		str += '<a class="page-end" onclick="goPage('+ maxPage +'); return false;"><i class="fi-chevrons-right align-middle"></i></a>';
     	            	}
             			
             			$('.board-page').html(str);
        			},
        			
        			error:function(e) {
        				console.log(e)
        			}
        		});
        	};
        	
             // 바로 정보 팝업하는 ajax
            	function goView(no) {
             	
	             	$.ajax({
	         			url: "${path}/board/view",
	         			type: "GET",
	         			data: { 
	         				no: no 
	         			},
	             	
	         			success: function(list) {
	         				console.log(list)
	             			var str = "";
	             			
	     					var no = list.no;
	     					var memberno = list.memberno;
	     					var id = list.id; // 게시글 작성자
	     					var title = list.title;
	     					var cont = list.cont;
	     					var readcount = list.readcount;
	     					var createdate = list.createdate;
	     					var modifydate = list.modifydate;
	     					var url1 = "${path}/board/update";
	     					var url2 = "${path}/board/delete";
	     					var checkId = '${loginMember.id}'; // 작성자 체크 -> 로그인 유저
	     					
	     					
	             			str += '<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>'
	             			str += '          <div class="row mx-0 align-items-center" style="height: 500px;">'
	             			str += '           <div class="col-md-6" style="width: 750px;padding-bottom: 20px;padding-right: 20px;padding-top: 20px;padding-left: 20px;height: 500px;">'
	             			str += '           <form class="viewForm" action method="POST">'
	             			str += '           	<div class style="margin-bottom: 10px; margin-left: 5px;">'
	             			str += 'NO. <input class="form-no" for="signup-name" name="no" style="margin-left: 5px; border:none;" value="'+ no +'" readonly>';
	             			str += '            </div>'
	             			str += '            <div class style="margin-bottom: 10px; float: right;">'
	             			str += '                <label class="form-label" for="signup-name">작성자 &nbsp; :&nbsp;' + id +'&nbsp;&nbsp;&nbsp;|</label>'
	             			str += '                <label class="form-label" for="signup-email">&nbsp;&nbsp;&nbsp;날짜 &nbsp;:&nbsp;'+ modifydate +'</label>'
	             			str += '            </div>'
	             			
	             			if(checkId == id) {
	             				console.log('게시글 작성자입니다.')
	             				
	             				str += '            <div class style="margin-bottom: 20px;">'
	                     		str += '                <label class="form-label" for="signup-name">&nbsp;&nbsp;제목</label>'
	                     		str += '                <input class="form-control" name="title" type="text" value="'+ title +'">'
	                     		str += '            </div>'
	                     		str += '            <div class style="margin-bottom: 15px;">'
	                     		str += '                <label class="form-label" for="signup-name">&nbsp;&nbsp;내용</label>'
	                     		str += '                <textarea class="form-control" style="height:220px; width: 100%;" name="cont" type="text" value="">'+ cont +'</textarea>'
	                     		str += '         	</div>'
	                     		str += '   <div>'
	                     		str += '     <input class="btn  btn-lg rounded-pill" onclick="deleteBoard()" type="submit" value="삭제" style="color: #D9E2F2;background-color:#201627; float: right; margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">'
	                     		str += '  		</div>'
	                     		str += '    <div>'
	                     		str += '    	<input class="btn btn-lg rounded-pill" formaction="'+ url1 +'" type="submit" value="수정" style="color: #D9E2F2;background-color:#201627; float: right;margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">'
	                     		str += '  </div>'
	                     		str += '    </form>'
	             			} else if (checkId == 'admin') {
	             				console.log('관리자입니다.');
	             				str += '            <div class style="margin-bottom: 20px;">'
	     	                    str += '             <label class="form-label" for="signup-name">&nbsp;&nbsp;제목</label>'
	     	                    str += '             <input class="form-control" name="title" type="text" value="'+ title +'" readonly>'
	     	                    str += '         </div>'
	     	                    str += '         <div class style="margin-bottom: 15px;">'
	     	                    str += '             <label class="form-label" for="signup-name">&nbsp;&nbsp;내용</label>'
	     	                    str += '             <textarea class="form-control" style="height:220px; width: 100%;" name="cont" type="text" value="" readonly>'+ cont +'</textarea>'
	     	                    str += '         </div>'
	     	                    str += '   <div>'
	     	                    	str += '     <input class="btn  btn-lg rounded-pill" onclick="deleteBoard()" type="submit" value="삭제" style="color: #D9E2F2;background-color:#201627; float: right; margin-left: 15px;padding-left: 20px;padding-right: 20px;padding-top: 10px;padding-bottom: 10px;">'
	    	                    str += '  		</div>'
	             			} else {
	             				console.log('일반유저.');
	             				str += '            <div class style="margin-bottom: 20px;">'
	     	                    str += '             <label class="form-label" for="signup-name">&nbsp;&nbsp;제목</label>'
	     	                    str += '             <input class="form-control" name="title" type="text" value="'+ title +'" readonly>'
	     	                    str += '         </div>'
	     	                    str += '         <div class style="margin-bottom: 15px;">'
	     	                    str += '             <label class="form-label" for="signup-name">&nbsp;&nbsp;내용</label>'
	     	                    str += '             <textarea class="form-control" style="height:220px; width: 100%;" name="cont" type="text"  value="" readonly>'+ cont +'</textarea>'
	     	                    str += '         </div>'
	     	                    str += '</form>'
	             			}
	             			
	             			
	             			$('#view-modal .modal-body').html(str);
	         			},
	         			
	             		error: function(e) {
	                 		alert(e);
	                 	}
             	});
             }
        </script>
        
         <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
	    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
	    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
	    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
	    <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js "></script>
	    <script src="${path}/resources/vendor/rellax/rellax.min.js "></script>
		<script src="${path}/resources/js/theme.min.js "></script>
        
    	 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>