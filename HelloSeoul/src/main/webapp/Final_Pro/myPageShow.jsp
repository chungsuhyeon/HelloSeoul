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
		// 팝업창 닫기
		$("button#popupClose").click(function(){
			document.getElementById("plannerSharePopUp").style.display = "none";
			document.getElementById('shareNick').replaceChildren();
			document.getElementById('nickTable').replaceChildren();
			$("input#nickname").val("");
		}); // $("#popupClose").click
		
		// 팝업창 닫기
		$("button#deletePopupClose").click(function(){
			document.getElementById("plannerDeletePopUp").style.display = "none";
		}); // $("#popupClose").click
				
		$("button#deletePlannerYes").click(function(){
			const urlParams = new URL(location.href).searchParams;
			const no = urlParams.get('no');
			document.getElementById("plannerDeletePopUp").style.display = "none";
			document.location.href = "/web/mypagePlannerDelete?no=" + no;
		});
		
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
					success: function(re){
						$(re).each(function(idx, list){
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
											<span style="font-size: 12px">\${list["loc_sg"]} > \${list["loc_ctg1"]} > \${list["loc_ctg2"]} </span>
										</td>
									</tr>`
							);							
						}); // $(result).each
					},
					error: function(){
						alert("error : " + error);
					}
				}); // ajax tab-content
				
				if('${user_id}' == result.USER_ID){
					$("ol.breadcrumb").append(
						`<li class='breadcrumb-item'><a href='javascript:openDeletePlannerPopup()'>Planner Delete</a></li>
						<li class='breadcrumb-item'><a href='/web/PlannerShare?planner_no=${param.no}&type=Planner'>Planner Share</a></li>
						<li class='breadcrumb-item'><a href='javascript:openPop()'>Team Share</a></li>`		
					);
				}
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}); // $('document').ready
	
	//팝업 띄우기
	function openPop() {
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		$.ajax({
			url: '/web/ajaxAlreadyShareUser',
			type: 'post',
			data: {no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				$(result).each(function(idx, list){					
					$("div#shareNick").append(
						`<div class='nickbox bg-primary rounded d-flex' id="shareUserNick">
							<div class='w-80 ps-1' style="overflow: hidden; text-overflow: ellipsis; color: white; padding-top: 3px;">
								\${list}
							</div>
							<div class='w-20'>
								<button type="button" onclick="shareUserDelete(this)" class='btn btn-close btn-close-white' name="\${list}" style="padding: 8px 5px;"></button>
							</div>
						</div>`
					);
				}); // $(result).each
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
		document.getElementById("plannerSharePopUp").style.display = "block";
	}
	
	// 닉네임 검색
	function checkNick() {
		var nick = $("input#nickname").val();
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		
		$.ajax({
			url: '/web/ajaxNickCheck',
			type: 'post',
			data: {nick:nick, no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				$("table#nickTable tr").remove();
				$(result).each(function(idx, list){
					$("table#nickTable").append(
						`<tr>
							<td class="nickcheck">\${list}</td>
							<td class="nickcheck" align="right"><button type="button" class="btn btn-dark" onclick="shareUserAdd(this)" name="\${list}" style="padding: 4px 10px;">Add</button></td>
						</tr>`
					);
				}); // $(result).each
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}
	
	// Add 버튼 클릭시 추가했다는 div 생성
	function shareUserAdd(obj) {
		var shareNick = obj.name;
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		$.ajax({
			url: '/web/ajaxShareNickAdd',
			type: 'post',
			data: {shareNick:shareNick, no:no},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				if(result){
					$("div#shareNick").append(
						`<div class='nickbox bg-primary rounded d-flex' id="shareUserNick">
							<div class='w-80 ps-1' style="overflow: hidden; text-overflow: ellipsis; color: white; padding-top: 3px;">
								\${shareNick}
							</div>
							<div class='w-20'>
								<button type="button" onclick="shareUserDelete(this)" class='btn btn-close btn-close-white' name="\${shareNick}" style="padding: 8px 5px;"></button>
							</div>
						</div>`
					);
				} else {
					alert("This user is already sharing");
				}
			},
			error: function(){
				alert("error : " + error);
			}
		}); // ajax
	}
	
	function shareUserDelete(obj){
		var shareNick = obj.name;
		const urlParams = new URL(location.href).searchParams;
		const no = urlParams.get('no');
		$.ajax({
			url: '/web/ajaxShareNickDelete',
			type: 'post',
			data: {shareNick:shareNick, no:no},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result){
				$(obj).parent().parent().remove(); // div 제거
			},
			error: function(request, error){
				alert("error : " + error);
// 				alert("code : " + request.status);
// 				alert("message : " + request.responseText);
			}
		}); // ajax
	}
	
	function openDeletePlannerPopup(){
		document.getElementById("plannerDeletePopUp").style.display = "block";
	}
	
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
	td.nickcheck {
		border-top: 1px solid #DEE2E6;d
    	padding: 10px;
    	height: 10px;
	}

	div#shareNick > div {
		float: left;
		margin-left: 2px;
		width: 20%;
		height: 33px;
	}
	
/* 	div.nickbox > span { */
/* 		visibility: hidden; */
/* 		width: 120px; */
/* 		background-color: black; */
/* 		color: #fff; */
/* 		text-align: center; */
/* 		border-radius: 6px; */
/* 		padding: 5px 0; */
/* 		position: absolute; */
/* 		z-index: 1; */
/* 		bottom: 100%; */
/* 		left: 50%; */
/* 		margin-left: -60px; */
/* 	} */
	
/* 	div.nickbox:hover span { */
/* 		visibility: visible; */
/* 	} */

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
				</ol>
			</div>
			
			<!-- 플래너 타이틀 -->
			<div class='col-12'>
				<div class='col-6' style="display: inline-flex;" id="planTitle"></div>
			</div>
			
			<div class='data col-12' style="display: inline-flex; height: 600px;">
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
		<div class="modal" id="plannerSharePopUp" style="position: fixed; top:0; left: 0; bottom: 0; right: 0; background: rgba(0, 0, 0, 0.7);">
			<div class="modal-dialog" role="document" style="position: absolute; top: calc(50vh - 300px); left: calc(50vw - 200px);">
				<div class="modal-content" style="height:400px; width:400px;">
					<div class="modal-header">
						<h5 class="modal-title">Nickname search to share planner</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="popupClose">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body" style="padding: 10px; width: 100%; height:260px;">
						<span>Nickname</span><br>
						<input type="text" id="nickname" oninput="checkNick()" style="width: 100%">
						
						<div id="shareNick" style="margin-top:5px; height:20%; width:100%; overflow:overlay; white-space:nowrap; display: flex; flex-direction: row;">
						</div>
						
						<div style="width:100%; height:57%; overflow: auto;">
							<table id="nickTable" style="width: 100%; margin-top: 10px; white-space:nowrap;"></table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="popupClose">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 플래너 삭제 팝업창 -->	
		<div class="modal" id="plannerDeletePopUp" style="position: fixed; top:0; left: 0; bottom: 0; right: 0; background: rgba(0, 0, 0, 0.7);">
			<div class="modal-dialog" role="document" style="position: absolute; top: calc(50vh - 300px); left: calc(50vw - 200px);">
				<div class="modal-content" style="height:400px; width:400px;">
					<div class="modal-header">
						<h5 class="modal-title">Delete Planner</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="deletePopupClose">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body" style="padding: 10px; width: 100%; height:50%;">
						<p>If you delete the planner, users who shared it will not be able to see the planner.
							<br>Planners shared with the community will also be deleted.</p>
						<p>Are you sure you want to delete the planner anyway?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="deletePlannerYes">Delete</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="deletePopupClose">Cancel</button>						
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