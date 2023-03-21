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
	
	$('document').ready(function(){
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		
		$.ajax({
			url: '/web/ajaxMypagePlannerCreate',
			type: 'post',
			data: {no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				console.log(result);
				
				
				var start = new Date(result.PLANNER_START);
				console.log(start);
								
				$("div#planTitle").append(`<h3>Title : &nbsp;</h3>
	    				<input class="form-control" id="readOnlyInput" type="text" value="\${result.PLANNER_TITLE}" readonly="" style="height:50px;">`);
				
				for(var i=0; i<result.numDate; i++){
					console.log(i);
					console.log(start.setDate(start.getDate() + i));
				}
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
		
	}); // $('document').ready
	
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
	width: 1000px !important;
}
</style>
<!-- Style Section End -->


</head>
<body class='body'>
	<header>
		<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
	</header>
	<section>
	${plannerInfo}
		<div class='container_fluid'>
			<!-- 뒤로가기 & 플래너 수정 버튼 -->
			<div class='col-12'>
				<ol class="breadcrumb">
  					<li class="breadcrumb-item"><a href="/web/Final_Pro/myPageCreate.jsp">Date Reset</a></li>
<!--   					수정일 때는 이전페이지로 이동 / 생성일 때는 메인페이지로 이동하게 -->
  					<li class="breadcrumb-item"><a href="javascript:history.back();">Back</a></li>
				</ol>
			</div>
			<div class='col-12'>
				<div class='col-6' style="display: inline-flex;" id="planTitle">
<%--     				<span id="readOnlyInput" style="align-items: center">${plannerInfo.title}</span>			 --%>
				</div>
			</div>
			
			<!-- 메인 플래너 내용 -->	
			<div class="main col-12" style="display: inline-flex;">
				<!--tab-->
				<div class='tabbar col-3'>
					<ul class='nav nav-tabs bg-primary' role='tablist'>
						<li class='nav-item' role='presentaion'>
							<a class='nav-link active' data-bs-toggle='tab' href='#Day1' aria-selected='true' role='tab'>Day1</a>
						</li>
						<li class='nav-item' role='presentaion'>
							<a class='nav-link' data-bs-toggle='tab' href='#Day2' aria-selected='false' role='tab'>Day2</a>
						</li>					
					</ul>
					<!-- tab contents -->
					<div id='myTabContent border border-info-1' class='tab-content'>
						<div class='tab-pane fade active show' id='Day1' role='tabpanel'>
							<table class='table table-hover'>
								<tbody>
									<tr class='table-light'>
										<td style="width: 5%">
											<input type="checkbox" name="select_location" value="?">
										</td>
										<td style="display: inline-flex;">
											<div class='timeseting' style="display: inline-flex; width: 20%">
											<input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault">
											<span> : </span>
											<input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault">
											</div>
											<div class='loctextline' style='width: 70%; margin-left: 10px;'>
											<a href='#'>Location Name1</a>
											<br>
											<span>Gungu > Loc Ctg > Detail Ctg > </span>
											</div>
										</td>
<!-- 										<td style="display: inline-flex;"> -->
<!-- 											<div> -->
<!-- 											<input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault"> -->
<!-- 											<span> : </span> -->
<!-- 											<input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault"> -->
<!-- 											</div> -->
<!-- 										</td> -->
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
						</div>
						<div class="tab-pane fade" id="Day2" role="tabpanel">
							<p>contents</p>
						</div>
					</div>	
					<div class='settingbt'>
						<button onclick="location.href='MyPagedreate.jsp;'">일정 제거</button>
						<button class="create_planner_button" onclick="location.href='MyPageShow.jsp;'">플래너 저장</button>
					</div>			
				</div>
				<!-- jjim bar -->
				<div class='jjimbar col-3'>
					<div class='jjimtb'>
					<table class="table table-hover">
						<thead>
   							<tr>
    							<th scope="col">Type</th>
   								<th scope="col">Column heading</th>
   							</tr>
						</thead>
						<tbody>
   							<tr class="table-active" style="height: 10px;">
   								<th scope="row"><input type="checkbox" name="select_location" value="장소코드1"></th>
      							<td>
      								<a href="#">1번 찜 장소</a>
									<br>
									<span style="font-size: 5px">지역 구 > 장소 카테고리 > 세부 카테고리 > </span>
								</td>
    						</tr>
    						<tr class="table-active">
    							<th scope="row"><input type="checkbox" name="select_location" value="장소코드2"></th>
									<td>										<a href="#">2번 찜 장소</a>
									<br>	
									<span style="font-size: 5px">지역 구 > 장소 카테고리 > 세부 카테고리 > </span>
								</td>
    						</tr>
    					</tbody>
					</table>
					</div>
					<div class='jjimbt'>
						<button onclick="">일정에 추가</button>
					</div>
				</div>
				<div class='mapbar col-6'>
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
		</div>
	</section>
</body>
</html>