<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Icon Error Begin-->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Icon Error End-->

<title>Hello, Seoul</title>

<!--JS Section Begin -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68fb4c87ba8765d71119fecd40096446"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("button#popupClose").click(function(){
			document.getElementById("plannerSharePopUp").style.display = "none";
		}); // $("#popupClose").click
	});
	
	// 플래너 생성 로드시
	$('document').ready(function(){
		
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		
		// 일정에 따른 tab 구현
		$.ajax({
			url: '/web/ajaxMypagePlannerTabBar',
			type: 'post',
			data: {no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){												
				// 타이틀 input
				$("div#planTitle").append(`<h3>Title : \${result.PLANNER_TITLE}</h3>`);
				
				// 날짜 tab				
				var start = new Date(result.PLANNER_START);

				for(var i=0; i<result.numDate; i++){
					var year = start.getFullYear().toString();
					var mon = (start.getMonth() + 1).toString();
					var day = start.getDate().toString();
					
					mon = mon.length == 1 ? "0" + mon : mon;
					day = day.length == 1 ? "0" + day : day;
					
					// 최종 날짜 변수
					var show_date = year + "-" + mon + "-" + day;
					
					if(!i){
						$("ul[name='dayTabbar']").append(
								`<li class='nav-item' role='presentaion'>
									<a class='nav-link active' data-bs-toggle='tab' href='#Day\${i}' aria-selected='true' role='tab'>\${show_date}</a>
								</li>`
						);
						$("div.tab-content").append(
								`<div class='tab-pane fade active show' id='Day\${i}' role='tabpanel'>
									<table class='table table-hover'>
										<tbody></tbody>
									</table>
								</div>`						
						);
					} else {
						$("ul[name='dayTabbar']").append(
								`<li class='nav-item' role='presentaion'>
									<a class='nav-link' data-bs-toggle='tab' href='#Day\${i}' aria-selected='false' role='tab'>\${show_date}</a>
								</li>`
						);
					}
					$("div.tab-content").append(
							`<div class="tab-pane fade" id="Day\${i}" role="tabpanel">
								<table class='table table-hover'>
									<tbody></tbody>
								</table>
							</div>`						
					);
					start.setDate(start.getDate() + 1);
				} // 날짜 tab for문 끝
				
				$.ajax({
					url: '/web/ajaxMypagePlannerTabContent',
					type: 'post',
					data: {no:no},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function(result){
						$(result).each(function(idx, list){
							list['planner_shour'] = list['planner_shour'].length == 1 ? "0" + list['planner_shour'] : list['planner_shour']
							list['planner_smin'] = list['planner_smin'].length == 1 ? "0" + list['planner_smin'] : list['planner_smin']
							
							$("div#" + list['planner_date'] + " table tbody").append(
									`<tr class='table-light'>
										<td>
											<span> \${list["planner_shour"]} : \${list["planner_smin"]} </span>
										</td>
										<td>
											<span>\${list["loc_name"]}</span>
											<br>
											<span style="font-size: 5px">\${list["loc_sg"]} > \${list["loc_ctg1"]} > \${list["loc_ctg2"]} </span>
										</td>
									</tr>`
							);							
						}); // $(result).each
					},
					error: function(){
						alert("error : " + error);
					}
				}); // ajax tab-content
				
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}); // $('document').ready
	
	//팝업 띄우기
	function openPop() {
		document.getElementById("plannerSharePopUp").style.display = "block";
	}
	
	// 닉네임 검색
	function checkNick() {
		var nick = $("input#nickname").val();
		$.ajax({
			url: '/web/ajaxNickCheck',
			type: 'post',
			data: {nick:nick},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				console.log(result);
				$(result).each(function(idx, list){
					list['planner_shour'] = list['planner_shour'].length == 1 ? "0" + list['planner_shour'] : list['planner_shour']
					list['planner_smin'] = list['planner_smin'].length == 1 ? "0" + list['planner_smin'] : list['planner_smin']
					
					$("div#" + list['planner_date'] + " table tbody").append(
							`<tr class='table-light'>
								<td>
									<span> \${list["planner_shour"]} : \${list["planner_smin"]} </span>
								</td>
								<td>
									<span>\${list["loc_name"]}</span>
									<br>
									<span style="font-size: 5px">\${list["loc_sg"]} > \${list["loc_ctg1"]} > \${list["loc_ctg2"]} </span>
								</td>
							</tr>`
					);							
				}); // $(result).each
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}
	
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">

</style>
<!-- Style Section End -->

</head>
<body>
	<header>
	<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section>
		<div class='container'>
			<!-- tab -->
			<div class='menu col-12'>
				<ol class='breadcrumb'>
					<li class='breadcrumb-item'><a href='/web/myPageLoad'>Mypage</a></li>
					<li class='breadcrumb-item'><a href="/web/Final_Pro/myPagePlannerModify.jsp?planner_no=${param.no}">Planner Modify</a></li>
					<li class='breadcrumb-item'><a href='/web/mypagePlannerDelete?no=${param.no}'>Planner Delete</a></li>
					<li class='breadcrumb-item'><a href='/web/PlannerShare?plno=${param.no}&type=Planner'>Planner Share</a></li>
<!-- 					<li class='breadcrumb-item'><a href='#plannerSharePopUp'>Team Share</a></li> -->
					<li class='breadcrumb-item'><a href='javascript:openPop()'>Team Share</a></li>
				</ol>
			</div>
			
			<!-- 플래너 타이틀 -->
			<div class='col-12'>
				<div class='col-6' style="display: inline-flex;" id="planTitle"></div>
			</div>
			
			<div class='data col-12' style="display: inline-flex;">
				<!-- tab head -->
				<div class='tabbar col-6'>
					<ul class='nav nav-tabs bg-primary' role='tablist' name="dayTabbar">
					</ul>
					
					<!-- tab contents -->
					<div id='myTabContent border border-info-1' class='tab-content'>
					</div>
				</div>
				
				<div class='mapbar col-6'>
				<!-- map -->
				<div id="map" style="width: 100%; height: 100%; float: right;"></div>
					<script>
						var markers = [];
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    		mapOption = { 
			        	center: new kakao.maps.LatLng(37.4946287, 127.0276197), // 지도의 중심좌표
			        	level: 3 // 지도의 확대 레벨
			    		};
			
						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new kakao.maps.Map(mapContainer, mapOption); 
					</script>	
				</div>
				
			</div>
		</div>		
		
		<!-- 팝업창 -->	
		<div class="modal" id="plannerSharePopUp" style="position: fixed; top:0; left: 0; bottom: 0; right: 0; background: rgba(0, 0, 0, 0.5);">
			<div class="modal-dialog" role="document" style="position: absolute; top: calc(50vh - 300px); left: calc(50vw - 200px);">
				<div class="modal-content" style="height:350px; width:400px;">
					<div class="modal-header">
						<h5 class="modal-title">Nickname search to share planner</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="popupClose">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<span>Nickname</span><br>
						<input type="text" id="nickname" oninput="checkNick()">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="popupClose">Close</button>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<footer>
		<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>