<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공원 상세" name="title"/>
</jsp:include>

<link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css" />
<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
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
                }<style>
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
    
    .ico_animation_wt1 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt1.svg);
    }
    
    .ico_animation_wt5 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt5.svg);
    }
    
    .ico_animation_wt7 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt7.svg);
    }
    
    .ico_animation_wt8 {
        background-image: url(https://ssl.pstatic.net/static/weather/image/icon_weather/ico_animation_wt8.svg);
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
    
    .weather_area .weather_now .summary .lowtem {
        display: inline-block;
        vertical-align: top;
        margin: 0 5px 0 5px;
        font-size: 16px;
        font-weight: 700;
        line-height: 21px;
        letter-spacing: -1px;
        color: rgb(2, 68, 250);
        text-align: left;
    }
    
    .weather_area .weather_now .summary .hightem {
        display: inline-block;
        vertical-align: top;
        margin: 0 0 0 5px;
        font-size: 16px;
        font-weight: 700;
        line-height: 21px;
        letter-spacing: -1px;
        color: rgb(218, 4, 4);
        text-align: left;
    }
    
    .weather_area .weather_now .summary .weather {
        display: block;
        margin-bottom: 3px;
        font-size: 23px;
        line-height: 25px;
        letter-spacing: -1px;
    }
    
    .weather_area .secondary {
        color: rgb(99, 98, 98);
        font-weight: 600;
    }
    
    .weather_area .secondaryInfo {
        color: rgb(66, 66, 66);
        font-weight: 700;
        margin-right: 10px;
    }
    
    .weather_area .weather_now .summary .temperature {
        display: inline-block;
        font-size: 18px;
        line-height: 21px;
        letter-spacing: -1px;
        vertical-align: top;
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
    
    .btn-group-sm .on {
    	background-color: black;
    	color: white;
    }
    .btn-group-sm .on:active {
    	background-color: black;
    	color: white;
    }
     .btn-group-sm>button:hover {
    	background-color: black;
    	color: white;
    }
</style>

        <!-- Review modal-->
        <div class="modal fade" id="modal-review" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">공원후기 등록</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" action="${path}/review/write" method="POST">
                        <input type="hidden" name="type" value="park">
                        <input type="hidden" name="no" value="${park.no}">
                            <div class="mb-3">
                                <label class="form-label" for="review-name">이름 <span class='text-danger'>*</span></label>
                                <input class="form-control" type="text" id="review-id" name="id" value="${loginMember.id}" readonly>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점 <span class='text-danger'>*</span></label>
                                <select class="form-control form-select" id="review-rating" name="star" required>
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
                                <label class="form-label" for="review-text">공원후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" id="review-text" rows="5" placeholder="공원 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script type="text/javascript">
			function reviewSort(showId){
				var sortVal = $('#reviews-sort').val();
				var pageNo = 1;
				console.log(sortVal);
				$.ajax({
					url : "",
					type: "POST",
					dataType : "text",
					data : {"sort" : sortVal }
				})
						
				
			}
        
		</script>
        <!-- 비행기 예매 -->
        <div class="modal fade" id="modal-air" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center" id="airTitle">
                        비행기 예매
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="airOne" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
		                <span class="dropdown-menu dropdown-menu-end my-1">
		                  <button id="airTwo" class="dropdown-item fs-base fw-bold">오는편</button>
		                </span></span>
                        </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        <hr style="width: 100%; color: grey;">
                    </div>
                    <!-- 근처 공항이 없을 때 -->
                    <c:if test="${airCheck == 0}">
                    	<div class="modal-body px-sm-5 px-4">
                    		<span>근처 공항이 없습니다.</span>
                    	</div>
                    </c:if>
                    
                    <!-- 근처 공항이 있을 때 -->
                    <c:if test="${airCheck == 1}">
                    	<div class="modal-body px-sm-5 px-4">
                    		<section style="height: 70px;margin-bottom: 20px;">
                    			<div style="margin-left: 45px;"><span>출발공항</span> <span style="float: right;margin-right: 45px;">도착공항</span></div>
                    			<select id="airStartSta" style="float: left; width: 150px;" class="form-control form-select">
                    			<option value="" selected disabled hidden>출발공항</option>
                    				<%-- <c:forEach var="i" begin="0" end="${airStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${airStartList.get(i)}</option>
                    				</c:forEach> --%>
			                      </select>
                    			<div style="float: left;margin-top: 8px;">
                    				<span style="margin-left: 18px;"><i class="fi-arrow-right"></i></span>
                    			</div>
                    			<select id="airEndSta" style="float: right; width: 150px;" class="form-control form-select" readonly>
                    			<option value="" selected>${airList.get(0).endsta}</option>
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
                    </c:if>
                    </div>
                </div>
            </div>
            
		<script> // 비행기
	       	$(document).ready(() => { // 인원 그대로
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
	       		
	       		// 출발공항 선택되었을 때 출발시간 리스트 가져오기
	       		$("#airStartSta").change(function() { // 변했을 때
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
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="trainOne" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
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
                    			<select id="trainEndSta" style="float: right; width: 150px;" class="form-control form-select" readonly>
                    			<option value="" selected>${trainList.get(0).endsta}</option>
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
	       		
	       		$("#trainStartSta").change(function() { // 변했을 때
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
                        <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" id="busOne" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가는편</a>
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
                    			<select id="busEndSta" style="float: right; width: 150px;" class="form-control form-select"readonly>
                    			<option value="" selected>${busList.get(0).endsta}</option>
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
	       		
	       		$("#busStartSta").change(function() { // 변했을 때
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
       
       
        <!-- Page content-->
        <section class="container mt-5 mb-lg-5 mb-4 pt-5 pb-lg-5">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="real-estate-home-v1.html">홈페이지</a></li>
                    <li class="breadcrumb-item"><a href="real-estate-catalog-rent.html">공원</a></li>
                    <li class="breadcrumb-item active" aria-current="page">칠십리공원</li>
                </ol>
            </nav>
            <div class="row gy-5 pt-lg-2">
                <div class="col-lg-7">
                    <div class="d-flex flex-column">
                        <!-- Carousel with slides count-->
                        <div class="order-lg-1 order-2">
                            <div class="tns-carousel-wrapper">
                                <div class="tns-slides-count text-light"><i class="fi-image fs-lg me-2"></i>
                                    <div class="ps-1"><span class="tns-current-slide fs-5 fw-bold"></span><span class="fs-5 fw-bold">/</span><span class="tns-total-slides fs-5 fw-bold"></span></div>
                                </div>
                                <div class="tns-carousel-inner" data-carousel-options="{&quot;navAsThumbnails&quot;: true, &quot;navContainer&quot;: &quot;#thumbnails&quot;, &quot;gutter&quot;: 12, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false},&quot;500&quot;:{&quot;controls&quot;: true}}}">
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail1.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail2.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail3.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail4.jpg" alt="Image"></div>
                                    <div><img class="rounded-3" src="${path}/resources/image/parkDetail5.jpg" alt="Image"></div>
                                </div>
                            </div>
                            <!-- Thumbnails nav-->
                            <ul class="tns-thumbnails mb-4" id="thumbnails">
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail1.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail2.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail3.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail4.jpg" alt="Thumbnail"></li>
                                <li class="tns-thumbnail"><img src="${path}/resources/image/parkDetail5.jpg" alt="Thumbnail"></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Reviews-->
                    <div class="mb-4 pb-4 border-bottom">
                        <h3 class="h4 pb-3"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>4,9 (32 후기)</h3>
                        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between"><a class="btn btn-outline-primary mb-sm-0 mb-3" href="#modal-review" data-bs-toggle="modal"><i class="fi-edit me-1"></i>후기 등록</a>
                            <div class="d-flex align-items-center ms-sm-4">
                                <label class="me-2 pe-1 text-nowrap" for="reviews-sorting"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>정렬순:</label>
                                <select class="form-select" id="reviews-sorting">
                      <option id="new">최신순</option>
                      <option id="old">오래된순</option>
                      <option id="like">좋아요순</option>
                      <option id="star">별점 높은순</option>
                    </select>
                            </div>
                        </div>
                    </div>
                    <!-- Review-->
                    <div id="revDiv">
                    	<c:if test="${empty revList}">
                    		리뷰내역이 없습니다.
                    	</c:if>
                    	<c:if test="${!empty revList}">
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0">${revList.get(0).id}</h6>
                                    	<span class="star-rating">
                                    		<c:if test="${revList.get(0).revstar == 5}">
                                    			<i class="star-rating-icon fi-star-filled active"></i>
                                    			<i class="star-rating-icon fi-star-filled active"></i>
                                    			<i class="star-rating-icon fi-star-filled active"></i>
                                    			<i class="star-rating-icon fi-star-filled active"></i>
                                    			<i class="star-rating-icon fi-star-filled active"></i>
                                    		</c:if>
                                    		<c:if test="${revList.get(0).revstar < 5}">
                                    			<c:forEach var="i" begin="1" end="${revList.get(0).revstar}">
                                    				<i class="star-rating-icon fi-star-filled active"></i>
                                    			</c:forEach>
                                    		</c:if>
                                    	</span>
                                </div>
                            </div><span class="text-muted fs-sm">${revList.get(0).createdate}</span></div><p>${revList.get(0).cont}</p>
                        <div class="d-flex align-items-center" id="like${revList.get(0).no}"><button class="btn-like" type="button" onclick="likePlus(${revList.get(0).no})"><i class="fi-heart"></i>(<span id="revLike${revList.get(0).no}">${revList.get(0).revlike}</span>)</button>
                        </div></div>
                        
                        <div class="mb-4 pb-4 border-bottom"><div class="d-flex justify-content-between mb-3"><div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="img/avatars/03.jpg" width="48" alt="Avatar">
                                <div class="ps-2"><h6 class="fs-base mb-0">${revList.get(1).id}</h6>
                                    <span class="star-rating">
	                                    <c:if test="${revList.get(1).revstar == 5}">
	                                    	<i class="star-rating-icon fi-star-filled active"></i>
	                                    	<i class="star-rating-icon fi-star-filled active"></i>
	                                    	<i class="star-rating-icon fi-star-filled active"></i>
	                                    	<i class="star-rating-icon fi-star-filled active"></i>
	                                    	<i class="star-rating-icon fi-star-filled active"></i>
	                                    </c:if>
	                                    <c:if test="${revList.get(1).revstar < 5}">
	                                    	<c:forEach var="i" begin="1" end="${revList.get(1).revstar}">
	                                    		<i class="star-rating-icon fi-star-filled active"></i>
	                                   	 	</c:forEach>
	                                    	<c:forEach var="i" begin="${revList.get(1).revstar + 1}" end="5">
	                                    		<i class="star-rating-icon fi-star"></i>
	                                    	</c:forEach>
	                                    </c:if>
                                    </span></div>
                            </div><span class="text-muted fs-sm">${revList.get(1).createdate}</span></div><p>${revList.get(1).cont}</p>
                        <div class="d-flex align-items-center" id="like${revList.get(1).no}"><button class="btn-like" type="button" onclick="likePlus(${revList.get(1).no})"><i class="fi-heart"></i>(<span id="revLike${revList.get(1).no}">${revList.get(1).revlike}</span>)</button>
                        </div></div>
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
                
                <script>
                	$("#sort").change(function() {
                		goPage(1);
                	});
                
                	function likePlus(no) {
                		$.ajax({
                			type: 'GET',
                			url: '/review/like',
                			data: {
                				no: no,
                				check: 1 // like + 1
                			},
                			
                			success:function(like) {
                				console.log(like)
                				$("#like"+no).html('<button class="btn-like" type="button" onclick="likeMinus('+ no +')"><i class="fi-heart-filled"></i>(<span id="revLike'+ no +'">'+ like +'</span>)</button>')
                			},
                			
                			error:function(e) {
                				console.log(e)
                			}
                		});
                	}
                	
                	function likeMinus(no) {
                		$.ajax({
                			type: 'GET',
                			url: '/review/like',
                			data: {
                				no: no,
                				check: 0
                			},
                			
                			success:function(like) {
								$("#like"+no).html('<button class="btn-like" type="button" onclick="likePlus('+ no +')"><i class="fi-heart"></i>(<span id="revLike'+ no +'">'+ like +'</span>)</button>')
                			},
                			
                			error:function(e) {
                				console.log(e)
                			}
                		});
                	}
                
                	function goPage(no) {
                		var sort = $("#sort option:selected").text(); // 정렬 방법
                		var park = '${park.no}'; // 공원 번호
                		
                		console.log(sort)
                		
                		$.ajax({
                			type: 'GET',
                			url: "/park/rev",
                			data: {
                				no: no,
                				sort: sort,
                				park: park
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
                
                <!-- Sidebar with details-->
                <aside class="col-lg-5">
                    <div class="ps-lg-5">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <span class="badge bg-success me-2"><c:out value="${park.category}"/></span>
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
                        <!-- Property details-->
                        <h2 class="h2"><c:out value="${park.name}"/></h2>
                        <div class="card border-0 bg-secondary mb-4">
                            <div class="card-body">
                                <ul class="list-unstyled mt-n2 mb-0">
                                    <li class="mt-2 mb-0"><b>주소 | </b><c:out value="${park.addr}"/></li>
                                    <li class="mt-2 mb-0"><b>전화번호 | </b><c:out value="${park.phone}"/></li>
                                    <li class="mt-2 mb-0"><b>운동시설 | </b><c:out value="${park.sport}"/></li>
                                </ul>
                            </div>
                        </div>
                        
                        
                    <!-- 교통 -->    
                        <h6 class="mb-0">• 교통편 확인하기</h6>
        			<div style="height: 110px; background-color:#F5F4F8; border-radius:10px; margin-bottom:20px;"> <!-- 교통 예매 div --> <!-- 팝업으로 이동 -->
        				<div class="p-3">
        				<a class="" href="#modal-air" data-bs-toggle="modal" style="border-radius: 50%; width:30px; height: 30px;"><img src="/resources/image/airplane.png" style="border: 6px solid #676D8E; border-radius: 50%; width:80px;height: 80px;margin-left: 40px;"></a>
        				<a style="margin-left: 25px; margin-right: 25px; font-size:20pt;">/</a>
        				<a class="" href="#modal-train" data-bs-toggle="modal" style="border-radius: 50%; width:30px; height: 30px;"><img src="/resources/image/train.png" style="border: 6px solid #676D8E; border-radius: 50%; width:80px;height: 80px;"></a>
        				<a style="margin-left: 25px; margin-right: 25px; font-size:20pt;">/</a>
        				<a class="" href="#modal-bus" data-bs-toggle="modal" style="border-radius: 50%; width:30px; height: 30px;"><img src="/resources/image/school-bus.png" style="border: 6px solid #676D8E; border-radius: 50%; width:80px; height: 80px;"></a>
        				</div>
        			</div>
        			
        			
                        <!--Map-->
                        <div id="map" style="width: 480px; height: 300px; border-radius:2%;"></div>
                        <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8cddaf5bb7b88f487cf47627b52b649b"></script>
                        <script>
                            var container = document.getElementById('map');
                            var options = {
                                center: new kakao.maps.LatLng('${park.lat}', '${park.lng}'),
                                level: 3
                            };

                            var map = new kakao.maps.Map(container, options);

                            var markerPosition = new kakao.maps.LatLng('${park.lat}', '${park.lng}');

                            var marker = new kakao.maps.Marker({
                                position: markerPosition
                            });

                            marker.setMap(map);
                        </script>
                        <br>
                        
                        
                        <h3 class="h4">오늘의 날씨</h3>
                        <!-- Not included in rent-->
                        <div style="margin-bottom:30px;">
	                                <p id="weaStr" style="float: left; color: black; font-weight:600;">현재 공원의 날씨는?</p>
	                               	<div style="margin-left: 265px;width: 150px;text-align: center;">
	                               		<div class="btn-group btn-group-sm" role="group" style="width:150px;">
	                               			<button class="btn btn-outline-secondary on" id="today" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">오늘</button>
	                               			<button class="btn btn-outline-secondary" id="one" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">내일</button>
	                               			<button class="btn btn-outline-secondary" id="two" type="button" style="padding-left: 10px;padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">모레</button>
	                               		</div>
	                               	</div>
                                </div>
                    <div class="weather_area mb-4 p-0">
                                        <div class="weather_now m-0 p-0">
                                            <div class="summary_img m-0 p-0">
                                            	<c:set var="rainStr" value="${today.pcp}"/>
                                            
                                                <c:if test="${fn:contains(rainStr, 'mm')}"> <!-- 비올때 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt8" data-ico="ico_animation_wt8" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt1" data-ico="ico_animation_wt1" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today.sky <= 8}"> <!-- 구름많음 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt5" data-ico="ico_animation_wt5" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 --> 
                                                	<i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022092623"></i>
                                                </c:if>
                                                <strong class="current">
                                                <span class="blind">현재 온도</span>${today.tmp}<span class="degree">°</span>
                                            </strong>
                                            </div>
                                            <p class="summary p-0">
                                                <span class="weather">
                                                <c:if test="${today.sky <= 5}"> <!-- 맑음 -->
                                                	&nbsp&nbsp맑음
                                                </c:if>
                                                <c:if test="${today.sky > 5 && today.sky <= 8}"> <!-- 구름많음 -->
                                                	구름많음
                                                </c:if>
                                                <c:if test="${today.sky > 8}"> <!-- 흐림 -->
                                                	&nbsp&nbsp흐림
                                                </c:if>
                                                </span>
                                                <c:set var="tmn" value="${today.tmn}" />
                                                <c:set var="tmx" value="${today.tmx}" />
                                                <span class="lowtem">${fn:replace(tmn,'.0','')}</span>/<span class="hightem">${fn:replace(tmx,'.0','')}</span>
                                            </p>
                                        </div>
                                        <div>
                                            <span class="secondary">습도 </span><span class="secondaryInfo">${today.reh}%</span>
                                            <span class="secondary">강수확률 </span><span class="secondaryInfo">${today.pop}%</span>
                                            <span class="secondary">강수량 </span><span class="secondaryInfo">${today.pcp}</span>
                                        </div>
                                    </div>
                                    
			<script>
	        	$(document).ready(function() {
	        		$('.btn-group-sm').find('button').click(function() {
	        			var on_id = $(this).attr('id');
	        			
	        			$('.btn-group-sm button').removeClass('on');
	        			
	        			$("#" + on_id).addClass('on'); // 클릭한 클래스에 on 추가
	        			
	        			var i = -1;
	        			
	        			var sky = 100;
		        		var tmp = 100;
		        		var tmn = 100;
		        		var tmx = 100;
		        		var reh = 100;
		        		var pop = 100;
		        		var pcp = "";
		        			
		        		if(on_id == 'today') {      
			        		sky = ${today.sky};   
			        		tmp = ${today.tmp};   
			        		tmn = ${today.tmn};   
			        		tmx = ${today.tmx};   
			        		reh = ${today.reh};   
			        		pop = ${today.pop};   
			        		pcp = '${today.pcp}';   
	        				$('#weaStr').html('현재 공원의 날씨는?')
	        			} 
						if(on_id == 'one') {
							sky = ${one.sky};   
			        		tmp = ${one.tmp};   
			        		tmn = ${one.tmn};   
			        		tmx = ${one.tmx};   
			        		reh = ${one.reh};   
			        		pop = ${one.pop};   
			        		pcp = '${today.pcp}';  
						    $('#weaStr').html('내일 공원의 날씨는?')
						} 
						if(on_id == 'two') {
							sky = ${two.sky};   
			        		tmp = ${two.tmp};   
			        		tmn = ${two.tmn};   
			        		tmx = ${two.tmx};   
			        		reh = ${two.reh};   
			        		pop = ${two.pop};   
			        		pcp = '${today.pcp}';  
							$('#weaStr').html('모레 공원의 날씨는?')
						} 
						
						var one = '${weaList.get(i).sky}'
						console.log(one)
						str = "";
						
						str += '	 <div class="weather_now m-0 p-0">                                                                                            '
		                str += '     <div class="summary_img m-0 p-0">                                                                                            '
		                
		                if(pcp != '강수없음') {
		                	str += '<i class="ico_animation _cnLazy ico_animation_wt8" data-ico="ico_animation_wt8" data-ymdt="2022092623"></i>           '
		                } else if(sky <= 5) {
			            	str += '<i class="ico_animation _cnLazy ico_animation_wt1" data-ico="ico_animation_wt1" data-ymdt="2022092623"></i>           '
				        } else if(sky > 5 && sky <= 8) {
							str += '<i class="ico_animation _cnLazy ico_animation_wt5" data-ico="ico_animation_wt5" data-ymdt="2022092623"></i>           '
				        } else if(sky > 8) {
							str += '<i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022092623"></i>           '
						}
		                
		                str += '         <strong class="current">                                                                                                 '
		                str += '         <span class="blind">현재 온도</span>'+ tmp +'<span class="degree">°</span>                                   '
		                str += '     </strong>                                                                                                                    '
		                str += '     </div>                                                                                                                       '
		                str += '     <p class="summary p-0">                                                                                                      '
		                str += '         <span class="weather">                                                                                                   '
		                
		                if(sky <= 5) {
		                	str += '&nbsp&nbsp맑음';
		                } else if(sky > 5 && sky <= 8) {
		                	str += '구름많음'
		                } else if(sky > 8) {
							str += '&nbsp&nbsp흐림'
						}
						
		                str += '         </span>                                                                                                                  '
		                str += '         <span class="lowtem">'+ tmn +'</span>/<span class="hightem">'+ tmx +'</span>                     '
		                str += '     </p>                                                                                                                         '
		                str += ' </div>                                                                                                                           '
		                str += ' <div>                                                                                                                            '
		                str += '     <span class="secondary">습도 </span><span class="secondaryInfo">'+ reh +'%</span>                                '
		                str += '     <span class="secondary">강수확률 </span><span class="secondaryInfo">'+ pop +'%</span>                            '
		                str += '     <span class="secondary">강수량 </span><span class="secondaryInfo">'+ pcp +'</span>                               '
		                str += ' 		</div>                                                                                                                    '
		             	str += '		</div>                                                                                                                    '
		             	
		             	$('.weather_area').html(str);
	        		})
	        	})
        </script>
                    </div>
                </aside>
            </div>
        </section>
        <!-- Recently viewed-->
        <section class="container mb-5 pb-2 pb-lg-4">
            <div>
                <h2 class="h3 mb-sm-0" style="display:inline;">근처 </h2>
                <h2 class="h3 mb-sm-0" style="display:inline; color: #F7B202;"> 음식점</h2>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <c:if test="${!empty foodlist}">
                    	<c:forEach var="i" begin="0" end="4">
                    		<!-- Item-->
                    		<div class="col">
                        		<div class="card shadow-sm card-hover border-0 h-100">
                            		<div class="card-img-top card-img-hover">
                                		<a class="img-overlay" href="#"></a>
                                		<div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    		<button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                		</div>
                                		<c:set var="foodType" value="${foodlist.get(i).type}"/>
					                    	<c:if test="${fn:contains(foodType, '한식')}">
					                    		<img src="${path}/resources/image/pFood/kor<%=Math.round(Math.random()*4 + 1)%>.png" alt="Image" style="width: 100%; height:200px; object-fit: cover;">
					                    	</c:if>
					                    	<c:if test="${fn:contains(foodType, '일식')}">
					                    		<img src="${path}/resources/image/pFood/jap<%=Math.round(Math.random()*1 + 1)%>.png" alt="Image" style="width: 100%; height:200px; object-fit: cover;">
					                    	</c:if>
					                    	<c:if test="${fn:contains(foodType, '중식')}">
					                    		<img src="${path}/resources/image/pFood/chi<%=Math.round(Math.random()*2 + 1)%>.png" alt="Image" style="width: 100%; height:200px; object-fit: cover;">
					                    	</c:if>
					                    	<c:if test="${fn:contains(foodType, '분식')}">
					                    		<img src="${path}/resources/image/pFood/boon1.png" alt="Image" style="width: 100%; height:200px; object-fit: cover;">
					                    	</c:if>
					                    	<c:if test="${fn:contains(foodType, '뷔페')}">
					                    		<img src="${path}/resources/image/pFood/buf1.png" alt="Image" style="width: 100%; height:200px; object-fit: cover;">
					                    	</c:if>
					                    	<c:if test="${!fn:contains(foodType, '한식') && !fn:contains(foodType, '일식') && !fn:contains(foodType, '중식') && !fn:contains(foodType, '분식') && !fn:contains(foodType, '뷔페')}">
					                    		<img src="${path}/resources/image/pFood/res1.png" alt="Image" style="height:200px;">
					                    	</c:if>
                            		</div>
                            		<div class="card-body position-relative pb-3">
                                		<h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="#">${foodlist.get(i).name}</a></h3>
                                		<p class="mb-2 fs-sm text-muted">${foodlist.get(i).addr}</p>
                                		<div class="fw-bold">${foodlist.get(i).phone}</div>
                            		</div>
                            		<div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                		<p class="mb-2 fs-sm text-muted"># ${foodlist.get(i).type}&nbsp;&nbsp;# ${foodlist.get(i).main}&nbsp;&nbsp;</p>
                            		</div>
                        		</div>
                    		</div>	
                    	</c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        
        <!-- Vendor scrits: js libraries and plugins-->
        <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
        <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
        <script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js"></script>
        <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
        <!-- Main theme script-->
        <script src="${path}/resources/js/theme.min.js"></script>
