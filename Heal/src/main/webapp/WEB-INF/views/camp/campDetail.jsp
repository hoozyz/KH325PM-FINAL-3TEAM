<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/headerTest.jsp">
	<jsp:param value="캠핑장 메인" name="title"/>
</jsp:include>

<style>
                .weather_area {
                    position: relative;
                    text-align: center;
                    overflow: hidden;
                    z-index: 5
                }
                
                .weather_area .weather_now {
                    position: relative;
                    overflow: hidden;
                    font-size: 0;
                    line-height: 0;
                }
                
                .weather_area .weather_now .summary_img {
                    position: relative;
                    display: inline-block;
                    vertical-align: top;
                }
                
                .ico_animation[class*=ico_animation_wt] {
                    -webkit-background-size: 75px 75px;
                    background-size: 75px 75px;
                }
                
                .ico_animation {
                    width: 75px;
                    height: 75px;
                    -webkit-background-size: 525px 450px;
                    background-size: 525px 450px;
                    display: inline-block;
                    vertical-align: top;
                }
                
                .ico_animation_wt6 {
                    background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt6.svg);
                }
                
                .weather_area .weather_now .current {
                    display: inline-block;
                    vertical-align: top;
                    margin-left: -26px;
                    font-size: 60px;
                    line-height: 75px;
                    letter-spacing: -1.85px;
                    color: #000;
                    font-weight: 700;
                    white-space: nowrap;
                    z-index: 10;
                }
                
                .blind {
                    overflow: hidden;
                    position: absolute;
                    clip: rect(0 0 0 0);
                    width: 1px;
                    height: 1px;
                    margin: -1px;
                }
                
                .weather_area .weather_now .degree {
                    display: inline-block;
                    vertical-align: top;
                    margin-top: 6px;
                    font-size: 30px;
                    font-weight: 700;
                    line-height: 35px;
                    letter-spacing: -.82px;
                }
                
                .weather_area .weather_now .summary {
                    display: inline-block;
                    vertical-align: top;
                    margin: 15px 0 0 5px;
                    font-size: 16px;
                    font-weight: 700;
                    line-height: 21px;
                    letter-spacing: -1px;
                    color: #222;
                    text-align: left;
                }
                
                .weather_area .weather_now .summary .weather {
                    display: block;
                    margin-bottom: 3px;
                    font-size: 22px;
                    line-height: 25px;
                    letter-spacing: -1px;
                }
                
                em {
                    font-style: normal;
                }
                
                .weather_area .weather_now .summary .temperature {
                    display: inline-block;
                    font-size: 18px;
                    line-height: 21px;
                    letter-spacing: -1px;
                    vertical-align: top;
                }
                
                .weather_area .weather_now .summary .temperature.down:after {
                    display: inline-block;
                }
                
                .weather_area .weather_now .summary .temperature:after {
                    background-position: -34px -840px;
                    background-repeat: no-repeat;
                    width: 8px;
                    height: 16px;
                    margin: 3px 0 0 -2px;
                    vertical-align: top;
                    content: '';
                }
                
                .weather_area .weather_now .summary .temperature:after {
                    background-image: url(https://ssl.pstatic.net/static/weather/image/sp_weather_1746dae0.png);
                    background-size: 965px 883px;
                }
            </style>
            
            <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
		<!-- Review modal-->
        <div class="modal fade" id="modal-review" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">캠핑후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-name" name="name" value="${loginMember.name}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점<span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star">
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">캠핑후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Review modal-->
        <div class="modal fade" id="modal-air" tabindex="-1"> <!-- 비행기 예매 -->
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">캠핑후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-name" name="name" value="${loginMember.name}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점<span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star">
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">캠핑후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Review modal-->
        <div class="modal fade" id="modal-train" tabindex="-1"> <!-- 기차 예매 -->
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">캠핑후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-name" name="name" value="${loginMember.name}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점<span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star">
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">캠핑후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Review modal-->
        <div class="modal fade" id="modal-bus" tabindex="-1"> <!-- 버스 예매 -->
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">캠핑후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름<span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-name" name="name" value="${loginMember.name}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점<span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star">
                      <option value="" selected disabled hidden>평점 선택</option>
                      <option value="5">5점</option>
                      <option value="4">4점</option>
                      <option value="3">3점</option>
                      <option value="2">2점</option>
                      <option value="1">1점</option>
                    </select>
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">캠핑후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page header-->
        <section class="container pt-5 mt-5">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="real-estate-home-v1.html">홈페이지</a></li>
                    <li class="breadcrumb-item"><a href="real-estate-catalog-rent.html">캠핑장</a></li>
                    <li class="breadcrumb-item active" aria-current="page">(주)디노담양힐링파크 지점</li>
                </ol>
            </nav>
            <!-- Features + Sharing-->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h2 mb-2">(주)디노담양힐링파크 지점</h1>
                <div class="text-nowrap">
                    <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="tooltip" title="Add to Wishlist"><i class="fi-heart"></i></button>
                    <div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="Share">
                        <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>
                        <div class="dropdown-menu dropdown-menu-end my-1">
                            <button class="dropdown-item" type="button"><i class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>
                            <button class="dropdown-item" type="button"><i class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>
                            <button class="dropdown-item" type="button"><i class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Gallery-->
        <section class="container overflow-auto mb-4 pb-3" data-simplebar>
            <div class="row g-2 g-md-3 gallery" data-thumbnails="true" style="min-width: 30rem;">
                <div class="col-8">
                    <a class="gallery-item rounded rounded-md-3" href="https://gocamping.or.kr/upload/camp/4/8460x14p2wteha7SjLLANUhu.jpg" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;Bathroom&lt;/h6&gt;"><img src="https://gocamping.or.kr/upload/camp/4/8460x14p2wteha7SjLLANUhu.jpg" alt="Gallery thumbnail"></a>
                </div>
                <div class="col-4">
                    <a class="gallery-item rounded rounded-md-3 mb-2 mb-md-3" href="https://gocamping.or.kr/upload/camp/4/4548WQ5JCsRSkbHrBAaZylrQ.jpg" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;Bedroom&lt;/h6&gt;"><img src="https://gocamping.or.kr/upload/camp/4/4548WQ5JCsRSkbHrBAaZylrQ.jpg" alt="Gallery thumbnail"></a>
                    <a class="gallery-item rounded rounded-md-3" href="https://gocamping.or.kr/upload/camp/4/3968FDzMGtUdjhbAC1BIXmYo.jpg" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;Living room&lt;/h6&gt;"><img src="https://gocamping.or.kr/upload/camp/4/3968FDzMGtUdjhbAC1BIXmYo.jpg" alt="Gallery thumbnail"></a>
                </div>
            </div>
        </section>
        <!-- Post content-->
        <section class="container mb-5 pb-1">
            <div class="row">
                <div class="col-md-7 mb-md-0 mb-4"><span class="badge bg-success me-2 mb-3">일반</span><span class="badge bg-info me-2 mb-3">글램핑</span><span class="badge bg-warning me-2 mb-3">카라반</span>
                    <h4 class="h5 mb-4 pb-4 border-bottom">소형(2~3인) : 30,000원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중형(4~5인) : 45,000원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대형(6~7인) : 60,000원</h4>
                    </h2>
                    <!-- Overview-->
                    <div class="mb-4 pb-md-3 border-bottom">
                        <h3 class="h4">캠핑장 소개</h3>
                        <h5 class="h6 list-unstyled"><b>한줄소개 : </b>담양 힐링파크에서 일상 속 쌓인 스트레스를 풀어보자</h5>
                        <p class="mb-1">담양 힐링파크에서 일상 속 쌓인 스트레스를 풀어보자</lineIntro>
                            <intro>담양군 봉산면 기곡리에 위치한 힐링파크 담양점은 도심과 떨어져 조용히 숲과 자연에서 자유로이 쉴수 있는 힐링파크다. 이곳은 기존 봉산관광농원이라는 이름으로 1998년 농림부 1등급 판정을 받은 시설로 어느 휴양지에서도 느끼지 못했던 색다른 휴식과 즐거움을 동시에 느낄 수 있다. 담양 힐링파크는 대한민국에서 둘째가라면 서러울 정도로 많은 편의시설을 자랑하고 있는데 책을 좋아하는 사람이라면 누구든 이용
                                가능한 실내 독서실과 저수지낚시터가 있다.
                        </p>
                        <div class="collapse" id="seeMoreOverview">
                            <p class="mb-1"> 또한 족구, 배드민턴 등 함께 뛰며 게임할 수 있는 족구장이 있으며 배드민턴은 무료 대여중이다. 이밖에도 주말 행복한 하루를 밤하늘을 보며 마감할 수 있는 주말 폭죽서비스가 있다. 이곳은 ‘동물의 왕국’이라고 해도 과언이 아닐 정도로 다양한 동물들과 시간을 보낼 수 있는데 미니동물원에서는 토끼에게 먹이도 주고 만져보며 교감할 수 있다. 그리고 담양곤충체험관이 있어 자연, 곤충과 친해질 수 있으며
                                이용료는 무료다. 반려동물이 출입이 가능하므로 자신의 반려동물과도 추억을 쌓을 수 있다.</p>
                        </div>
                        <a class="collapse-label collapsed" href="#seeMoreOverview" data-bs-toggle="collapse" data-bs-label-collapsed="더보기" data-bs-label-expanded="줄이기" role="button" aria-expanded="false" aria-controls="seeMoreOverview"></a>
                    </div>
                    <!-- Property Details-->
                    <div class="mb-4 pb-md-3 border-bottom">
                        <h3 class="h4">상세정보</h3>
                        <ul class="list-unstyled mb-0">
                            <li><b>테마 : </b>낚시,여름물놀이</li>
                            <li><b>주소 : </b>전남 담양군 봉산면 탄금길 9-26</li>
                            <li><b>전화번호 : </b>061-383-5155</li>
                            <li><b>홈페이지 : </b>https://healingpark.modoo.at/</li>
                        </ul>
                    </div>
                    <!-- Reviews-->
                    <div class="mb-4 pb-4 border-bottom">
                        <h3 class="h4 pb-3"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>4,9 (32 후기)</h3>
                        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between"><a class="btn btn-outline-primary mb-sm-0 mb-3" href="#modal-review" data-bs-toggle="modal"><i class="fi-edit me-1"></i>후기 등록</a>
                            <div class="d-flex align-items-center ms-sm-4">
                                <label class="me-2 pe-1 text-nowrap" for="reviews-sorting"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>정렬순:</label>
                                <select class="form-select" id="reviews-sorting">
                      <option>최신순</option>
                      <option>오래된순</option>
                      <option>좋아요순</option>
                      <option>별점 높은순</option>
                    </select>
                            </div>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0">Annette Black</h6><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
                                </div>
                            </div><span class="text-muted fs-sm">Jan 17, 2021</span>
                        </div>
                        <p>Elementum ut quam tincidunt egestas vitae elit, hendrerit. Ullamcorper nulla amet lobortis elit, nibh condimentum enim. Aliquam felis nisl tellus sodales lectus dictum tristique proin vitae. Odio fermentum viverra tortor quis.</p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(3)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i class="fi-dislike"></i><span>(0)</span></button>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0">Darrell Steward</h6><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
                                </div>
                            </div><span class="text-muted fs-sm">Dec 1, 2020</span>
                        </div>
                        <p>Vel dictum nunc ut tristique. Egestas diam amet, ut proin hendrerit. Dui accumsan at phasellus tempus consequat dignissim.</p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(0)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i class="fi-dislike"></i><span>(1)</span></button>
                        </div>
                    </div>
                    <!-- Pagination-->
                    <nav class="mt-2 mb-4" aria-label="Reviews pagination">
                        <ul class="pagination">
                            <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                            <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="visually-hidden">(current)</span></span>
                            </li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                            <li class="page-item d-none d-sm-block">...</li>
                            <li class="page-item d-none d-sm-block"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Sidebar-->
                <aside class="col-lg-4 col-md-5 ms-lg-auto pb-1">
                    <!-- Contact card-->
                    <div class="card shadow-sm mb-4">
                        <div class="card-body">
                            <!-- Contact form-->
                                <span class="popup_date">날짜선택<i class="fi-calendar ps-1"></i></span>
                                <div class="input-group input-daterange pb-3">
                                    <input class="form-control date-picker rounded-pill pi-5 start" id="datepicker1" name="startDate" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                                    <div class="input-group-addon">to</div>
                                    <input class="form-control date-picker rounded-pill pi-5 end" id="datepicker2" name="endDate" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                                </div>
                                <div class="popup_count">텐트선택</div>
                                <div class="row pb-3">
                                    <div class="col-2" style="text-align: right;">
                                        <select id="item" name="headcnt" required>
                                        <option value="" selected disabled hidden></option>
                                        <option value= "소형">소형</option>
                                        <option value= "중형">중형</option>
                                        <option value= "대형">대형</option>
                                    </select>
                                    </div>
                                </div>
                                <h3 class="h3">합계 : <span class="h3" id="total">100000</span>원 / <span class="h3" id="day">2</span> 박</h3>
                                <input class="btn btn-lg btn-primary d-block w-100" id="payTest" type="submit" value="예약하기">
                        </div>
                    </div>
                    
                    <script> // 결제
        				$(document).ready(() => {
        					$("#payTest").click(function(){
								var start = $("#datepicker1").val();
								var end = $("#datepicker2").val();
								var item = $("#item").val();
        						var totalAmount = $("#total").html();
        						// var day = $("#day").html(); -> 나중에 위에 변경 알고리즘 짜면 쓸것
        						
        						var type = 'camp';
        						var no = 4;
        						
        						var startDate = new Date(start);
        						var endDate = new Date(end);
        						
        						var second = endDate.getTime() - startDate.getTime();
        						var day = second / (1000*60*60*24);
        						
        						 $.ajax({
        							type: 'GET',
        							url: '/pay/camp',
        							data: {
        								day: day,
        								no: no,
        								start: start,
        								type: type,
        								total_amount: totalAmount,
        								itemName: item,
        							},
        							
        							success:function(resp) {
        								window.open(resp.next_redirect_pc_url);
        							},
        							
        							error:function(e) {
        								console.log(e);
        							}
        						}); 
        					});
        				});
        			</script>
        			
        			<h3 class="h4">이 캠핑장으로 갈사람 사세요</h3>
        			<div> <!-- 교통 예매 div --> <!-- 팝업으로 이동 -->
        				<a></a>
        				<a></a>
        				<a></a>
        			</div>
                    
                    <!--Map-->
                    <div id="map" style="width: 415px; height: 300px; border-radius:2%;"></div>
                    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8cddaf5bb7b88f487cf47627b52b649b"></script>
                    <script>
                        var container = document.getElementById('map');
                        var options = {
                            center: new kakao.maps.LatLng(35.2714369, 126.9609528),
                            level: 3
                        };

                        var map = new kakao.maps.Map(container, options);

                        var markerPosition = new kakao.maps.LatLng(35.2714369, 126.9609528);

                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        marker.setMap(map);
                    </script>
                    <br>
                    <h3 class="h4">오늘의 날씨</h3>
                    <!-- Not included in rent-->
                    <div class="weather_area m-0 p-0">
                        <div class="weather_now m-0 p-0">
                            <div class="summary_img m-0 p-0">
                                <i class="ico_animation _cnLazy ico_animation_wt6" data-ico="ico_animation_wt6" data-ymdt="2022092623"></i>
                                <strong class="current">
                                    <span class="blind">현재 온도</span>14.1<span class="degree">°</span>
                                </strong>
                            </div>
                            <p class="summary p-0">
                                <span class="weather">구름많음</span>
                                <em>어제보다</em> <span class="temperature down">0.4° <span class="blind">낮아요</span></span>
                            </p>
                        </div>
                    </div>
                </aside>
            </div>
        </section>
        <!-- Recently viewed-->
        <section class="container mb-5 pb-2 pb-lg-4">
            <div>
                <h2 class="h3 mb-sm-0" style="display:inline;">최근 본 </h2>
                <h2 class="h3 mb-sm-0" style="display:inline; color: #FD5D08;"> 캠핑장</h2>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="https://gocamping.or.kr/upload/camp/9/thumb/thumb_720_36369SPhIkIhwmImFUZ9E1pT.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <span class="badge bg-info me-2 mb-2">글램핑</span>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">(주)쉐르빌리안티티</a></h3>
                                <p class="mb-2 fs-sm text-muted">강원 홍천군 서면 밤벌길19번길 111</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>84,000원</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">반려견과 함께 즐기는 글램핑</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="https://gocamping.or.kr/upload/camp/10/thumb/thumb_720_1869epdMHtUyrinZWKFHDWty.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <span class="badge bg-warning me-2 mb-2">카라반</span>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">(주)아웃오브파크</a></h3>
                                <p class="mb-2 fs-sm text-muted">강원도 춘천시 남면 가옹개길 52-9</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>95,000원</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">이국적인 캐러밴과 알찬 부대시설</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="https://gocamping.or.kr/upload/camp/11/thumb/thumb_720_4031mKP95kUbSSBNbq5bSC5o.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <span class="badge bg-success me-2 mb-2">일반</span><span class="badge bg-primary me-2 mb-2">자동차</span>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">(주)양촌여울체험캠프</a></h3>
                                <p class="mb-2 fs-sm text-muted">경상남도 창원시 마산합포구 진전면</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>70,000원</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">다양한 먹거리를 체험을 할 수 있는 곳</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="#"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="https://gocamping.or.kr/upload/camp/16/thumb/thumb_720_7281ozQmm7ppv6bLdBn7I6Xv.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <span class="badge bg-info me-2 mb-2">글램핑</span>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">이스케이프 지점 (휴토피아)</a></h3>
                                <p class="mb-2 fs-sm text-muted">강원도 홍천군 서면 어유포리 282-8</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>65,000원</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">침대에 누워 즐기는 홍천강 풍경</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="https://gocamping.or.kr/upload/camp/17/thumb/thumb_720_9880pmgY469oYPT25mRb8Yy8.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <span class="badge bg-success me-2 mb-2">일반</span>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">드림랜드오토캠핑장</a></h3>
                                <p class="mb-2 fs-sm text-muted">경북 영천시 고경면 고도길 38</p>
                                <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>151,000원</div>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <p class="mb-2 fs-sm text-muted">캠핑과 함께 다양한 즐길 거리 가득한 오토캠핑장</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>