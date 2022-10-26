<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메인 홈페이지" name="title"/>
</jsp:include>

<style>          
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
            
            .container-main {
                width: 80%;
                margin: 0 auto;
                padding-bottom: 30px;
            }
            
            backg-img {
                background-image: url('D001.png');
            }
        </style>
        
         <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
 			<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
 			<link rel="stylesheet" media="screen" href="${path}/resources/css/sidebar.css" />
 			
 			<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
	
	<!-- 메인 페이지 시작 -->
	<main>
  <section class="mb-5">
        <div style="height: 400pt; background-position: 60% 100%; background-image: url(resources/image/cm003.jpg);">
            <div class="container" style="padding-top: 170px">
                <h1 class="text-white text-left" style="padding-left: 180px; font-size:50pt; font-family: DalseoDarling;">
                    일상에서 벗어나
                </h1>
                <h1 class="text-white text-left" style="padding-left: 180px; font-size:50pt; font-family: DalseoDarling; padding-bottom: 30px">
                    나만의 힐링스팟으로
                </h1>
            </div>
            <div class="container" style="max-width: 1000px;">
                <form class="form-group rounded-md-pill" style="padding: 0px;" name="MainSearch" id="searchFrm" action="" method="GET">
                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-5"><i class="fi-search"></i></span>
                        <input class="form-control" name="keyword" type="text" placeholder="가보고 싶은 곳이 있으세요?">
                    </div>
                    <hr class="d-md-none my-2">
                    <div class="d-sm-flex">
                    <div class="dropdown w-100 mb-sm-0 mb-3 border-end-md">      	
                    <select class="form-select" style="width:75pt; margin-top:6px;" name="city">			
					<option value="" selected disabled>도/시</option>
                    <option value="서울특별시">서울특별시</option>                                             
                    <option value="부산광역시">부산광역시</option>
                    <option value="대구광역시">대구광역시</option>
                    <option value="인천광역시">인천광역시</option>
                    <option value="광주광역시">광주광역시</option>
                    <option value="대전광역시">대전광역시</option>
                    <option value="울산광역시">울산광역시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청도">충청도</option>
                    <option value="전라도">전라도</option>
                    <option value="경상도">경상도</option>
                    <option value="제주특별자치도">제주특별자치도</option>                
                 	 </select>                
                        </div>
                        <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">                       
                    <select class="form-select mb-2" name="typeCtg" style="width:80pt; margin-top:6px;" onchange="setType(this.value);">			
					<option value="캠핑장">캠핑장</option>
                    <option value="공원">공원</option>                                             
                    <option value="축제">축제</option>
                    </select>                         
                        </div>
                        <input class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="Search"/>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <!-- 카테고리 검색 ~ 액션태그 --> 
    <script>
