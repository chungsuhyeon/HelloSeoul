<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		// tab 변경시 checked 해제
		$(".nav >li").click(function(){
			if($("table input[type='checkbox']").is(":checked")){
				$("table input[type='checkbox']").prop('checked',false);
			}
		}); // $(".nav >li").click
		
		
// 		.show.bs.tab : 클릭한 탭이 보이기 전에 실행합니다.
// 		.shown.bs.tab : 클릭한 탭이 보인 후에 실행됩니다. 위와 시간적으로 거의 차이가 없습니다.
// 		.hide.bs.tab : 이전의 탭이 감춰지기 전에 실행됩니다.
// 		.hidden.bs.tab : 이전의 탭이 감춰진 후에 실행됩니다.
		
		// 메뉴가 선택되어 active가 되기 전 이벤트
// 		$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
// 			e.target // 현재 설정된 tab
// 			e.relatedTarget // 이전에 설정된 탭
// 		});
// 		// 메뉴가 선택되어 active가 된 후 이벤트
// 		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
// 			e.target // 현재 설정된 tab
// 			e.relatedTarget // 이전에 설정된 탭
// 		});
// 		// 다른 메뉴가 선택되어 active가 remove 되기 전 이벤트
// 		$('a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
// 			e.target // 현재 설정된 tab
// 			e.relatedTarget // 이전에 설정된 탭
// 		});
// 		// 다른 메뉴가 선택되어 active가 remove 된 후 이벤트
// 		$('a[data-toggle="tab"]').on('hidden.bs.tab', function (e) {
// 			e.target // 현재 설정된 tab
// 			e.relatedTarget // 이전에 설정된 탭
// 		});
		
	}); // function
	
	
	$('document').ready(function(){
// 		console.log($("a").attr(""));
		$.ajax({
			url: '/web/ajaxMypageJjim',
			type: 'post',
			dataType: 'text',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
							
				$("div.tab-content").append(result);

		 		// 장소명 클릭
				$("td > a").click(function(){
			 		var tr = $(this).parent().parent();
			 		var td = tr.children();			 		
			 		var code = td.eq(0).children().val();
			 		
			 		$.ajax({
						url: '/web/ajaxMypageJjimInfo',
						type: 'post',
						data: {loc_code:code},
						dataType: 'json',
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						success: function(result){
							$("div.detailbar").empty();
							$("div.detailbar").append(
									`<table class='table table-hover'>
									<tbody>
										<tr class='table-light'>
											<td><img src="/web/resources/file_img/\${result.loc_img}" width="100%" height="300"></td>
										</tr>
										<tr class='table-light'>
											<td><span> \${result.loc_name}</span>	</td>
										</tr>
										<tr class='table-light'>
											<td><span> \${result.loc_sg} > \${result.loc_ctg1} > \${result.loc_ctg2} </span>	</td>
										</tr>
										<tr class='table-light'>
											<td><span> 주소 : \${result.loc_addr}</span>	</td>
										</tr>
										<tr class='table-light'>
											<td><span> 영업시간 : \${result.loc_op} ~ \${result.loc_cl}</span>	</td>
										</tr>
										<tr class='table-light'>
											<td><span> 전화번호 : \${result.loc_tel}</span>	</td>
										</tr>
										<tr class='table-light'>
											<td><span> 정보 : \${result.loc_info}</span>	</td>
										</tr>
									</tbody>
								</table>`
							);
							
							// 지도 마커 스크립트
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center: new kakao.maps.LatLng(result.loc_x, result.loc_y), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							// 마커가 표시될 위치입니다
							var markerPosition  = new kakao.maps.LatLng(result.loc_x, result.loc_y); 
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							
						},
						error: function(){
							alert("error : " + error);
						}
					}); // inner ajax
			 		
				}); // $("td > a").click

			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}); // $('document').ready
	
	
	function delete_jjim_list(){
		
		var locDataList = [];
		var checkBox = $("input[name='select_location']:checked");
				
		checkBox.each(function(i){
			var checkTr = checkBox.parent().parent().eq(i);
			var checkTd = checkTr.children(); // 장소코드있는 td	
			locDataList.push(checkTd.eq(0).children().val());
		}); // checkBox.each
				
		$.ajax({
			url: '/web/ajaxDeleteJjimList',
			type: 'post',
			data: {deleteJjimList:locDataList},
			dataType: 'text',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				$("div.tab-content").empty();
				$("div.tab-content").append(result);

				$("#food").removeClass("show active");
				let elem = document.querySelector('ul.nav li a.active'); // object
				$($(elem).attr('href')).addClass("show active");
				
			},
			error: function(){
				alert("error : " + error);
			}
		});
	}

</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">

</style>
<!-- Style Section End -->

</head>
<body class='bg-light'>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	<section class='section'>
		<div class='container-fluid'>
			<div class='menu col-12'>
				<!-- 뒤로가기 & 플래너 수정 버튼 -->
				<ol class='breadcrumb'>
					<li class='breadcrumb-item'><a href='/web/myPageLoad'>BACK</a></li>
					<li class='breadcrumb-item'><a href='/web/Final_Pro/myPageCreate.jsp'>PLANNER CREATE</a></li>
				</ol>
			</div>
			<div class='main col-12' style="display: inline-flex;">	
				<div class='tabbar col-4'>
					<!-- tab head -->
					<ul class='nav nav-tabs bg-primary' role='tablist'>
						<li class='nav-item' role='presentaion'>
							<a class='nav-link active' data-bs-toggle='tab' href='#food' aria-selected='true' role='tab'>Food</a>
						</li>
						<li class='nav-item' role='presentaion'>
							<a class='nav-link' data-bs-toggle='tab' href='#shopping' aria-selected='false' role='tab'>Shopping</a>
						</li>					
						<li class='nav-item' role='presentaion'>
							<a class='nav-link' data-bs-toggle='tab' href='#hotspot' aria-selected='false' role='tab'>HotSpot</a>
						</li>					
						<li class='nav-item' role='presentaion'>
							<a class='nav-link' data-bs-toggle='tab' href='#things_to_see' aria-selected='false' role='tab'>Ticket</a>
						</li>					
						<li class='nav-item' role='presentaion'>
							<a class='nav-link' data-bs-toggle='tab' href='#ticket' aria-selected='false' role='tab'>Test</a>
						</li>					
					</ul>
					<!-- tab contents -->
						<div id='myTabContent border border-info-1' class='tab-content'>
						</div>
						
						<div class='setbt'>
							<button class="create_planner_button" onclick="delete_jjim_list()">Wish Delete</button>
						</div>
				</div>
				<!-- 상세정보 -->
				<div class='detailbar col-4'>
				</div>
				
				<!-- 지도 -->
				<div class='mapbar col-4'>
					<div class='div_map' style="width: 100%; height: 100%;" id="map"></div>
				</div>
				
			</div>
		</div>
	</section>
	
	<footer></footer>
</body>
</html>