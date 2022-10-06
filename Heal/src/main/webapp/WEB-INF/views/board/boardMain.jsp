<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판" name="title"/>
</jsp:include>


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
                                        <label class="form-label mb-2" for="signin-name">이름</label>
                                        <input class="form-control" name="name" type="text" placeholder="이름을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-title">제목</label>
                                        <input class="form-control" name="title" type="text" placeholder="제목을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4" style="height: 350px;">
                                        <label class="form-label mb-2" for="signin-content">내용</label>
                                        <textarea class="form-control" style="height:320px; width:480px; word_wrap:break-word;" name="content" type="text" id="signin-content" placeholder="내용을 입력해주세요" required></textarea>
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
                                    NO. <input class="form-no" for="signup-name" name="boardNo" style="margin-left: 5px; border:none;" value="123" readonly>
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
	                                    <textarea class="form-control" style="height:220px; width: 100%;" name="content" type="text" id="update-content" readonly>내용</textarea>
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
        <form method="GET" action="${path}/board/list"">
        	<input type="hidden" id="pageNo" name="pageNo" val="" />
        	<section>
            <div style="width: 1300px; margin: auto; margin-bottom:30px;">
                <h1>자유게시판</h1>
            </div>

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
                    <tr style="background-color: #c1c1c1; width: 100%; height: 70px; border-bottom: 1px solid lightgray;">
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
                    </tr>
                    <tbody class="board-data">
                        		<tr style="width: 100%; height: 70px; background-color: #f1f1f1;">
	                            <td class="td-no"></td>
	                            <td class="td-title">
	                            <a href="#view-modal" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="goView(); return false;"></a>
	                            </td>
	                            <td class="td-writer"></td>
	                            <td class="td-date"></td>
	                            <td class="td-count"></td>
	                        	</tr>
                    </tbody>
                </table>
            </div>
            	<div class="board-write" style="padding-top: 20px; height: 60px; margin: 0 auto; width: 1200px;">
                	<a href="#write-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right;">글쓰기</a>
            	</div>
            		<div class="board-write" style="padding-top: 20px; height: 60px; margin: 0 auto; width: 1200px;">
                	<a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right;">글쓰기</a>
            	</div>
            <div class="board-bottom" style="width:1300px; margin: 0 auto; padding-top: 15px;">
                </div>
            </div>
        </section>
        </form>
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
        	
        	
             
             
             // 바로 정보 팝업하는 ajax
            	function goView(no) {
             	
	             	$.ajax({
	         			url: "${path}/board/view",
	         			type: "POST",
	         			dataType: "text",
	         			data: { "boardNo" : no },
	         			progress: true,
	             	
	         			success: function(list) {
	         				var board = JSON.parse(list);
	             			var str = "";
	             			
	     					var boardNo = board[0].board_no;
	     					var user_id = board[0].user_id;
	     					var name = board[0].name;
	     					var title = board[0].title;
	     					var content = board[0].content;
	     					var readcount = board[0].readcount;
	     					var create_date = board[0].create_date;
	     					var modify_date = board[0].modify_date;
	     					var url1 = "${path}/board/update";
	     					var url2 = "${path}/board/delete";
	     					var checkId = board[0].userId;
	     					
	     					
	             			str += '<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>'
	             			str += '          <div class="row mx-0 align-items-center" style="height: 500px;">'
	             			str += '           <div class="col-md-6" style="width: 750px;padding-bottom: 20px;padding-right: 20px;padding-top: 20px;padding-left: 20px;height: 500px;">'
	             			str += '           <form class="viewForm" action method="POST">'
	             			str += '           	<div class style="margin-bottom: 10px; margin-left: 5px;">'
	             			str += 'NO. <input class="form-no" for="signup-name" name="boardNo" style="margin-left: 5px; border:none;" value="'+ boardNo +'" readonly>';
	             			str += '            </div>'
	             			str += '            <div class style="margin-bottom: 10px; float: right;">'
	             			str += '                <label class="form-label" for="signup-name">작성자 &nbsp; :&nbsp;' + name +'&nbsp;&nbsp;&nbsp;|</label>'
	             			str += '                <label class="form-label" for="signup-email">&nbsp;&nbsp;&nbsp;날짜 &nbsp;:&nbsp;'+ modify_date +'</label>'
	             			str += '            </div>'
	             			
	             			if(checkId == user_id) {
	             				console.log('게시글 작성자입니다.')
	             				
	             				str += '            <div class style="margin-bottom: 20px;">'
	                     		str += '                <label class="form-label" for="signup-name">&nbsp;&nbsp;제목</label>'
	                     		str += '                <input class="form-control" name="title" type="text" value="'+ title +'">'
	                     		str += '            </div>'
	                     		str += '            <div class style="margin-bottom: 15px;">'
	                     		str += '                <label class="form-label" for="signup-name">&nbsp;&nbsp;내용</label>'
	                     		str += '                <textarea class="form-control" style="height:220px; width: 100%;" name="content" type="text" value="">'+ content +'</textarea>'
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
	     	                    str += '             <textarea class="form-control" style="height:220px; width: 100%;" name="content" type="text" value="" readonly>'+ content +'</textarea>'
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
	     	                    str += '             <textarea class="form-control" style="height:220px; width: 100%;" name="content" type="text"  value="" readonly>'+ content +'</textarea>'
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