function setType(param){

alert(param);

if(param == "캠핑장"){
	$("#searchFrm").attr("action","${path}/camp/campSearch")
	}
	
else if(param == "공원"){
	$("#searchFrm").attr("action","${path}/park/parkList")
	}
	
else if(param == "축제"){
	$("#searchFrm").attr("action","${path}/festival/festivalSearch")
	}
	
else{
	$("#searchFrm").attr("action", "")
	}

}
</script> 

		<div class="modal fade" id="modal-air" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center" id="airTitle">
                        비행기 예매
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="airOne" onclick="return flase;" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
		                <span class="dropdown-menu dropdown-menu-end my-1">
		                  <button id="airTwo" class="dropdown-item fs-base fw-bold">오는편</button>
		                </span></span>
                        </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        <hr style="width: 100%; color: grey;">
                    </div>
						<div class="modal-body px-sm-5 px-4">
                    		<section style="height: 70px;margin-bottom: 20px;">
                    			<div style="margin-left: 45px;"><span>출발공항</span> <span style="float: right;margin-right: 45px;">도착공항</span></div>
                    			<select id="airStartSta" style="float: left; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발공항</option>
                    				<c:forEach var="i" begin="0" end="${airStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${airStartList.get(i)}</option>
                    				</c:forEach>
			                      </select>
                    			<div style="float: left;margin-top: 8px;">
                    				<span style="margin-left: 18px;"><i class="fi-arrow-right"></i></span>
                    			</div>
                    			<select id="airEndSta" style="float: right; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>도착공항</option>
                    				<c:forEach var="i" begin="0" end="${airEndList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${airEndList.get(i)}</option>
                    				</c:forEach>
                    			</select>
                    		</section>
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 30px; height: 70px;">
                    			<div><span style="margin-left: 65px;margin-right: 135px;">날짜</span><span>인원</span></div>	
                    			<input class="form-control date-picker rounded-pill pi-5 start" style="float: left; width: 170px;" id="datepickerAir" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                    		
                    			<select id="airCount" style="float: right; width: 120px; margin-right: 20px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>인원</option>
			                      <option value="1">1명</option>
			                      <option value="2">2명</option>
			                      <option value="3">3명</option>
			                      <option value="4">4명</option>
			                      <option value="5">5명</option>
			                      <option value="6">6명</option>
			                      <option value="7">7명</option>
			                      <option value="8">8명</option>
			                      <option value="9">9명</option>
			                      <option value="10">10명</option>
			                      </select>
                    		</section>
                    		<!-- hidden으로 값 가져오기 -->
                    		<input type="hidden" id="str1" value="no">
                    		
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 10px; height: 70px;">
                    			<div><span style="margin-left: 20px;margin-right: 20px;">출발시간/항공사</span><span style="margin-right: 30px;">소요시간</span><span>도착시간</span></div>
                    			<select id="airStartTime" style="float: left;width: 120px;margin-left: 15px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발시간/항공사</option>
                    				<option value="">출발공항을 선택해주세요.</option>
			                      </select>
			                      <section style="float: left;margin-right: 20px;margin-left: 20px;">
			                      	<div style="height: 22px;">-----></div>
			                      </section>
                    			<select id="airArrTime" style="float: left; width: 120px;" class="form-control form-select" readonly>
                    			<option value="">도착시간</option>
                    			</select>
                    		</section>
                    		<section style="text-align: center;">
                    			<div id="airPrice">가격<span id="countt">/1인</span></div>
                    		</section>
                            <div id="airPay">
                            	<button style="width: 300px; margin: 0 auto; padding-left: 10px;padding-right: 10px;" class="btn btn-primary d-block mb-4" type="button" id="airPay">
                            	<img style="margin-right: 20px;" src="${path}/resources/image/payment_icon_yellow_small.png">예매하기</button>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
            
        <script> // 비행기
	       	$(document).ready(() => { // 인원 그대로
	       		$('#airStartSta').on('click', function() {
	       			var start = $("#airStartSta option:selected").text(); 
	       			
	       			$.ajax({
	       				type: 'get',
	       				url: '/air/start',
	       				data: {
	       					start: start
	       				},
	       				
	       				success:function(list) {
	       					console.log(list)
	       					str = "";
	       					if(list != '') {
	       						str += '<option value="" selected disabled hidden>도착공항</option>                              '
	       						$.each(list, function (i, obj) {
	                				str += '	<option value="i">'+obj+'</option>                                  '
	       						});
	       					}
	       					$("#airEndSta").html(str);
	       				},
	       				
	       				error:function(e) {
	       					
	       				}
	       			});
	       		});
	       		
	       		$('#airTwo').on('click', function() { // 왕복을 원하면
	       			var check = $("#airTwo").html(); // 가는편 오는편 가져오기
	       			if(check == '오는편') { // 가는편 가지고 오는편 가져오기 -> 왕복
	       				$("#airOne").html('오는편');
	       				$("#airTwo").html('가는편');
	       				
	       				var start = $("#airEndSta option:selected").text(); // 출발역 도착역 교환
		       			
		       			var end = $("#airStartSta option:selected").text();
		       			
		       			var date = $("#datepickerAir").val(); // 가는 날짜
		       			$("#datepickerAir").val("연도-월-일"); // 원래대로 돌려놓기
		       			var time = $("#airStartTime option:selected").text().substring(0,5); // 가는 시간
		       			var price = $("#airPrice").html().replace("원/1인",""); // 가는 표 가격
		       			$("#airPrice").html('가격<span id="countt">/1인</span>');
		       			var count = $("#airCount option:selected").text().replace("명",""); // 인원
		       			$("#airCount").html('<option value="" selected>'+ count +'명</option>');
						var item = "비행기 " + date.substr(5) + " " + time; // 결제할 떄 제품명
		       			var totalAmount = price * count;
						
		       			var str1 = date + "," + time + "," + count + "," + item + "," + totalAmount; // 가는 표 정보 문자열
						
						// 고정된 정보 readonly하기 -> 역만 바꾸면 됨
						$("#airStartSta").attr('readonly', true); // readonly 추가
						$("#airEndSta").attr('readonly', true); // readonly 추가
						$("#airStartSta").html('<option value="" selected>'+ start +'</option>');
						
						$("#airEndSta").html('<option value="" selected>'+ end +'</option>');
						
						$("#airCount").attr('readonly', true); // readonly 추가
						
						$("#airArrTime").html('<option value="">도착시간</option>');
						
						$("#str1").val(str1); // hidden에 저장
						
						$.ajax({ // 출발시간 바로 가져오기
		       				type: 'GET',
		       				url: '/air/time',
		       				data: {
		       					start: start,
		       					end: end
		       				},
		       				
		       				success:function(data) {
		       					console.log(data);
		       					
		       					str = "";
		       					str += '<option value="" selected disabled hidden>출발시간/항공사</option>';
		       					$.each(data, function (i, obj) {
		       						str += '<option value="'+i+'">'+ obj.starttime +'/'+ obj.airline +'</option>';
		       					})
		       					
		       					$("#airStartTime").html(str);
		       				},
		       				
		       				error:function(e) {
		       					console.log(e);
		       				}
		       			});	
	       			} else {
	       				$("#airOne").html('가는편');
	       				$("#airTwo").html('오는편');
	       				
	       				str = "";
	       				
	       				str += '<option value="" selected disabled hidden>출발공항</option>                            '
	       				
	       				<c:if test="${!empty airStartList}">
	       					<c:forEach var="i" begin="0" end="${airStartList.size() - 1}">
       						var item = '${airStartList.get(i)}';
       						str += '<option value="i">'+ item +'</option>'
       						</c:forEach>
	       				</c:if>
	       					
						$("#airStartSta").html(str);     				
	       				
						var end = "";
						<c:if test="${!empty airList}">
							end = '${airList.get(0).endsta}';
						</c:if>
							
        				$("#airEndSta").html('<option value="" selected>'+end+'</option>');
        				
        				$("#airCount").html('<option value="" selected disabled hidden>인원</option>' 
			                      +'<option value="1">1명</option>'
			                      +'<option value="2">2명</option>'
			                      +'<option value="3">3명</option>'
			                      +'<option value="4">4명</option>'
			                      +'<option value="5">5명</option>'
			                      +'<option value="6">6명</option>'
			                      +'<option value="7">7명</option>'
			                      +'<option value="8">8명</option>'
			                      +'<option value="9">9명</option>'
			                      +'<option value="10">10명</option>');
        				
        				$("#airStartTime").html('<option value="" selected disabled hidden>출발시간/항공사</option>'
                				+'<option value="">출발공항을 선택해주세요.</option>');
        				
        				$("#airArrTime").html('<option value="">도착시간</option>');
	       				
	       				$("#airPrice").html('가격<span id="countt">/1인</span>');
        				
		       			$("#str1").val('no'); // str1 값 없애서 가는편 없애기
	       			}
	       		});
	       		
	       		// 도착공항 선택
	       		$("#airEndSta").change(function() { // 변했을 때
       					var start = $("#airStartSta option:selected").text(); // 값 가져오기 -> 출발공항
       					var end = $("#airEndSta option:selected").text();
       					
       					$.ajax({
       						type: 'GET',
       						url: '/air/time',
       						data: {
       							start: start,
       							end: end
       						},
       						
       						success:function(data) {
       							console.log(data);
       							
       							str = "";
       							str += '<option value="" selected disabled hidden>출발시간/항공사</option>';
       							$.each(data, function (i, obj) {
       								str += '<option value="'+i+'">'+ obj.starttime +'/'+ obj.airline +'</option>';
       							})
       							
       							$("#airStartTime").html(str);
       						},
       						
       						error:function(e) {
       							console.log(e);
       						}
       					});
       				});
	       		
	       		
	       		$("#airStartTime").change(function() { // 변했을 때
	       				var start = $("#airStartSta option:selected").text(); // 값 가져오기 -> 출발역
   						var end = $("#airEndSta option:selected").text();; // 도착역
	       			
	       				var startTime = $("#airStartTime option:selected").text().substring(0,5); // 출발시간 가져오기
	       				
	       				$.ajax({
       						type: 'GET',
       						url: '/air/time',
       						data: {
       							start: start,
       							end: end,
       							time: startTime
       						},
       						
       						success:function(data) {
       							console.log(data);
       							
								$("#airPrice").html(data[0].price + "원/1인");
       							
       							str = '<option value="'+1+'">'+ data[0].endtime +'</option>';
       		       				$("#airArrTime").html(str);
       						},
       						
       						error:function(e) {
       							console.log(e);
       						}
       					});
	       			});
	       		
	       		
	       		$("#airPay").click(function(){ // 예매
	       			// 3가지로 교통정보 찾기
	       			var str = $("#str1").val(); // 가는 표 정보 가져오기 -> , 로 구분 // 예매가 있나 없나 확인 -> 가는편 있나 없나
	       			
	       			if(str == 'no') { // 가는편이 없을때 -> 편도
		       			var type = 'air'; // 종류
	       			} else {
				       	var type = 'airRound'; // 종류
	       			}
	       			
	       			var start = $("#airStartSta option:selected").text(); // 출발역
			       	var end = $("#airEndSta option:selected").text(); // 도착역
			       	var time = $("#airStartTime option:selected").text().substring(0,5); // 출발시간
			       	
					var date = $("#datepickerAir").val();
					var price = $("#airPrice").html().replace("원/1인","");
					var count = $("#airCount option:selected").text().replace("명",""); // 인원
					var item = "비행기 " + date.substr(5) + " " + time; // 결제할 떄 제품명
			       	var totalAmount = price * count;
					
					console.log(date)
					console.log(price)
					console.log(time)
	       			$.ajax({
			       		type: 'GET',
			       		url: '/pay/traffic',
			       		data: {
			       			start: start,
			       			end: end,
			       			time: time,
			       			date: date,
			       			count: count,
			       			type: type,
			       			total_amount: totalAmount,
			       			itemName: item,
			       			str: str
			       		},
			       		
			       		success:function(resp) {
			       			var url = resp.next_redirect_pc_url;
	       					window.open(url,'payQr','width=420,height=435,screenX=700,screenY=310'); // qr 보이게 크기 조정
			       		},
			       		
			       		error:function(e) {
			       			console.log(e);
			       		}
			       	});
	       		});
	       	});
       </script>
        
        <!-- 기차 예매 -->
        <div class="modal fade" id="modal-train" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center" id="airTitle">
                        기차 예매
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="trainOne" onclick="return flase;" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
		                <span class="dropdown-menu dropdown-menu-end my-1">
		                  <button id="trainTwo" class="dropdown-item fs-base fw-bold">오는편</button>
		                </span></span>
                        </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        <hr style="width: 100%; color: grey;">
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                    		<section style="height: 70px;margin-bottom: 20px;">
                    			<div style="margin-left: 45px;"><span>출발역</span> <span style="float: right;margin-right: 45px;">도착역</span></div>
                    			<select id="trainStartSta" style="float: left; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발역</option>
                    				<c:forEach var="i" begin="0" end="${trainStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${trainStartList.get(i)}</option>
                    				</c:forEach>
			                      </select>
                    			<div style="float: left;margin-top: 8px;">
                    				<span style="margin-left: 18px;"><i class="fi-arrow-right"></i></span>
                    			</div>
                    			<select id="trainEndSta" style="float: right; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>도착역</option>
                    				<c:forEach var="i" begin="0" end="${trainEndList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${trainEndList.get(i)}</option>
                    				</c:forEach>
                    			</select>
                    		</section>
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 30px; height: 70px;">
                    			<div><span style="margin-left: 65px;margin-right: 135px;">날짜</span><span>인원</span></div>	
                    			<input class="form-control date-picker rounded-pill pi-5 start" style="float: left; width: 170px;" id="datepickerTrain" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                    			
                    			<select id="trainCount" style="float: right; width: 120px; margin-right: 20px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>인원</option>
			                      <option value="1">1명</option>
			                      <option value="2">2명</option>
			                      <option value="3">3명</option>
			                      <option value="4">4명</option>
			                      <option value="5">5명</option>
			                      <option value="6">6명</option>
			                      <option value="7">7명</option>
			                      <option value="8">8명</option>
			                      <option value="9">9명</option>
			                      <option value="10">10명</option>
			                      </select>
                    		</section>
                    		<!-- hidden으로 값 가져오기 -->
                    		<input type="hidden" id="str2" value="no">
                    		
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 10px; height: 70px;">
                    			<div><span style="margin-left: 30px;margin-right: 25px;">출발시간/종류</span><span style="margin-right: 30px;">소요시간</span><span>도착시간</span></div>
                    			<select id="trainStartTime" style="float: left;width: 120px;margin-left: 15px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발시간/종류</option>
                    				<option value="">출발역을 선택해주세요.</option>
			                      </select>
			                      <section style="float: left;margin-right: 20px;margin-left: 20px;">
			                      	<div style="height: 22px;">-----></div>
			                      	<div style="font-size: 13px;" id="trainWasteTime">소요시간</div>
			                      </section>
                    			<select id="trainArrTime" style="float: left; width: 120px;" class="form-control form-select"readonly>
                    			<option value="">도착시간</option>
                    			</select>
                    		</section>
                    		<section style="text-align: center;">
                    			<div id="trainPrice">가격<span>/1인</span></div>
                    		</section>
                            <div id="trainPay">
                            	<button style="width: 300px; margin: 0 auto; padding-left: 10px;padding-right: 10px;" class="btn btn-primary d-block mb-4" type="button" id="trainPay">
                            	<img style="margin-right: 20px;" src="${path}/resources/image/payment_icon_yellow_small.png">예매하기</button>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
            
            
            <script> // 기차
	       	$(document).ready(() => {
	       		$('#trainStartSta').on('click', function() {
	       			var start = $("#trainStartSta option:selected").text(); 
	       			
	       			$.ajax({
	       				type: 'get',
	       				url: '/train/start',
	       				data: {
	       					start: start
	       				},
	       				
	       				success:function(list) {
	       					console.log(list)
	       					str = "";
	       					if(list != '') {
	       						str += '<option value="" selected disabled hidden>도착역</option>                              '
	       						$.each(list, function (i, obj) {
	                				str += '	<option value="i">'+obj+'</option>                                  '
	       						});
	       					}
	       					$("#trainEndSta").html(str);
	       				},
	       				
	       				error:function(e) {
	       					
	       				}
	       			});
	       		});
	       		
	       		
	       		$('#trainTwo').on('click', function() { // 왕복을 원하면
	       			var check = $("#trainTwo").html(); // 가는편 오는편 가져오기
	       			if(check == '오는편') { // 가는편 가지고 오는편 가져오기 -> 왕복
	       				$("#trainOne").html('오는편');
	       				$("#trainTwo").html('가는편');
	       				
	       				var start = $("#trainEndSta option:selected").text(); // 출발역 도착역 교환
		       			
		       			var end = $("#trainStartSta option:selected").text();
		       			
		       			var date = $("#datepickerTrain").val(); // 가는 날짜
		       			$("#datepickerTrain").val("연도-월-일"); // 원래대로 돌려놓기
		       			var time = $("#trainStartTime option:selected").text().substring(0,5); // 가는 시간
		       			var price = $("#trainPrice").html().replace("원/1인",""); // 가는 표 가격
		       			$("#trainPrice").html('가격<span id="countt">/1인</span>');
		       			var count = $("#trainCount option:selected").text().replace("명",""); // 인원
		       			$("#trainCount").html('<option value="" selected>'+ count +'명</option>');
						var item = "비행기 " + date.substr(5) + " " + time; // 결제할 떄 제품명
		       			var totalAmount = price * count;
						
		       			var str2 = date + "," + time + "," + count + "," + item + "," + totalAmount; // 가는 표 정보 문자열
						
						// 고정된 정보 readonly하기 -> 역만 바꾸면 됨
						$("#trainStartSta").attr('readonly', true); // readonly 추가
						$("#trainEndSta").attr('readonly', true); // readonly 추가
						$("#trainStartSta").html('<option value="" selected>'+ start +'</option>');
						
						$("#trainEndSta").html('<option value="" selected>'+ end +'</option>');
						
						$("#trainCount").attr('readonly', true); // readonly 추가
						
						$("#trainArrTime").html('<option value="">도착시간</option>');
						
						$("#str2").val(str2); // hidden에 저장
						
						$.ajax({ // 출발시간 바로 가져오기
		       				type: 'GET',
		       				url: '/train/time',
		       				data: {
		       					start: start,
		       					end: end
		       				},
		       				
		       				success:function(data) {
		       					console.log(data);
		       					
		       					str = "";
		       					str += '<option value="" selected disabled hidden>출발시간/종류</option>';
	   							
	   							$.each(data, function (i, obj) {
	   								str += '<option value="'+i+'">'+ obj.starttime +'/'+ obj.trainclass +'</option>';
		       					})
		       					
		       					$("#trainStartTime").html(str);
		       				},
		       				
		       				error:function(e) {
		       					console.log(e);
		       				}
		       			});	
	       			} else {
	       				$("#trainOne").html('가는편');
	       				$("#trainTwo").html('오는편');
	       				$("#datepickerTrain").val("연도-월-일"); // 원래대로 돌려놓기
	       				str = "";
	       				
	       				str += '<option value="" selected disabled hidden>출발역</option>                            '
	       				
	       				<c:forEach var="i" begin="0" end="${trainStartList.size() - 1}">
	       					var item = '${trainStartList.get(i)}';
	       					str += '<option value="i">'+ item +'</option>'
	       				</c:forEach>
	       					
						$("#trainStartSta").html(str);     				
	       				
						var end = '${trainList.get(0).endsta}';
        				$("#trainEndSta").html('<option value="" selected>'+end+'</option>');
        				
        				$("#trainCount").html('<option value="" selected disabled hidden>인원</option>' 
			                      +'<option value="1">1명</option>'
			                      +'<option value="2">2명</option>'
			                      +'<option value="3">3명</option>'
			                      +'<option value="4">4명</option>'
			                      +'<option value="5">5명</option>'
			                      +'<option value="6">6명</option>'
			                      +'<option value="7">7명</option>'
			                      +'<option value="8">8명</option>'
			                      +'<option value="9">9명</option>'
			                      +'<option value="10">10명</option>');
        				
        				$("#trainStartTime").html('<option value="" selected disabled hidden>출발시간/종류</option>'
                				+'<option value="">출발역을 선택해주세요.</option>');
        				
        				$("#trainArrTime").html('<option value="">도착시간</option>');
	       				
	       				$("#trainPrice").html('가격<span id="countt">/1인</span>');
        				
		       			$("#str2").val('no'); // str1 값 없애서 가는편 없애기
	       			}
	       		});
	       		
	       		$("#trainEndSta").change(function() { // 변했을 때
       					var start = $("#trainStartSta option:selected").text(); // 값 가져오기 -> 출발역
       					var end = $("#trainEndSta option:selected").text();; // 도착역
       					
       					$.ajax({
       						type: 'GET',
       						url: '/train/time',
       						data: {
       							start: start,
       							end: end
       						},
       						
       						success:function(data) {
       							console.log(data);
       							
       							str = "";
       							str += '<option value="" selected disabled hidden>출발시간/종류</option>';
       							
       							$.each(data, function (i, obj) {
       								str += '<option value="'+i+'">'+ obj.starttime +'/'+ obj.trainclass +'</option>';
       							})
       							
       							$("#trainStartTime").html(str);
       						},
       						
       						error:function(e) {
       							console.log(e);
       						}
       					});
       				});
	       		
	       		
	       		$("#trainStartTime").change(function() { // 변했을 때 -> 도착시간, 가격, 소요시간
	       				var start = $("#trainStartSta option:selected").text(); // 값 가져오기 -> 출발역
	       				var end = $("#trainEndSta option:selected").text();; // 도착역
	       			
	       				var startTime = $("#trainStartTime option:selected").text().substring(0,5); // 출발시간 가져오기
	       				
	       				$.ajax({
       						type: 'GET',
       						url: '/train/time',
       						data: {
       							start: start,
       							end: end,
       							time: startTime
       						},
       						
       						success:function(data) {
       							console.log(data);
       							
       							$("#trainWasteTime").html(data[0].wastetime);
								$("#trainPrice").html(data[0].generalprice + "원/1인");
       							
       							str = '<option value="'+1+'">'+ data[0].endtime +'</option>';
       		       				$("#trainArrTime").html(str);
       						},
       						
       						error:function(e) {
       							console.log(e);
       						}
       					});
	       			});
	       		
	       		                                                                                                   
	       		$("#trainPay").click(function(){     
	       			var str = $("#str2").val(); 

	       			if(str == 'no') {
	       				var type = 'train';    
	       			} else {
	       				var type = 'trainRound';    
	       			}
	       			
	       			var start = $("#trainStartSta option:selected").text(); // 출발역                              
	       			var end = $("#trainEndSta option:selected").text();; // 도착역                                          
	       			var time = $("#trainStartTime option:selected").text().substring(0,5); // 도착시간                            
	       			                                                                                               
	       			var date = $("#datepickerTrain").val();                                                        
					var price = $("#trainPrice").html().replace("원/1인","");                                      
					var count = $("#trainCount option:selected").text().replace("명",""); // 인원                  
	       			var totalAmount = price * count;                                                               
					var item = "기차 " + count + "인" + " " + time; // 결제할 떄 제품명                            
	       			                                                                                               
					// 비행기 번호는 db에서 가져오기                                                               
					                                                                                                    
	       			 $.ajax({                                                                                           
	       				type: 'GET',                                                                                    
	       				url: '/pay/traffic',                                                                            
	       				data: {                                                                                         
	       					start: start,                                                                               
	       					end: end,                                                                                   
	       					time: time,                                                                                 
	       					count: count,                                                                               
	       					date: date,                                                                                 
	       					type: type,                                                                                 
	       					total_amount: totalAmount,                                                                  
	       					itemName: item,
	       					str: str
	       				},                                                                                              
	       				                                                                                                
	       				success:function(resp) {                                                                        
	       					var url = resp.next_redirect_pc_url;
	       					window.open(url,'payQr','width=420,height=435,screenX=700,screenY=310'); // qr 보이게 크기 조정                                                  
	       				},                                                                                              
	       				                                                                                                
	       				error:function(e) {                                                                             
	       					console.log(e);                                                                             
	       				}                                                                                               
	       			});                                                                                                 
	       		});                                                                                                     
	       	});                                                                                                         
       </script>                                                                                                        
        
        <!-- 버스 예매 -->
        <div class="modal fade" id="modal-bus" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center" id="airTitle">
                        버스 예매
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="busOne" onclick="return flase;" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
		                <span class="dropdown-menu dropdown-menu-end my-1">
		                  <button id="busTwo" class="dropdown-item fs-base fw-bold">오는편</button>
		                </span></span>
                        </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        <hr style="width: 100%; color: grey;">
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                    		<section style="height: 70px;margin-bottom: 20px;">
                    			<div style="margin-left: 45px;"><span>출발역</span> <span style="float: right;margin-right: 45px;">도착역</span></div>
                    			<select id="busStartSta" style="float: left; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발역</option>
                    				<c:forEach var="i" begin="0" end="${busStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${busStartList.get(i)}</option>
                    				</c:forEach>
			                      </select>
                    			<div style="float: left;margin-top: 8px;">
                    				<span style="margin-left: 18px;"><i class="fi-arrow-right"></i></span>
                    			</div>
                    			<select id="busEndSta" style="float: right; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>도착역</option>
                    				<c:forEach var="i" begin="0" end="${busStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${busStartList.get(i)}</option>
                    				</c:forEach>
                    			</select>
                    		</section>
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 30px; height: 70px;">
                    			<div><span style="margin-left: 65px;margin-right: 135px;">날짜</span><span>인원</span></div>	
                    			<input class="form-control date-picker rounded-pill pi-5 start" style="float: left; width: 170px;" id="datepickerBus" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                    		
                    			<select id="busCount" style="float: right; width: 120px; margin-right: 20px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>인원</option>
			                      <option value="1">1명</option>
			                      <option value="2">2명</option>
			                      <option value="3">3명</option>
			                      <option value="4">4명</option>
			                      <option value="5">5명</option>
			                      <option value="6">6명</option>
			                      <option value="7">7명</option>
			                      <option value="8">8명</option>
			                      <option value="9">9명</option>
			                      <option value="10">10명</option>
			                      </select>
                    		</section>
                    		<!-- hidden으로 값 가져오기 -->
                    		<input type="hidden" id="str3" value="no">
                    		
                    		<hr style="width: 100%; border: 1px solid #E2E2E2; margin-bottom: 15px;">
                    		<section style="margin-bottom: 10px; height: 70px;">
                    			<div><span style="margin-left: 45px;margin-right: 45px;">출발시간</span><span style="margin-right: 30px;">소요시간</span><span>도착시간</span></div>
                    			<select id="busStartTime" style="float: left;width: 120px;margin-left: 15px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발시간</option>
                    				<option value="">출발역을 선택해주세요.</option>
			                      </select>
			                      <section style="float: left;margin-right: 20px;margin-left: 20px;">
			                      	<div style="height: 22px;">-----></div>
			                      	<div id="busWasteTime" style="font-size: 13px;">소요시간</div>
			                      </section>
                    			<select id="busArrTime" style="float: left; width: 120px;" class="form-control form-select" readonly>
                    			<option value="">따라 다름</option>
                    			</select>
                    		</section>
                    		<section style="text-align: center;">
                    			<div id="busPrice">가격<span>/1인</span></div>
                    		</section>
                    		<div id="busPay">
                            	<button style="width: 300px; margin: 0 auto; padding-left: 10px;padding-right: 10px;" class="btn btn-primary d-block mb-4" type="button" id="busPay">
                            	<img style="margin-right: 20px;" src="${path}/resources/image/payment_icon_yellow_small.png">예매하기</button>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
            
            <script> // 버스
	       	$(document).ready(() => {
	       		$('#busStartSta').on('click', function() {
	       			var start = $("#busStartSta option:selected").text(); 
	       			
	       			$.ajax({
	       				type: 'get',
	       				url: '/bus/start',
	       				data: {
	       					start: start
	       				},
	       				
	       				success:function(list) {
	       					console.log(list)
	       					str = "";
	       					if(list != '') {
	       						str += '<option value="" selected disabled hidden>도착공항</option>                              '
	       						$.each(list, function (i, obj) {
	                				str += '	<option value="i">'+obj+'</option>                                  '
	       						});
	       					}
	       					$("#busEndSta").html(str);
	       				},
	       				
	       				error:function(e) {
	       					
	       				}
	       			});
	       		});
	       		
	       		$('#busTwo').on('click', function() { // 왕복을 원하면
	       			var check = $("#busTwo").html(); // 가는편 오는편 가져오기
	       			if(check == '오는편') { // 가는편 가지고 오는편 가져오기 -> 왕복
	       				$("#busOne").html('오는편');
	       				$("#busTwo").html('가는편');
	       				
	       				var start = $("#busEndSta option:selected").text(); // 출발역 도착역 교환
		       			
		       			var end = $("#busStartSta option:selected").text();
		       			
		       			var date = $("#datepickerBus").val(); // 가는 날짜
		       			$("#datepickerBus").val("연도-월-일"); // 원래대로 돌려놓기
		       			var time = $("#busStartTime option:selected").text().substring(0,5); // 가는 시간
		       			var price = $("#busPrice").html().replace("원/1인",""); // 가는 표 가격
		       			$("#busPrice").html('가격<span>/1인</span>');
		       			var count = $("#busCount option:selected").text().replace("명",""); // 인원
		       			$("#busCount").html('<option value="" selected>'+ count +'명</option>');
						var item = "비행기 " + date.substr(5) + " " + time; // 결제할 떄 제품명
		       			var totalAmount = price * count;
						
		       			var str3 = date + "," + time + "," + count + "," + item + "," + totalAmount; // 가는 표 정보 문자열
						
						// 고정된 정보 readonly하기 -> 역만 바꾸면 됨
						$("#busStartSta").attr('readonly', true); // readonly 추가
						$("#busEndSta").attr('readonly', true); // readonly 추가
						$("#busStartSta").html('<option value="" selected>'+ start +'</option>');
						
						$("#busEndSta").html('<option value="" selected>'+ end +'</option>');
						
						$("#busCount").attr('readonly', true); // readonly 추가
						
						$("#str3").val(str3); // hidden에 저장
						
						$.ajax({ // 출발시간 바로 가져오기
		       				type: 'GET',
		       				url: '/bus/time',
		       				data: {
		       					start: start,
		       					end: end
		       				},
		       				
		       				success:function(data) {
		       					console.log(data);
		       					
		       					str = "";
		       					str += '<option value="" selected disabled hidden>출발시간</option>';
	   							$.each(data, function (i, obj) {
	   								if(i == 0) { // 소요시간
	   									$("#busWasteTime").html(obj);
	   								}
	   								
	   								if(i == 1) { // 가격
	   									$("#busPrice").html(obj+"원/1인");
	   								}
	   								
	   								if(i > 1) {
	   									str += '<option value="'+i+'">'+ obj +'</option>';	       									
	   								}
	   							})
		       					
		       					$("#busStartTime").html(str);
		       				},
		       				
		       				error:function(e) {
		       					console.log(e);
		       				}
		       			});	
	       			} else {
	       				$("#busOne").html('가는편');
	       				$("#busTwo").html('오는편');
	       				$("#datepickerBus").val("연도-월-일"); // 원래대로 돌려놓기
	       				str = "";
	       				
	       				str += '<option value="" selected disabled hidden>출발역</option>                            '
	       				
	       				<c:forEach var="i" begin="0" end="${busStartList.size() - 1}">
	       					var item = '${busStartList.get(i)}';
	       					str += '<option value="i">'+ item +'</option>'
	       				</c:forEach>
	       					
						$("#busStartSta").html(str);     				
	       				
						var end = '${busList.get(0).endsta}';
        				$("#busEndSta").html('<option value="" selected>'+end+'</option>');
        				
        				$("#busCount").html('<option value="" selected disabled hidden>인원</option>' 
			                      +'<option value="1">1명</option>'
			                      +'<option value="2">2명</option>'
			                      +'<option value="3">3명</option>'
			                      +'<option value="4">4명</option>'
			                      +'<option value="5">5명</option>'
			                      +'<option value="6">6명</option>'
			                      +'<option value="7">7명</option>'
			                      +'<option value="8">8명</option>'
			                      +'<option value="9">9명</option>'
			                      +'<option value="10">10명</option>');
        				
        				$("#busStartTime").html('<option value="" selected disabled hidden>출발시간</option>'
                				+'<option value="">출발역을 선택해주세요.</option>');
        				
	       				$("#busPrice").html('가격<span>/1인</span>');
        				
		       			$("#str3").val('no'); // str1 값 없애서 가는편 없애기
	       			}
	       		});
	       		
	       		$("#busEndSta").change(function() { // 변했을 때
       					var start = $("#busStartSta option:selected").text(); // 값 가져오기 -> 출발역
       					var end = $("#busEndSta option:selected").text();; // 도착역
       					
       					$.ajax({
       						type: 'GET',
       						url: '/bus/time',
       						data: {
       							start: start,
       							end: end
       						},
       						
       						success:function(data) {
       							console.log(data);
       							
       							str = "";
       							str += '<option value="" selected disabled hidden>출발시간/종류</option>';
       							$.each(data, function (i, obj) {
       								if(i == 0) { // 소요시간
       									$("#busWasteTime").html(obj);
       								}
       								
       								if(i == 1) { // 가격
       									$("#busPrice").html(obj+"원/1인");
       								}
       								
       								if(i > 1) {
       									str += '<option value="'+i+'">'+ obj +'</option>';	       									
       								}
       							})
       							console.log(str)
       							
       							$("#busStartTime").html(str);
       						},
       						
       						error:function(e) {
       							console.log(e);
       						}
       					});
       				});
	       		
	       		$("#busPay").click(function(){             
	       			var str = $("#str3").val();
	       			if(str == 'no') {
	       				var type = "bus"; 
	       			} else {
	       				var type = "busRound"
	       			}

	       			var start = $("#busStartSta option:selected").text(); // 출발역                             
	       			var end = $("#busEndSta option:selected").text();; // 도착역                                            
	       			var time = $("#busStartTime option:selected").text(); // 버스 출발시간                      
	       			                                                                                            
	       			var date = $("#datepickerBus").val();                                                       
					var price = $("#busPrice").html().replace("원/1인","");                                     
					var count = $("#busCount option:selected").text().replace("명",""); // 인원                 
	       			var totalAmount = price * count;                                                            
					var item = "버스 " + count + "인" + " " + time; // 결제할 떄 제품명                         
	       			                                       
	       			 $.ajax({
	       				type: 'GET',
	       				url: '/pay/traffic',
	       				data: {
	       					start: start,
	       					end: end,
	       					time: time,
	       					count: count,
	       					date: date,
	       					type: type,
	       					total_amount: totalAmount,
	       					itemName: item,
	       					str: str
	       				},
	       				
	       				success:function(resp) {
	       					var url = resp.next_redirect_pc_url;
	       					window.open(url,'payQr','width=420,height=435,screenX=700,screenY=310'); // qr 보이게 크기 조정
	       				},
	       				
	       				error:function(e) {
	       					console.log(e);
	       				}
	       			}); 
	       		});
	       	});
       </script>




    <!-- Top properties-->
    <section class="container-main mb-2">
        <div class="d-flex align-items-end align-items-lg-center justify-content-between mb-4 pb-md-2">
            <div class="d-flex w-100 align-items-center justify-content-between justify-content-lg-start">
                <h2 class="h3 mb-0 me-md-4 text-center">추천 캠핑장</h2>
           		<nav>
	                <div class="nav nav-tabs d-none d-md-flex ps-lg-2 mb-0" role="tablist">
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="campsite-tab" data-bs-toggle="tab" data-bs-target="#campsite" type="button" onclick="location.href='${path}/camp/campSearch?category=일반야영장';">일반 야영장</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="carcampsite-tab" data-bs-toggle="tab" data-bs-target="#carcampsite" type="button" onclick="location.href='${path}/camp/campSearch?category=자동차야영장';">자동차 야영장</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="glamping-tab" data-bs-toggle="tab" data-bs-target="#glamping" type="button" onclick="location.href='${path}/camp/campSearch?category=글램핑';">글램핑</button>
                    	<button class="nav-link  fs-sm   mb-2 mb-md-0 me-1" id="caravan-tab" data-bs-toggle="tab" data-bs-target="#caravan" type="button" onclick="location.href='${path}/camp/campSearch?category=카라반';">카라반</button>
	               	</div>
             	</nav> 
           	</div><a class="btn btn-link fw-normal d-none d-lg-block p-0" style="margin-right: 20px;" href="${path}/camp/campMain">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
    	<div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush mx-n2">
					<div class="tns-carousel-inner row gx-4 mx-0"
						data-carousel-options="{&quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;controlsContainer&quot;: &quot;#carousel-controls-tp&quot;, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;1320&quot;:{&quot;items&quot;:2}}}">
						<!-- Carousel item-->
						<div class="col">
							<div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
								<div class="col-md-7">
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="${path}camp/campDetail?no=100543"
										style="background-image: url(${path}/resources/image/c01.jpg); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1">반딧불 캠핑장</h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1">경기 안성시 금광면 연내동길 138-37</i>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="${path}camp/campDetail?no=100400">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c02.png" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">청도 사계절 캠핑장</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>경북 청도군 운문면 운문로 1436-23
												</div>
											</div>
										</div>
									</a>
									<a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="${path}camp/campDetail?no=100272">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c03.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">더 하루만 캠핑장</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>충북 괴산군 청천면 괴산로상신5길 6-10
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<!-- Carousel item-->
						<div class="col">
							<div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
								<div class="col-md-7">
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="${path}camp/campDetail?no=8180"
										style="background-image: url(${path}/resources/image/c04.png); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1">오색허브농원 캠핑장</h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1"></i>강원 양양군 서면 송어길 38
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="${path}camp/campDetail?no=7924">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c05.jpg" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">덕산참숯랜드</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>충남 예산군 덕산면 노곡길 59
												</div>
											</div>
										</div>
									</a>
									<a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="${path}camp/campDetail?no=7807">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c06.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">화기애애 단풍 캠핑장</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>강원 평창군 봉평면 흥정계곡길 674-38
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<!-- Carousel item-->
						<div class="col">
							<div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
								<div class="col-md-7">
									<a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100"
										href="${path}camp/campDetail?no=7648"
										style="background-image: url(${path}/resources/image/c07.jpg); height:600px;"><span
											class="img-gradient-overlay"></span>
										<div class="card-body content-overlay pb-0"></div>
										<div class="card-footer content-overlay border-0 pt-0 pb-4">
											<div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
												<div class="pe-2">
													<h3 class="h5 text-light mb-1">토일관광농원</h3>
													<div class="fs-sm opacity-70">
														<i class="fi-map-pin me-1"></i>경기 포천시 군내면 청군로 2857
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-5">
									<a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light"
										href="${path}camp/campDetail?no=7788">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c08.jpg" style="height: 270px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">이화야영장</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>경북 칠곡군 지천면 황학4길 21
												</div>
											</div>
										</div>
									</a> <a class="card border-0 overflow-hidden text-decoration-none text-light"
										href="${path}camp/campDetail?no=7740">
										<div class="card-body p-0 position-relative">
											<img src="${path}/resources/image/c09.jpg" style="height: 150px;" alt="Article image"><span
												class="img-gradient-overlay zindex-1"></span>
											<div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
												<h3 class="h5 text-light mb-1">더캠프</h3>
												<div class="fs-sm opacity-70">
													<i class="fi-map-pin me-1"></i>울산 울주군 상북면 삽재로 420
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

		<!-- Carousel custom controls-->
        <div class="tns-carousel-controls justify-content-center pt-md-2 mt-4" id="carousel-controls-tp">
            <button class="me-3" type="button"><i class="fi-chevron-left fs-xs"></i></button>
            <button type="button"><i class="fi-chevron-right fs-xs"></i></button>
        </div>
    </section>
    
    <aside style="position: fixed; top:530px; left:90%; opacity: 0.7;">
               <div class="menu" >
    <label for="expand-menu" style="height:36px;"><span class="material-symbols-outlined">list 빠른예매</span></label>
    <input type="checkbox" id="expand-menu" name="expand-menu" style="padding-bottom: 30px;">     <ul>
        <li><a class="" href="#modal-bus" data-bs-toggle="modal" style="height: 36px;"><span class="material-symbols-outlined">directions_bus 버스</span></a></li>
        <li><a class="" href="#modal-train" data-bs-toggle="modal" style="height: 36px;"><span class="material-symbols-outlined">directions_railway 기차</span></a></li>
        <li><a class="" href="#modal-air" data-bs-toggle="modal" style="height: 36px;"><span class="material-symbols-outlined">flight  비행기</span></a></li>
    </ul>
