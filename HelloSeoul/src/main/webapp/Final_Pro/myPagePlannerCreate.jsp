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
		
	});
	
	// 플래너 생성 로드시
	$('document').ready(function(){
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		
		// 일정에 따른 tab 구현
		$.ajax({
			url: '/web/ajaxMypagePlannerCreate',
			type: 'post',
			data: {no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){												
				// 타이틀 input
				$("div#planTitle").append(`<h3>Title : &nbsp;</h3>
	    				<input class="form-control" id="readOnlyInput" type="text" value="\${result.PLANNER_TITLE}" readonly="" style="height:50px;">`);
				
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
						// tabBar
						$("ul[name='dayTabbar']").append(
								`<li class='nav-item' role='presentaion'>
									<a class='nav-link active' data-bs-toggle='tab' href='#Day\${i}' aria-selected='true' role='tab'>\${show_date}</a>
								</li>`
						);
						// tabContent
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
						$("div.tab-content").append(
								`<div class="tab-pane fade" id="Day\${i}" role="tabpanel">
									<table class='table table-hover'>
										<tbody></tbody>
									</table>
								</div>`						
						);
					}
					// 여행 시작 날짜에서 하루씩 더하기
					start.setDate(start.getDate() + 1); // 더하면서 start가 바뀌기 때문에 i가 아니라 1을 더해야함
				}
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax(일정 탭바, 내용 없는 테이블)
		
		// 찜 리스트 로드
		$.ajax({
			url: '/web/ajaxWishList',
			type: 'post',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				
				$(result).each(function(index, list){					
					$("tbody#tbodyWishList").append(
							`<tr class="table-active">
								<th scope="row"><input type="checkbox" name="select_location" value="\${list['loc_pc']}"></th>
									<td>
										<a href='#' id='local_name'>\${list['loc_name']}</a>
										<br>
										<span style="font-size: 5px">\${list['loc_sg']} > \${list['loc_ctg1']} > \${list['loc_ctg2']} </span>
									</td>
								</tr>`
					);
				}); // $(result).each
				
				loc_pc_click();
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax(사용자 찜 리스트)
		
	}); // $('document').ready
	
	// 찜 리스트에서 장소명 클릭
	function loc_pc_click(){
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
					var mapContainer = document.getElementById('map'),
						mapOption = {
							center: new kakao.maps.LatLng(result.loc_x, result.loc_y),
					        level: 3
					    };
					var map = new kakao.maps.Map(mapContainer, mapOption);
					var markerPosition  = new kakao.maps.LatLng(result.loc_x, result.loc_y); 
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					marker.setMap(map);					
				},
				error: function(){
					alert("error : " + error);
				}
			});
	 		
		}); // $("td > a").click
	} // loc_pc_click()
	
	// 일정에 추가 버튼 클릭 → 선택된 tab의 날짜의 content에 추가
	function updatePlan(){
		var locDataList = [];
		var checkBox = $("input[name='select_location']:checked");
				
		checkBox.each(function(i){
			var checkTr = checkBox.parent().parent().eq(i);
			var checkTd = checkTr.children(); // 장소코드있는 td	
			locDataList.push(checkTd.eq(0).children().val());
		}); // checkBox.each
				
		// 일정 테이블에 정보 추가 // 코드를 리스트로 보내서 in 이용해서 여러개 mapDB를 List 가져옴
		$.ajax({
			url: '/web/ajaxAddPlannerSchedule',
			type: 'post',
			data:{codeList:locDataList},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				console.log(result);
				let activeTab = document.querySelector('ul.nav li a.active'); // object
<<<<<<< HEAD
							
				$(result).each(function(index, list){
					$(activeTab.getAttribute('href') + " table tbody").append(
							`<tr>
								<td style="width: 5%;">
									<input type="checkbox" name="select_location" value="\${list.loc_pc}">
									<input type="hidden" name="select_location_x" value="\${list.loc_x}">
									<input type="hidden" name="select_location_y" value="\${list.loc_y}">
=======
				$(activeTab.getAttribute('href')).append(
						`<table class='table table-hover'>
							<tbody>
							<tr class='table-light'>
								<td style="width: 5%">
									<input type="checkbox" name="select_location" value="?">
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
								</td>
								<td style="display: inline-flex;">
									<div class='timeseting' style="display: inline-flex; width: 20%">
									<input type="text" class="form-control" placeholder="HH" name="planner_shour" id="inputDefault">
									<span> : </span>
									<input type="text" class="form-control" placeholder="mm" name="planner_smin" id="inputDefault">
									</div>
									<div class='loctextline' style='width: 70%; margin-left: 10px;'>
									<a href='#'>Location Name1</a>
									<br>
									<span>Gungu > Loc Ctg > Detail Ctg > </span>
									</div>
								</td>
							</tbody>
						</table>`
				);
				
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
		
		if($("table input[type='checkbox']").is(":checked")){
			$("table input[type='checkbox']").prop('checked',false);
		}
	} // updatePlan()
	
<<<<<<< HEAD
	// 일정 제거
	function deletePlan() {
		var checkBox = $("input[name='select_location']:checked");
				
		checkBox.each(function(i){
			var checkTr = checkBox.parent().parent().eq(i);
			checkTr.remove();
			console.log(i);
		}); // checkBox.each
		
		// url의 no 가져오기
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
				
		if($("table input[type='checkbox']").is(":checked")){
			$("table input[type='checkbox']").prop('checked',false);
		}
	} // deletePlan()
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset : new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage,
        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	    
	    return marker;
	}
	
=======
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link rel="stylesheet" type="text/css" href="/web/resources/hellomypage/css/mypageCreate.css">
<link type="text/css" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
	.div{
		display:flex !important;
	}
</style>
<!-- Style Section End -->


</head>
<body class='body'>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	<section>
		<div class='container_fluid'>
			<!-- 뒤로가기 & 플래너 수정 버튼 -->
			<div class='col-12'>
				<ol class="breadcrumb">
  					<li class="breadcrumb-item"><a href="/web/Final_Pro/myPageCreate.jsp">Date Reset</a></li>
<!--   					수정일 때는 이전페이지로 이동 / 생성일 때는 메인페이지로 이동하게 -->
  					<li class="breadcrumb-item"><a href="javascript:history.back();">Back</a></li>
				</ol>
			</div>
			
			<!-- 플래너 타이틀 -->
			<div class='col-12'>
				<div class='col-6' style="display: inline-flex;" id="planTitle">
<%--     				<span id="readOnlyInput" style="align-items: center">${plannerInfo.title}</span>			 --%>
				</div>
			</div>
			
			<!-- 메인 플래너 내용 -->	
			<div class="main col-12" style="display: inline-flex;">
			
				<!--tab-->
				<div class='tabbar col-5 bg-light'>
					<ul class='nav nav-tabs bg-primary' role='tablist' name="dayTabbar">
					</ul>
					
					<!-- tab contents -->
					<div id='myTabContent border border-info-1' class='tab-content'>
					<!-- <div class='tab-pane fade active show' id='Day0' role='tabpanel'>
							<table class='table table-hover'>
								<tbody>
									<tr class='table-light'>
										<td>
											<a href='#'>Location</a>
											<br>
											<span>Gungu > Loc Ctg > Detail Ctg > </span>
										</td>
									</tr>
									<tr class='table-light'>
										<td>
											<a href='#'>Location</a>
											<br>
											<span>Gungu > Loc Ctg > Detail Ctg > </span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="Day2" role="tabpanel">
							<table class='table table-hover'>
								<tbody>
									<tr class='table-light'>
										<td>
											<a href='#'>Location Name1</a>
											<br>
											<span>Gungu > Loc Ctg > Detail Ctg > </span>
										</td>
									</tr>
									<tr class='table-light'>
										<td>
											<a href='#'>Location Name2</a>
											<br>
											<span>Gungu > Loc Ctg > Detail Ctg > </span>
										</td>
									</tr>
								</tbody>
							</table>
						</div> -->
					</div>	
					<div class='settingbt'>
						<button onclick="deletePlan()">일정 제거</button>
						<button class="create_planner_button" onclick="location.href='MyPageShow.jsp;'">플래너 저장</button>
					</div>			
				</div>
				
				<!-- jjim bar -->
				<div class='jjimbar col-3'>
					<div class='jjimtb'>
						<table class="table table-hover">
							<thead>
	   							<tr>
	    							<th scope="col">Check</th>
	   								<th scope="col">Wish List</th>
	   							</tr>
							</thead>
							<tbody id="tbodyWishList">
	    					</tbody>
						</table>
					</div>
					<div class='jjimbt'>
						<button onclick="updatePlan()">일정에 추가</button>
					</div>
				</div>
				<div class='mapbar col-4'>
					<div class='div_map' id="map"></div>				
					<script>
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
	</section>
</body>
</html>