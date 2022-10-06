<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 상세" name="title"/>
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
                                <textarea class="form-control" id="review-text" name="cont" rows="5" placeholder="캠핑장 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <input class="btn btn-primary d-block w-100 mb-4" type="submit" value="후기 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 비행기 예매 -->
        <div class="modal fade" id="modal-air" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center">비행기 예매</h3>
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
                    				<c:forEach var="i" begin="0" end="${airStartList.size() - 1}"> <!-- 출발역 개수 만큼 -->
                    					<option value="i">${airStartList.get(i)}</option>
                    				</c:forEach>
			                      </select>
                    			<span style="margin-left: 15px;">---></span>
                    			<select id="airEndSta" style="float: right; width: 150px;" class="form-control form-select"readonly>
                    			<option value="">${airList.get(0).endsta}</option>
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
                            <input style="width: 250px; margin: auto;" class="btn btn-primary d-block mb-4" type="submit" id="airPay" value="예매하기">
                       </div>
                    </c:if>
                    </div>
                </div>
            </div>
            
        <script> // 비행기
	       	$(document).ready(() => {
	       		// 출발공항 선택되었을 때 출발시간 리스트 가져오기
	       		$("#airStartSta").change(function() { // 변했을 때
       					var start = $("#airStartSta option:selected").text(); // 값 가져오기 -> 출발공항
       					var end = "";
       					
       					<c:if test="${!empty airList}">
       						end = '${airList.get(0).endsta}';
       					</c:if>
       					
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
   						var end = ""; // 도착역
   						
   						<c:if test="${!empty airList}">
   							end = '${airList.get(0).endsta}';
						</c:if>
	       			
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
	       		
	       		
	       		$("#airPay").click(function(){
	       			// 3가지로 교통정보 찾기
	       			var start = $("#airStartSta option:selected").text(); // 출발역
	       			var end = $("#airEndSta option:selected").text(); // 도착역
	       			var time = $("#airStartTime option:selected").text().substring(0,5); // 출발시간
	       			
					var date = $("#datepickerAir").val();
					var price = $("#airPrice").html().replace("원/1인","");
					var count = $("#airCount option:selected").text().replace("명",""); // 인원
					var item = "비행기 " + count + "인" + " " + time; // 결제할 떄 제품명
	       			var totalAmount = price * count;
					
	       			var type = 'air'; // 종류
	       			
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
	       					itemName: item
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
        
        <!-- 기차 예매 -->
        <div class="modal fade" id="modal-train" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center">기차 예매</h3>
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
                    			<span style="margin-left: 15px;">---></span>
                    			<select style="float: right; width: 150px;" class="form-control form-select"readonly>
                    			<option value="">${trainList.get(0).endsta}</option>
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
                            <input style="width: 250px; margin: auto;" class="btn btn-primary d-block mb-4" type="submit" id="trainPay" value="예매하기">
                       </div>
                    </div>
                </div>
            </div>
            
            
            <script> // 기차
	       	$(document).ready(() => {
	       		$("#trainStartSta").change(function() { // 변했을 때
       					var start = $("#trainStartSta option:selected").text(); // 값 가져오기 -> 출발역
       					var end = '${trainList.get(0).endsta}';
       					
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
   						var end = '${trainList.get(0).endsta}'; // 도착역
	       			
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
	       			var start = $("#trainStartSta option:selected").text(); // 출발역                              
	       			var end = '${trainList.get(0).endsta}'; // 도착역                                              
	       			var time = $("#trainStartTime option:selected").text().substring(0,5); // 도착시간                            
	       			                                                                                               
	       			var date = $("#datepickerTrain").val();                                                        
					var price = $("#trainPrice").html().replace("원/1인","");                                      
					var count = $("#trainCount option:selected").text().replace("명",""); // 인원                  
	       			var totalAmount = price * count;                                                               
					var item = "기차 " + count + "인" + " " + time; // 결제할 떄 제품명                            
	       			                                                                                               
					// 비행기 번호는 db에서 가져오기                                                               
					                                                                                                    
	       			var type = 'train';                                                                                 
	       			                                                                                                    
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
	       					itemName: item                                                                              
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
        
        <!-- 버스 예매 -->
        <div class="modal fade" id="modal-bus" tabindex="-1"> 
            <div class="modal-dialog modal-dialog-centered" role="document" style="margin-left: 800px;">
                <div class="modal-content" style="width: 450px;">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4" style="width:450px;">
                        <h3 class="modal-title mt-4 text-center">버스 예매</h3>
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
                    			<span style="margin-left: 15px;">---></span>
                    			<select style="float: right; width: 150px;" class="form-control form-select"readonly>
                    			<option value="">${busList.get(0).endsta}</option>
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
                            <input style="width: 250px; margin: auto;" class="btn btn-primary d-block mb-4" type="submit" id="busPay" value="예매하기">
                       </div>
                    </div>
                </div>
            </div>
            
            <script> // 버스
	       	$(document).ready(() => {
	       		$("#busStartSta").change(function() { // 변했을 때
       					var start = $("#busStartSta option:selected").text(); // 값 가져오기 -> 출발역
       					var end = '${busList.get(0).endsta}';
       					
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
	       			var start = $("#busStartSta option:selected").text(); // 출발역                             
	       			var end = '${busList.get(0).endsta}'; // 도착역                                             
	       			var time = $("#busStartTime option:selected").text(); // 버스 출발시간                      
	       			                                                                                            
	       			var date = $("#datepickerBus").val();                                                       
					var price = $("#busPrice").html().replace("원/1인","");                                     
					var count = $("#busCount option:selected").text().replace("명",""); // 인원                 
	       			var totalAmount = price * count;                                                            
					var item = "버스 " + count + "인" + " " + time; // 결제할 떄 제품명                         
	       			                                                                                            
					// 비행기 번호는 db에서 가져오기                                                            
					                                                                                            
	       			var type = 'bus';
	       			
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
	       					itemName: item
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
            
            
        <!-- Page header-->
        <section class="container pt-5 mt-5">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="real-estate-home-v1.html">홈페이지</a></li>
                    <li class="breadcrumb-item"><a href="real-estate-catalog-rent.html">캠핑장</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${camp.name}</li>
                </ol>
            </nav>
            <!-- Features + Sharing-->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h2 mb-2">${camp.name}</h1>
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
                    <h4 class="h5 mb-4 pb-4 border-bottom">소형(2~3인) : ${camp.price}원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중형(4~5인) : ${price}원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대형(6~7인) : ${camp.price * 2}원</h4>
                    </h2>
                    <!-- Overview-->
                    <div class="mb-4 pb-md-3 border-bottom">
                        <h3 class="h4">캠핑장 소개</h3>
                        <h5 class="h6 list-unstyled"><b>한줄소개 : </b>${camp.lineintro}</h5>
                        <p class="mb-1">${camp.intro}
                        </p>
                        <div class="collapse" id="seeMoreOverview">
                            <p class="mb-1"></p>
                        </div>
                        <a class="collapse-label collapsed" href="#seeMoreOverview" data-bs-toggle="collapse" data-bs-label-collapsed="더보기" data-bs-label-expanded="줄이기" role="button" aria-expanded="false" aria-controls="seeMoreOverview"></a>
                    </div>
                    <!-- Property Details-->
                    <div class="mb-4 pb-md-3 border-bottom">
                        <h3 class="h4">상세정보</h3>
                        <ul class="list-unstyled mb-0">
                            <li><b>테마 : 
                            </b>
							<c:if test="${!empty camp.theme}">
								${camp.theme}
							</c:if>
							<c:if test="${empty camp.theme}">
								테마가 없습니다.
							</c:if>
							</li>
                            <li><b>주소 : </b>${camp.addr}</li>
                            <li><b>전화번호 : </b>${camp.phone}</li>
                            <li><b>홈페이지 : </b>${camp.homepage}</li>
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
                                <input class="btn btn-lg btn-primary d-block w-100" id="campPay" type="submit" value="예약하기">
                        </div>
                    </div>
                    
                    <script> // 결제
        				$(document).ready(() => {
        					$("#campPay").click(function(){
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
        			<div style="height: 100px;"> <!-- 교통 예매 div --> <!-- 팝업으로 이동 -->
        				<a class="" href="#modal-air" data-bs-toggle="modal" style="border-radius: 50%; width:50px; height: 50px;"><img src="/resources/image/airplane.png" style="border-radius: 50%; width:80px;height: 80px;margin-left: 40px;margin-right: 50px;"></a>
        				<a class="" href="#modal-train" data-bs-toggle="modal" style="border-radius: 50%; width:50px; height: 50px;"><img src="/resources/image/train.png" style="border-radius: 50%; width:80px;height: 80px;margin-right: 50px;"></a>
        				<a class="" href="#modal-bus" data-bs-toggle="modal" style="border-radius: 50%; width:50px; height: 50px;"><img src="/resources/image/school-bus.png" style="width:80px; height: 80px;"></a>
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
        
        <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
	    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js "></script>
	    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
	    <script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
	    <script src="${path}/resources/vendor/jarallax/dist/jarallax.min.js "></script>
	    <script src="${path}/resources/vendor/rellax/rellax.min.js "></script>
		<script src="${path}/resources/js/theme.min.js "></script>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>