</div>
</aside>

    <section class="container-fluid mb-5 mt-n3 mt-lg-0 pt-4" style="background: #e4dabe; height:550px;">
        <section class="container mb-5 pb-2">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="h3 mb-0">진행중인 축제</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="${path}/festival/festivalMain">더보기<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pb-md-4 pb-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3787">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main4.jpg" alt="New York" style="height:250pt; width:100%;">
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">굿모닝양림축제 </h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.01~2022.10.31</h5>
                                </h3>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3775">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main2.jpg" alt="Chicago" style="height:250pt; width:100%;">

                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">용전들노래 가을걷이 한마당</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.26~2022.10.26</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3352">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main.jpg" alt="Los Angeles" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">제20회광안리어방축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.14~2022.10.16</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3256">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main5.jpg" alt="San Diego" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">보수동책방골목문화축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.14~2022.10.15</h5>
                            </div>
                        </a>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <a class="card shadow-sm card-hover border-0" href="${path}/festival/festivalDetail?no=3654">
                            <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="${path}/resources/image/festival-main3.jpg" alt="Dallas" style="height:250pt; width:100%;">
                                <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">

                                </div>
                            </div>
                            <div class="card-body text-center">
                                <h3 class="mb-0 fs-base text-nav">전포커피축제</h3>
                                <h5 class="mb-0 fs-base text-nav">2022.10.28~2022.10.29</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <section class="container mb-5 pb-lg-2">
        <div class="d-md-flex align-items-center justify-content-between mb-4 pb-md-2">
            <h2 class="h3 w-100 mb-md-0">전국 주요 공원</h2>
            <!-- Sorting by date-->
            <a class="btn btn-link fw-normal ms-md-3 pb-0" href="${path}/park/parkMain">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        </div>
        <!-- Carousel-->
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center">
            <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;: true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}}">
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/famousPark2.png)">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0"> 낙산 공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 서울특별시 종로구 창신동 611-19</h6>
                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=53216">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/Unjeong.jpg);">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0">운정 호수공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 경기도 파주시 야당동 1058</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=48668">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Item-->
                <div>
                    <div class="card border-0 bg-size-cover pt-5" style="background-position: 50% 50%; background-image: url(${path}/resources/image/park-main.jpg);">
                        <div class="d-none d-md-block" style="height: 13rem;"></div>
                        <div class="card-body text-center text-md-start pt-4 pt-xl-0">
                            <div class="d-md-flex justify-content-between align-items-end">
                                <div class="me-2 mb-4 mb-md-0">
                                    <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2">
                                    </div>
                                    <h3 class="h5 text-light mb-0">한림 공원</h3>
                                    <h6 class="text-light mb-0"><i class="fi-map-pin me-1"></i> 제주특별자치도 제주시 한림읍 협재리 2610</h6>

                                </div>
                                <div class="btn-group"><a class="btn btn-primary rounded-pill rounded-end-0 px-3" href="${path}/park/parkDetail?no=39915">공원으로 이동하기</a>
                                    <div class="position-relative border-start border-light zindex-5" style="margin-left: -1px;"></div>
                                    <button class="btn btn-primary rounded-pill rounded-start-0 px-3" type="button"><i class="fi-heart"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="width:200px; height:150px; margin-bottom:50px;">
        <div class="container mb-5">
            <div class="row">
                <div class="col-lg-7">
                    <h2 class="h3 w-100 mb-4">전국 맛집</h2>
                </div>
                <div class="col-lg-5">
                    <h2 class="h3 w-100 mb-4">H.Mall</h2>
                </div>
            </div>
            <div class="row">
                <!-- Banner-->
                <div class="col-lg-3">
                    <a class="d-block text-decoration-none bg-faded-accent rounded-3 h-100" href="${path}/near/foodDetail?no=62612" style="background-image: url(${path}/resources/image/food3.png); position: relative;">
                        <div style="position: absolute; left:5%; bottom:0; ">
                            <h4 style="color:#ffffff; margin: 0;">청어림</h4>
                            <h6 style="color:#ffffff;  margin: 0;"><i class="fi-map-pin me-1"></i>제주특별자치도 제주시</h6>
                            <h6 style="color:#ffffff;  margin: 0;">노형동 911-3</h6>
                            <br>
                        </div>
                    </a>
                </div>
                <!-- Where to eat-->
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative " style="margin-top:9px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">갈치찜</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                         <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i> 12,000 </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative " style="margin-top: 18px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main2.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">고등어구이(조림)</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                         <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i> 11,000 </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Item-->
                            <div class="d-flex align-items-start position-relative" style="margin-top: 18px"><img class="me-3 rounded-3" style="width: 140px; height: 140px;" src="${path}/resources/image/food-main3.jpg" alt="Brand logo">
                                <div>
                                    <h3 class="mb-1 fs-lg"><a class="nav-link stretched-link" href="${path}/near/foodDetail?no=62612">물회</a></h3>
                                    <h5 class="mb-2 fs-sm">고소함과 양념장이 어우러진 요리</h5>
                                    <ul class="list-unstyled mb-0 fs-xs">
                                        <li> 한식 </li>
                                        <li><i class="fi-cash me-1 fs-sm align-middle opacity-70"> </i>14,000 </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
                
                <div class="card-active col-xl-5 col-lg-6 pt-3" style="background: #eceefa; border-radius: 10px;">
                	<c:if test="${!empty shopList}">
	                    <c:forEach var= "i"  begin="0" end="${shopList.size() - 1}">
	                    <article class="d-flex align-items-start" style="max-width: 640px;">
	                        <a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="${shopList.get(i).link}"><img class="rounded-3" src="${shopList.get(i).image}" style="width:130px; height: 130px; " alt="여행"></a>
	                        <div>
	                            <h5 class="fs-base mt-1" style="margin-bottom: 10px">
		                            <c:if test="${shopList.get(i).cate3 eq '액티비티'}">
			                            <span class="d-table badge bg-info">${shopList.get(i).cate3}</span>
		                            </c:if>
		                            <c:if test="${shopList.get(i).cate3 eq '국내숙박'}">
			                            <span class="d-table badge bg-success">${shopList.get(i).cate3}</span>
		                            </c:if>
	                            </h5>
	                            <p class="mb-2 fs-sm"><a class="nav-link" href="${shopList.get(i).link}" style="padding: 0;">${shopList.get(i).title}</a></p>
	                            <a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-cash mt-n1 me-1 fs-sm align-middle opacity-70"></i>${shopList.get(i).price}원</a>
	                        </div>
	                    </article>
	                    <c:if test="${i < 2}">
	                         <hr class="text-dark opacity-10 my-3">
	                    </c:if>
	                    </c:forEach>
                    </c:if>
                </div>
                
                
                
            </div>
        </div>
    </section>
    </main>
      
	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
    <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js "></script>
    <script src="${path}/resources/vendor/rellax/rellax.min.js "></script>
	<script src="${path}/resources/js/theme.min.js "></script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
