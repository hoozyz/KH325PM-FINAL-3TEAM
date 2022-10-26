<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="나의 정보" name="title"/>
</jsp:include>

<!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="real-estate-home-v1.html">HEALING</a></li>
            <li class="breadcrumb-item"><a href="real-estate-account-info.html">마이페이지</a></li>
            <li class="breadcrumb-item active" aria-current="page">나의 정보</li>
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
                  <a class="card-nav-link active" href="${path}/member/myInfo"><i class="fi-user opacity-60 me-2"></i>나의 정보</a>
                  <a class="card-nav-link" href="${path}/reserve/myCamp"><i class="fi-home opacity-60 me-2"></i>나의 예약</a>
                  <a class="card-nav-link" href="${path}/photo/myPhoto"><i class="fi-home opacity-60 me-2"></i>나의 게시글</a>
                  <a class="card-nav-link" href="${path}/like/myLike"><i class="fi-heart opacity-60 me-2"></i>나의 찜</a>
                  <a class="card-nav-link" href="${path}/review/myReview"><i class="fi-star opacity-60 me-2"></i>나의 리뷰/댓글</a>
              </div>
            </div>
            </div>
          </aside>
          <!-- Content-->
          <div class="col-lg-8 col-md-7 mb-5">
            <h1 class="h2">나의 정보</h1>
            <div class="border rounded-3 p-3 mb-4" id="personal-info">
            <form action="${path}/member/update" method="POST">
              <!-- 아이디-->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">아이디</label>
                    <div id="name-value">${loginMember.id}</div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#id-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="id-collapse" data-bs-parent="#personal-info">
                  <input class="form-control mt-3" type="text" name="id" value="${loginMember.id}" readonly>
                </div>
              </div>
              <!-- 비밀번호-->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">비밀번호</label>
                    <div id="pwd-value">
                    	<c:forEach var="i" begin="1" end="${loginMember.pwd.length()}"> <!-- 비밀번호 수 만큼 * -->
                    		*
                    	</c:forEach>
                    </div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#pwd-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="pwd-collapse" data-bs-parent="#personal-info">
                  <div class="row gx-3 align-items-center my-3">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-current">현재 비밀번호 :</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="newPwd" placeholder="현재 비밀번호 입력해주세요.">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gx-3 align-items-center my-3">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-new">변경하실 비밀번호:</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="newPwd1" placeholder="변경하실 비밀번호를 입력해주세요." name="pwd" value="${loginMember.pwd}">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gx-3 align-items-center">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-confirm">변경하실 비밀번호 확인:</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="newPwd2" placeholder="변경하실 비밀번호를 다시 입력해주세요.">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                </div>
              </div>
              <!-- 이름 -->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">이름</label>
                    <div id="name-value">${loginMember.name}</div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#name-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="name-collapse" data-bs-parent="#personal-info">
                  <input class="form-control mt-3" type="text" name="name" value="${loginMember.name}">
                </div>
              </div>
              <!-- 전화번호 -->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">전화번호</label>
                    <div id="phone-value">${loginMember.phone}</div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#phone-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="phone-collapse" data-bs-parent="#personal-info">
                  <input class="form-control mt-3" type="text" name="phone" maxlength="11" placeholder="${loginMember.phone}" value="${loginMember.phone}">
                </div>
              </div>
              <!-- 이메일-->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">이메일</label>
                    <div id="email-value">${loginMember.email}</div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#email-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="email-collapse" data-bs-parent="#personal-info">
                  <input class="form-control mt-3" type="email" name="email" placeholder="${loginMember.email}" value="${loginMember.email}">
                </div>
              </div>
              <!-- 거주지(동/읍/면/리) -->
              <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="pe-2">
                    <label class="form-label fw-bold">거주지(동/읍/면/리)</label>
                    <div id="address-value">${loginMember.dong}</div>
                  </div>
                  <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#dong-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="dong-collapse" data-bs-parent="#personal-info">
                  <input class="form-control mt-3" type="text" name="dong" placeholder="${loginMember.dong}" value="${loginMember.dong}">
                </div>
              </div>
              <div class="d-flex align-items-center justify-content-between border-top mt-4 pt-4 pb-1">
              <c:if test="${loginMember.name != 'kakao'}"> <!-- 카카오 계정은 변경, 탈퇴 불가 -->
              	<input class="btn btn-primary px-3 px-sm-4" type="submit" value="정보 변경" id="updateMember">
              	<i class="fi-trash me-2">&nbsp<input class="btn btn-link btn-sm px-0" type="button" id="deleteMember" value="회원 탈퇴"></i>
              </c:if>
            </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <script>
	 $(document).ready(() => {
		 $("#newPwd1").val("");
		 
		$("#deleteMember").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('${path}/member/delete');
			}
		});
		
		$("#updateMember").on("click", (e) => {
			let newPwd = $("#newPwd").val();
			let newPwd1 = $("#newPwd1").val();			
			let newPwd2 = $("#newPwd2").val();
			
			if(newPwd == "" && newPwd1 == "" && newPwd == "") { // 비밀번호가 다 빈칸일때
				$("#newPwd1").val('${loginMember.pwd}');
				return true;
			}
			
			if(${loginMember.pwd} != newPwd) {
				alert("현재 비밀번호가 일치하지 않습니다.");
				$("#newPwd").val("");
				$("#newPwd").focus();
				
				return false;
			}
			
			if(newPwd1.trim() != newPwd2.trim()) {
				alert("변경하실 비밀번호가 일치하지 않습니다.");
				
				$("#newPwd1").val("");
				$("#newPwd2").val("");
				$("#newPwd1").focus();
				
				return false;
			} 	
		});
		
	});
	 
	</script>
	
	 <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>