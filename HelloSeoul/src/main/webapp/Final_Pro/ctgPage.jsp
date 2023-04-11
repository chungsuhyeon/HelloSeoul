<%@ page language="java" contentType="text/html; charset=UTF-8"    
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Icon Error Begin-->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Icon Error End-->
<title>Insert title here</title>
<!--JS Section Begin -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68fb4c87ba8765d71119fecd40096446"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	//scroll refresh
	$('.ctglist').scroll(function(){
		//scrollevent
	});
	
	//list info + map ajax
	$('td#locname').click(function(){
		var sel = $(this).text();
		console.log(sel);
		ajaxpro(sel);
 		
	});
	
	$('#foodctg').click(function(){
		if($('#foodctg').val()=='food'){
			$('#detailctg option').remove();
			$('#detailctg').append(`
					<option value="all">전체</option>
					<option value="korean">한식</option>
					<option value="chinese">중식</option>
					<option value="weston">양식</option>
					<option value="japanese">일식</option>									
					<option value="etc">기타</option>					
					`);
		}
		else if($('#foodctg').val()=='tour'){
			$('#detailctg option').remove();
			$('#detailctg').append(`
					<option value="all">전체</option>
					<option value="landmark">랜드마크</option>
					<option value="nature">자연</option>
					<option value="history">역사</option>
					<option value="etc">기타</option>					
					`);
		}
		else if($('#foodctg').val()=='shopping'){
			$('#detailctg option').remove();
			$('#detailctg').append(`
					<option value="traditionalMarket">전통시장</option>
					<option value="departmentstore">백화점</option>
					<option value="goodsstore">기념품</option>
					<option value="etc">기타</option>					
					`);
		}
		else{
			$('#detailctg option').remove();
			$('#detailctg').append(`
					<option value="nodata">Choose</option>				
					`);
		}
		
		
	});	
	
	//search
	$('.searchbt').click(function(){
		if($('#locsg').val()=='choose'||$('#detailctg').val()==null||$('#query').val().length==0){
	 		alert('Select Please');
	 		return false;
	 		}
		else{
	 			$.ajax({
	 				type:'post',
	 				url:'/web/searchList',
	 				data : {'loc_sg':$('#locsg').val(),
	 						'detailctg':$('#detailctg').val(),
	 						'query':$('#query').val()},
	 				dataType:'json',
	 				success : function(r){
	 					if(r[0]==null){
	 						alert('No Search Data');
	 					}
	 					else{
		 					$("#tablebd > tr").remove();
		 					for(var x in r){
			 					$("#tablebd").append(`
			 							\${x}
										<tr class='table-light'>
											<td><input type="checkbox" id='jjim' value="\${r[x].loc_pc}"></td>
											<td id="locname">\${r[x].loc_name}</td>
										</tr>
										`);
		 					}
		 					$('td#locname').click(function(){
		 						var sel = $(this).text();
		 						console.log(sel);
		 						ajaxpro(sel);
		 				 		
		 					});
	 					}

	 				},
	 				error : function(x){
	 					alert("error!!");	
	 				}
	 			});
	 		}
	});
	
	
	//list jjim submit!
	$('#jjimsubmit').click(function(){
		if($('#userid').val()=="nodata"){
			alert("Login Plz");
			return false;
		}
		var jjimpoint = new Array();
		var cnt = 0;
		$("input[id='jjim']").each(function(){
			if($(this).prop("checked")){
				jjimpoint[cnt] = ($(this).val());
				cnt += 1;
				
			}
			if(cnt==0){
				alert("please select");
				return false;
			}
		});
		ajaxpro2(jjimpoint);
	});
});//functionload
function ajaxpro(sel){
	$.ajax({
		type:'post',
		url:'/web/showLocInfo',
		dataType:'json',
		success : function(r){
 				for(var x=0; x<r.length;x++){
 					if(r[x].loc_name==sel){
 						var loc = r[x];
 						console.log(loc);
 						}
 					}
 				//마커가 표시될 위치입니다
 				var markerPosition  = new kakao.maps.LatLng(loc.loc_x,loc.loc_y); 
				//마커를 생성합니다
				var marker = new kakao.maps.Marker({position: markerPosition});
				//마커가 지도 위에 표시되도록 설정합니다
				map.setCenter(markerPosition);
				marker.setMap(map);
				//아래 코드는 지도 위의 마커를 제거하는 코드입니다
				//marker.setMap(null);
				$('.infobar > .table').remove();
				$('.infobar').html(
								`<table class='table'>
									<tbody>
										<tr>
											<td rowspan="6" style="width: 200px;">
											<img src='\${loc.loc_img}'style='width: 100%; height: 100%;'>
											</td>
											<td class='table-light' style="width: 20%;">장소 이름</td>
											<td>\${loc.loc_name}</td>
										</tr>
										<tr>
											<td class='table-light'>카테고리</td>
											<td>\${loc.loc_ctg2}</td>
										</tr>
										<tr>
											<td class='table-light'>주소</td>
											<td>\${loc.loc_addr}</td>
										</tr>
										<tr>
											<td class='table-light'>영업시간</td>
											<td>\${loc.loc_time}</td>
										</tr>
										<tr>
											<td class='table-light'>전화번호</td>
											<td>\${loc.loc_tel}</td>
										</tr>
										<tr>
											<td class='table-light'>기타</td>
											<td>\${loc.loc_name}</td>
										</tr>
										<tr class='table-primary'>
											<td colspan="3" style="text-align: center;">장소정보</td>
										</tr>
										<tr>
											<td colspan="3" style="height: 350px">\${loc.loc_info}</td>
										</tr>
									</tbody>
								</table>`	
						);	
		},
		error : function(x){
			console.log(x);
		}
	});
	
}
function ajaxpro2(jjimpoint){
	$.ajax({
		type:'post',
		url:'/web/insertJjim',
		dataType:'text',
		data: {'jjimpoint':jjimpoint},
		success : function(r){
			alert("success");
		},
		error : function(x){
			
		}
	});
	
}
</script>
<!--JS Section End -->
<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.ctglist td:nth-child(1){
	padding-left: 10% !important;
}
.infobar tr td{
	/* border : solid; */
}
.infobar{
	padding-left: 10px;
}

