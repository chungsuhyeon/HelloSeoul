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
		const no = urlParams.get('planner_no');
		
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

				$.ajax({
					url: '/web/ajaxMypagePlannerTabContent',
					type: 'post',
					data: {no:no},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function(result){
						console.log(result);
						$(result).each(function(idx, list){
							list['planner_shour'] = list['planner_shour'].length == 1 ? "0" + list['planner_shour'] : list['planner_shour']
							list['planner_smin'] = list['planner_smin'].length == 1 ? "0" + list['planner_smin'] : list['planner_smin']
														
							$("div#" + list['planner_date'] + " table tbody").append(
									`<tr class='table-light' name="old">
										<td style="width: 5%;">
											<input type="checkbox" name="planner_select_location" value="\${list["loc_pc"]}">
										</td>
										<td>
											<form method="POST" action="/web/mainPlannerData" name="mypageMainPlannerFrm" style="width:100%; display: inline-flex;">
												<div class='timeseting' style="display: inline-flex; width: 40%">
													<input type="number" class="form-control" placeholder="HH" name="planner_shour" value="\${list["planner_shour"]}" id="planner_shour" min='0' max='23' required>
													<span>&nbsp; : &nbsp;</span>
													<input type="number" class="form-control" placeholder="mm" name="planner_smin" value="\${list["planner_smin"]}" id="planner_smin" min='0' max='59' required>
												</div>
												<div class='loctextline' style='width: 100%; margin-left: 20px;'>
													<span>\${list["loc_name"]}</span>
													<input type="hidden" name='planner_no' value="\${no}">
													<input type="hidden" name='loc_name' value="\${list["loc_name"]}">
													<br>
													<span style="font-size: 5px">\${list["loc_sg"]} > \${list["loc_ctg1"]} > \${list["loc_ctg2"]} </span>
													<input type="hidden" name="loc_pc" value="\${list["loc_pc"]}">
													<input type="hidden" name='loc_sg' value="\${list["loc_sg"]}">
													<input type="hidden" name='loc_ctg1' value="\${list["loc_ctg1"]}">
													<input type="hidden" name='loc_ctg2' value="\${list["loc_ctg2"]}">
													<input type="hidden" name="loc_x" value="\${list["loc_x"]}">
													<input type="hidden" name="loc_y" value="\${list["loc_y"]}">
													<input type="hidden" name="planner_date" value="\${list["planner_date"]}">
												</div>
											</form>
										</td>
									</tr>`								
							);							
						}); // $(result).each
					},
					error: function(){
						alert("error : " + error);
					}
				}); // ajax taa-content
					
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
										<a href='#' id='local_name' name='loc_name'>\${list['loc_name']}</a>
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

		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('planner_no');
		
		// 일정 테이블에 정보 추가 // 코드를 리스트로 보내서 in 이용해서 여러개 mapDB를 List 가져옴
		$.ajax({
			url: '/web/ajaxAddPlannerSchedule',
			type: 'post',
			data:{codeList:locDataList},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				let activeTab = document.querySelector('ul.nav li a.active'); // object
				let day_info = $(activeTab).attr('href');
				
				$(result).each(function(index, list){
					$(day_info + " table tbody").append(
							`<tr>
								<td style="width: 5%;">
									<input type="checkbox" name="planner_select_location" value="\${list.loc_pc}">
								</td>
								<td>
									<form method="POST" action="/web/mainPlannerData" name="mypageMainPlannerFrm" style="width:100%; display: inline-flex;">
										<div class='timeseting' style="display: inline-flex; width: 40%">
											<input type="number" class="form-control" placeholder="HH" name="planner_shour" id="planner_shour" min='0' max='23' required>
											<span>&nbsp; : &nbsp;</span>
											<input type="number" class="form-control" placeholder="mm" name="planner_smin" id="planner_smin" min='0' max='59' required>
										</div>
										<div class='loctextline' style='width: 100%; margin-left: 20px;'>
											<span>\${list.loc_name}</span>
											<input type="hidden" name='planner_no' value="\${no}">
											<input type="hidden" name='loc_name' value="\${list.loc_name}">
											<br>
											<span style="font-size: 5px">\${list.loc_sg} > \${list.loc_ctg1} > \${list.loc_ctg2} </span>
											<input type="hidden" name="loc_pc" value="\${list.loc_pc}">
											<input type="hidden" name='loc_sg' value="\${list.loc_sg}">
											<input type="hidden" name='loc_ctg1' value="\${list.loc_ctg1}">
											<input type="hidden" name='loc_ctg2' value="\${list.loc_ctg2}">
											<input type="hidden" name="loc_x" value="\${list.loc_x}">
											<input type="hidden" name="loc_y" value="\${list.loc_y}">
											<input type="hidden" name="planner_date" value="\${day_info.substring(1)}">
										</div>
									</form>
								</td>
							</tr>`
					);
				}); // for문	
				
				$("input#planner_shour").blur(function(){
					if($(this).val() < 0 || $(this).val() >= 24){
						alert("Please write in 24 hour increments"); // 24시간 단위로 작성해주세요.
						$(this).val("");
						$(this).focus();
						return false;
					}
				});
				
				$("input#planner_smin").blur(function(){
					if($(this).val() < 0 || $(this).val() >= 60){
						alert("Please write in 60 minute increments."); // 60분 단위로 작성해주세요.
						$(this).val("");
						$(this).focus();						
						return false;
					}
				});
				
				// 지도에 순서대로 마커 뿌리기 (보류)
				
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
		
		if($("table input[name='select_location']").is(":checked")){
			$("table input[name='select_location']").prop('checked',false);
		}
	} // updatePlan()
	
	// 일정 제거
	function deletePlan() {
		var checkBox = $("input[name='planner_select_location']:checked");
		checkBox.each(function(i, iVal){
			let removeTr = iVal.parentElement.parentElement;
			$(removeTr).remove();
		}); // checkBox.each
						
		if($("table input[name='planner_select_location']").is(":checked")){
			$("table input[name='planner_select_location']").prop('checked',false);
		}
	} // deletePlan()
	
	// 생성한 플래너 저장
	function storePlanner(){
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('planner_no');
		
		const inputTimeMin = document.getElementsByClassName("form-control");
		// 모든 input 태그에 대해 반복하며 제약조건을 확인합니다
		for (let i = 0; i < inputTimeMin.length; i++) {
			if (!inputTimeMin[i].checkValidity()) {
				alert("Please enter the schedule time");
				return false;
			}
		}
		$.ajax({
			type:"POST",
			url:"/web/deletePlannerSchedule",
			data: {no:no},
			dataType: 'text',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			async:false,
			success: function(result){
			},
			error: function(xhr, status, error) {
				console.log("error : " + error);
		    }
		}); // ajax
		
		var forms = document.getElementsByName("mypageMainPlannerFrm");
		
		$(forms).each(function(idx, form){
			var formData = $(form).serialize();
			
			$.ajax({
				type:"POST",
				url:form.action,
				data: formData,
				dataType: 'text',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				async:false,
				success: function(result){
				},
				error: function(xhr, status, error) {
					console.log("error : " + error);
			    }
			}); // ajax
		}); // $(forms).each
		
		// show 페이지로 이동
		document.location.href = "/web/Final_Pro/myPageShow.jsp?no=" + no;
		
	} // storePlanner()
	
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
	
  	input.form-control{
  		height: 50px !important;
/*   		width: 100px !important; */
  	}
 	
/* 	tr.table-light { */
/* 		height: 50px !important; */
/* 	} */
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
				<div class='col-6' style="display: inline-flex;" id="planTitle"></div>
			</div>
			
			<!-- 메인 플래너 내용 -->	
			<div class="main col-12" style="display: inline-flex;">
			
				<!--tab-->
				<div class='tabbar col-5 bg-light'>
					<ul class='nav nav-tabs bg-primary' role='tablist' name="dayTabbar">
					</ul>
					
						<!-- tab contents -->
						
						<div id='myTabContent border border-info-1' class='tab-content'>
						</div>	
						
						<div class='settingbt'>
							<button onclick="deletePlan()">일정 제거</button>
							<button onclick="storePlanner()">플래너 저장</button>
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
	</section>
	
	<footer>
		<jsp:include page="./footer.jsp"></jsp:include>
	</footer>	
</body>
</html>