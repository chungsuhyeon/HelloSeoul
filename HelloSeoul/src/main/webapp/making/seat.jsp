<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Icon Error Begin-->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Icon Error End-->

<title>Hello, Seoul!</title>

<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css'
	href='/web/resources/ticketDetail/New/Css/Dsub.css?v=20210628'>

<script type="text/javascript">
	$(function() {
		var val4=[];
		$("a#tiketing").click(function(){
			
			console.log($(".useseat.btn.btn-primary").val());
			console.log(val4);
		});
		var val3=0;
		var val5=0;
		var val3=0;
		$(".seat >button").click(function() {
			var action=((parseInt($("button#seatVal2").html()))+(parseInt($("button#seatVal1").html())));
			console.log(action);
			console.log($(this).val());
			val4[val5]=$(this).val();
			val5++
			console.log(val4);
			
// 			val4=$(this).val();
			if($(this).attr('class')=='emptyeseat btn btn-outline-primary'){
				if(val3<action){
					++val3
					$(this).attr('class','useseat btn btn-primary');
				}else if(val3==action){
					console.log("cant");
					val3=action
					alert("좌석을 다 고르셨습니다.");
				}
			}else if($(this).attr('class')=='useseat btn btn-primary'){
				
				--val3
				$(this).attr('class','emptyeseat btn btn-outline-primary');	
				
			}

		});
		var val1=0;
		var val2=0;
		$("button#minusButton1").click(function(){
			if($("button#seatVal1").html()<0){
				$("button#seatVal1").html(0);
			}else if($("button#seatVal1").html()>0){
				$("button#seatVal1").html(--val1);
			}
		});
		$("button#plusButton1").click(function(){
			if(((parseInt($("button#seatVal2").html()))+(parseInt($("button#seatVal1").html())))==8){
				$("button#seatVal1").html($("button#seatVal1").html());
			}else if($("button#seatVal1").html()<8){
				$("button#seatVal1").html(++val1);
			}else if($("button#seatVal1").html()==8){
				$("button#seatVal1").html(8);
			}
		});
		
		
		$("button#minusButton2").click(function(){
			if($("button#seatVal2").html()<0){
				$("button#seatVal2").html(0);
			}else if($("button#seatVal2").html()>0){
				$("button#seatVal2").html(--val2);
			}
		});
		$("button#plusButton2").click(function(){
			if(((parseInt($("button#seatVal2").html()))+(parseInt($("button#seatVal1").html())))==8){
				$("button#seatVal2").html($("button#seatVal2").html());
			}else if($("button#seatVal2").html()<8){
				$("button#seatVal2").html(++val2);
			}else if($("button#seatVal2").html()==8){
				$("button#seatVal2").html(8);
				
			}
		});
	

	});
</script>


<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet"
	href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.screen {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}
</style>
<!-- Style Section End -->

<jsp:include page="../Final_Pro/header.jsp"></jsp:include>

</head>
<body>

	<section class='section'>
	
		<div class='container-fluid'
			style="left-margin: 30%; display: flex; border: solid;">
			<div class='col-1'></div>
			<!-- 좌석표 -->
			<div class='seatbar col-4'
				style="left-margin: 30%; align-items: center;">
				<div class='seat col-12' style="margin-top:15px; display:flex;">
<!-- 				---------------성인,청소년 인원수----------------- -->
				<div  class="col-5" style="display:flex;margin-left: 15%">성인 &nbsp;&nbsp;
					<button type="button" id="minusButton1" title="성인 좌석 선택 감소">-</button>
				<div >
					<button type="button" id="seatVal1" title="성인 현재 좌석 선택 수" value="1">0</button>
				</div>
					<button type="button" id="plusButton1" title="성인 좌석 선택 증가">+</button>
			    </div>
							
				<div class="col-4" style=" display:flex;">청소년&nbsp;
					<button type="button" id="minusButton2" title="청소년 좌석 선택 감소">-</button>
				<div >
					<button type="button" id="seatVal2" title="청소년 현재 좌석 선택 수" value="1">0</button>
				</div>
					<button type="button" id="plusButton2" title="청소년 좌석 선택 증가">+</button>
				</div>
			</div>
<!-- 							-----------------스크린,좌석 ---------------- -->
			
				<div class='bg-primary'
					style="margin-top: 15px; margin-bottom: 15px; width: 60%; height: 30px; margin-left: 20%; font-weight: bold; text-align: center; color: white;">screen</div>

				<div style="margin-bottom: 15px;">
					<c:forEach var='i' items="A,B,C,D,E,F,G,H,I">
						<div class='seat col-12' style="display: inline-flex;">
							<h3 style=" width: 5%;" >${i}</h3>
							<div class="seat"style="width: 90%; display:flex;">
							<c:forEach var='x' begin="0" end="9">
							<button type="button"
											class="emptyeseat btn btn-outline-primary"
											style="margin: 1px;display: inline-flex; width: 100%; height:45px; " value="${i}${x}">${i}&nbsp;${x}</button>

							</c:forEach>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div class='col-1' style="border-right: solid 1px;"></div>
<!-- 			--------------------------------------상영하는 컨텐츠의 이미지가 나오는 곳---------------------------------------------------------- -->
			<div class='col-2'><span><img src="${bookinginfo.imgsrc}" alt="영화 포스터" style="margin-top:20%;display: inline; width: 100%;height: 80%; "></span></div>
<!-- 		------------------------------------상영하는 컨텐츠의 정보------------------------------------------ -->
			<div class='col-2' >
			<div >
			<div class='seatbar col-12' style=" height: 100%; margin-top:20%; margin-left:5%; font-size: 25px" >
			
				<div  style="display: block;">
					<span >제목:${bookinginfo.title}</span>
				</div>
				
				<div  style="display: block;">
					<span  title="12세 관람가">관람등급:${bookinginfo.grade}</span>
				</div>
				<div  style="display: block;">
					<span  title="12세 관람가">상영시간:${bookinginfo.runtime}</span>
				</div>
			
				<div  style="display: block;">
					<span >장소:</span>
					<span><a target="_blank" style="width:100%;">${bookinginfo.loc_name}</a></span>
				</div>
				<div style="display: block;">
					<span >일시:</span>
					<span  title="2023.3.20(월) 20:25">2023.3.20(월) 20:25</span>
				</div>
				<div  style="display: block;">
					<span >상영관:</span>
					<span title="2관 [LCK관]">2관 [LCK관]</span>
					
				</div>
				<div  style="display: block;">
					<span >인원</span>
					<span  title=""></span>
				</div>
			<div class="rn-05">
									<a href='#' id="tiketing" class='rn-bb03'>예매하기</a>
								</div>
				<div  title="극장선택" style="display: none;"></div>
				<div class="rn-05">
					<a href='/web/booking?no=${ticketinfo.no}' onclick='jsf_pdi_GoPerfSale();' class='rn-bb03'>예매하기</a>
				</div>
			</div>
			
			
		
			
		</div>
			</div>
			<div class='col-2' ></div>
		</div>
		<!-- 테이블 시작 및 결제 관련 -->

	</section>

	<footer> </footer>
</body>
</html>