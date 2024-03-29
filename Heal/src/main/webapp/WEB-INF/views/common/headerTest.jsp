<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SCENE</title>
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="${path}/resources/etc/site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="${path}/resources/etc/safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
    	/* 아이콘 */
    	@font-face {
    	<%-- font-family: "finder-icons";
    	src: url("${path}/resources/fonts/finder-icons.ttf?7648j3") format("truetype"), url("${path}/resources/fonts/finder-icons.woff?7648j3") format("woff"), url("${path}/resources/fonts/finder-icons.svg?7648j3#finder-icons") format("svg");
    	font-weight: normal;
    	font-style: normal;
    	font-display: block
		} --%>
    
        .page-loading.active {
            opacity: 1;
            visibility: visible;
        }
        
        .page-loading-inner {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: opacity .2s ease-in-out;
            transition: opacity .2s ease-in-out;
            opacity: 0;
        }
        
        .page-loading.active>.page-loading-inner {
            opacity: 1;
        }
        
        .page-loading-inner>span {
            display: block;
            font-size: 1rem;
            font-weight: normal;
            color: #666276;
            ;
        }
        
        .page-spinner {
            display: inline-block;
            width: 2.75rem;
            height: 2.75rem;
            margin-bottom: .75rem;
            vertical-align: text-bottom;
            border: .15em solid #bbb7c5;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner .75s linear infinite;
            animation: spinner .75s linear infinite;
        }
        
        @-webkit-keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
        @keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
                
        a.dropdown-it{
        	font-size:23px;
        	padding-left:10px;
        	color:#201627;
        }

        a.dropdown-it:hover{
        	font-size:23px;
        	color:#AB69DD;
        	font-weight:800;
        }
        
    </style>
    <!-- Page loading scripts-->
    <script>
        (function() {
            window.onload = function() {
                var preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 2000);
            };
        })();
    </script>
    <!-- 제이쿼리 -->
    <script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
    
    <!-- swiper -->
    <%-- <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/periodUl.css" id="theme-stylesheet"> --%>
    
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">

    <!-- Vendor Styles-->
    
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">

    <link rel="stylesheet" media="screen" href="${path}/resources/css/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css"/>
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/filepond/dist/filepond.min.css"/>
    <!-- Main Theme Styles + Bootstrap-->       
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Jua&display=swap" rel="stylesheet">
    <!-- 나눔스퀘어라운지 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">


    <style>
        h1 {
            font-family: 'Gugi', cursive;
        }
        
        h2 {
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 800;
        }
        
        h6 {
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 300;
            ;
        }
        
        #NSR {
            font-family: 'NanumSquareRound', sans-serif;
                font-size: 40px;
            font-weight: 800;
        }
        *{
          font-family: 'NanumSquareRound', sans-serif;
          font-weight: 300;
        }
    </style>
    
    <!-- @@@ 수정본 스타일 @@@-->
    <style>
        h1 {
            color: #D9E2F2;
        }
        
        .per {
            text-decoration-line: none;
            color: #201627;
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 12pt;
        }
        .text-info1 {
            color: #DBAB34;
        }
    </style>
    
</head>
<!-- Body-->