.info{
	width: 20%;
}

.infobar img{
	object-fot:cover;
 	width: 100%;
 	height: 100%;
	}
</style>
<!-- Style Section End -->
</head>
<body>
<header>
<jsp:include page="./header.jsp"></jsp:include>
</header>
<section class='container'>
	<input type="hidden" id="userid" value="${(user_id eq null)?'nodata':user_id}"/>
	<div class='row'>
		<div class='col-3'>
			<div class='searchbar1 col-12 d-inline-flex'>
				<select class='form-select' id='locsg'>
					<option value="choose">지역</option>
					<c:forEach var='sg' items="${locsg}" varStatus="cnt">
					<option value="${sg.kr_gu}">${sg.kr_gu}</option>
					</c:forEach>
				</select>
				<select class='form-select' id='foodctg'>
					<option value="nodata">-----</option>
					<option value="food">음식</option>
					<option value="tour">명소</option>
					<option value="shopping">쇼핑</option>
				</select>
				<select class='form-select' id='detailctg'>
					<!-- Ajax Line -->
				</select>
			</div>
			<div class='searchbar2 col-12 d-inline-flex'>
				<input type="text" class="form-control" placeholder="장소 이름" id="query">
				<button type="button" class="searchbt btn btn-primary">검색</button>			
			</div>
			<div class='ctglist overflow-scroll' style="height: 600px;">
				<table class='table table-hover'>
					<thead>
						<tr class='table-primary'>
							<th class='text-center'>찜</th>
							<th class='text-center'>장소 이름</th>
						</tr>
					</thead>
					<tbody id="tablebd">
					<!-- table body ajax -->
						<c:forEach var="loc" items="${maindb}" varStatus="cnt">
							<tr class='table-light'>
								<td><input type="checkbox" id='jjim' value="${loc.LOC_PC}"></td>
								<td id="locname">${loc.LOC_NAME}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class='jjimsubmit'>
			<button class="btn btn-lg btn-primary" type="button" style="width: 100%" id="jjimsubmit">찜 하기</button>
			</div>
		</div>
		<div class="infobar col-5" >
			<table class='table' style="height: 100%;">
				<tbody>
					<tr>
						<td rowspan="6" style="width: 200px;">장소사진</td>
						<td class='table-light' style="width: 20%;">장소명</td>
						<td></td>
					</tr>
					<tr>
						<td class='info table-light'>세부 카테고리</td>
						<td></td>
					</tr>
					<tr>
						<td class='info table-light'>장소주소</td>
						<td></td>
					</tr>
					<tr>
						<td class='info table-light'>영업시간</td>
						<td></td>
					</tr>
					<tr>
						<td class='info table-light'>전화번호</td>
						<td></td>
					</tr>
					<tr>
						<td class='info table-light'>기타</td>
						<td></td>
					</tr>
					<tr class='table-primary'>
						<td colspan="3" style="text-align: center;">장소정보</td>
					</tr>
					<tr>
						<td colspan="3" style="height: 400px;"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-4">
			<div class='div_map' style="width: 100%; height: 100%;" id="map"></div>	
			<script type="text/javascript">
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
    					center: new kakao.maps.LatLng(37.555946, 126.97231716), // 지도의 중심좌표
    					level: 3 // 지도의 확대 레벨
						};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 			</script>
		</div>
	</div>
</section>
<footer>
<jsp:include page="./footer.jsp"></jsp:include>
</footer>
</body>
</html>