<body>
    <!-- Page loading spinner-->
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div>
    <main class="page-wrapper">
    <!-- 로그인 안되어 있을 때 헤더 -->
        <!-- Sign In Modal-->
        <div class="modal fade" id="signin-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered p-2 my-0 mx-auto">
                <div class="modal-content" style="width:500px;text-align:center;"">
                    <div class="modal-body">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                            <div>
                               <img class="d-block mx-auto" src="${path}/resources/images/logo/pjlogo11.png" width="344" alt="Illustartion">
                            </div>
                            <div>
                                <form class="needs-validation" action="${path}/login" method="POST" novalidate="">
                                    <div class="mb-4">
                                   		<div class="d-flex align-items-center justify-content-between mb-1">
                                       		<label class="form-label ms-3 mb-0" for="signin-email" style="font-size:20px;font-weight:700;font-family:'NanumSquareRound', sans-serif;">아이디</label>
                                        </div>
                                        <input class="form-control" type="text" name="userId" id="signin-id" placeholder="아이디를 입력해주세요." required>
                                    </div>
                                    <div class="mb-5">
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <label class="form-label ms-3 mb-0" for="signin-password" style="font-size:20px;font-weight:700;font-family:'NanumSquareRound', sans-serif;">비밀번호</label>
                                        </div>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" name="userPwd" id="signin-password" placeholder="비밀번호를 입력해주세요" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
				                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
				                        </label>
                                        </div>
                                    </div>
                                    <input class="btn btn-lg rounded-pill w-100" style="background-color:#201627; color:#D9E2F2; font-weight:800; font-size:15pt;" type="submit" value="로그인">
                                </form>
                                <div class="d-flex align-items-center py-4">
                                    <hr class="w-100">
                                    <div class="px-3">Or</div>
                                    <hr class="w-100">
                                </div>
                            	<a style="width: 150%;height: 50px;margin-bottom: 15px;" href="javascript:void(0);" onclick="kakaoLogin();"><img src="/Show/resources/images/kakao_login_medium_wide.png" style=" width:400px;"></a>
                                <div class="mt-4 mt-sm-5">계정이 없으신가요? <a href="#signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">회원가입</a></div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
       <!-- Sign Up Modal-->
        <div class="modal fade" id="signup-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 600px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="mx-0 align-items-center">
                            <div>
                               <img class="d-block mx-auto" src="${path}/resources/images/logo/pjlogo2.png" width="344" alt="Illustartion">
                            </div>
                            <div class="px-4 pb-4 px-sm-5 pb-sm-5">
                                <form class="needs-validation" action="${path}/member/enroll" method="POST" novalidate>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">이름</label>
                                        <input class="form-control" type="text" name="name" id="name" placeholder="이름을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">전화번호</label>
                                        <input class="form-control" type="text" name="phone" id="phone" placeholder="ex)01012345678(-없이)" maxlength="11" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">이메일</label>
                                        <input class="form-control" type="text" name="email" id="email" placeholder="abc@abc.com" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">주소(동/읍/면/리)</label>
                                        <input class="form-control" type="text" name="dong" id=""dong"" placeholder="주소를 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-email">아이디</label>
                                        <input class="form-control" type="text" name="id" id="id" placeholder="4글자 이상." minlength="4" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-password">비밀번호<span class='fs-sm text-muted'>  4글자 이상</span></label>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" name="pwd" id="pwd" minlength="4" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-password-confirm">비밀번호 확인</label>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="signup-password-confirm" minlength="4" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <div class="form-check mb-4">
                                    </div>
                                    <button class="btn btn-lg rounded-pill w-100" style="background-color:#201627; color:#D9E2F2; font-weight:800; font-size:15pt;" type="submit">회원가입</button>
                                <div class="mt-sm-4 pt-md-3">이미 계정이 있으신가요? <a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal">로그인</a></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navbar-->
        <header class="navbar navbar-expand-lg navbar-light bg-light fixed-top py-0" data-scroll-header>
            <div class="container">
                <a class="navbar-brand me-3 me-xl-4" href="${path}/"><img class="d-block" src="${path}/resources/images/logo/pjlogo10.png" width="220" alt="SCENE"></a>
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
				<!-- 로그인 아닐 때 -->
				<c:if test="${loginMember == null}">
                	<a class="btn btn-sm  d-none d-lg-block order-lg-3 mt-2" href="#signin-modal" data-bs-toggle="modal"style="color:#0B398E;font-size:20px"><i class="fi-user me-2"></i>로그인</a>
                	<a class="btn btn-sm  d-none d-lg-block order-lg-3 mt-2" href="#signup-modal" data-bs-toggle="modal"style="color:#0B398E;font-size:20px"><i class="fi-user me-2"></i>회원가입</a>
                </c:if>
                <!-- 로그인 일 때 -->
                <c:if test="${loginMember != null }">
               		 <button class="btn btn-sm  d none d-lg-block order-lg-3 mt-3" onclick="location.href='${path}/member/myInfo'" data-bs-toggle="modal" style="color:#0B398E;font-size:20px"><i class="fi-user me-2"></i>마이페이지</button>
                	 <button class="btn btn-sm  d-none d-lg-block order-lg-3" onclick="location.href='${path}/logout'" data-bs-toggle="modal" style="color:#0B398E;font-size:20px"><i class="fi-user me-2"></i>로그아웃</button>
                </c:if>
                <div class="collapse navbar-collapse order-lg-2 mt-3" id="navbarNav">
                    <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">
                        <!-- Menu items-->
                        <li class="nav-item dropdown px-3 "><a class="nav-link dropdown" href="${path}/camp/campMain">캠핑장</a>                        </li>
                        <li class="nav-item dropdown px-3 "><a class="nav-link dropdown" href="${path}/camp/detail">캠핑장상세</a>                        </li>
                        <li class="nav-item dropdown pe-1"><a class="nav-link dropdown" href="${path}/park/main" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="NSR">공원</a>
                        </li>
                        <a class="nav-item pe-3"><a class="nav-link" href="${path}/festival/main" role="button" aria-expanded="false" id="NSR">축제</a></a>
                        <a class="nav-item pe-3"><a class="nav-link" href="${path}/food/main" role="button" aria-expanded="false" id="NSR">주변 시설</a></a> <!-- 주변시설은 음식점이 메인 -->
                        <a class="nav-item pe-3"><a class="nav-link" href="${path}/festival/main" role="button" aria-expanded="false" id="NSR">OO몰</a></a>
                        <li class="nav-item dropdown ps-3"><a class="nav-link dropdown" href="${path}/photo/main" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="NSR">게시판</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-it" href="${path}/photo/main">포토게시판</a></li>
                                <li><a class="dropdown-it" href="${path}/board/main">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item d-lg-none"><a class="nav-link" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그인</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- @@@@@@@@헤더끝@@@@@@@@@@@@@@@@@@@ -->

	</main>
