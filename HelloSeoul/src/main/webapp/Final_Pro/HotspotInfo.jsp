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

<title>Hello, Seoul!</title>

<!--JS Section Begin -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68fb4c87ba8765d71119fecd40096446"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'/web/hotspotrecommend',
		data:{'sg' : $('#sg').val() },
		dataType:'json',
		success : function(r){
			for(var i=0;i<r.length;i++){
				$('.cardbar').append(`
						<a href='/web/gotoHotspotinfo?pc=\${r[i].loc_pc}'>
						<li style="float: left;">
						<div class='card' style="width: 300px; margin-left: 2px; margin-right: 2px;">
							<h3 class='card-header'>\${r[i].loc_name}</h3>
							<div class='card-body'>
								<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">						
							</div>
						</div>
						</li>
						</a>
						`);
				
			}
			
		},
		error : function(x){
			alert("error!");
		}
		
	});
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">

</style>
<!-- Style Section End -->


</head>
<body>
<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
	<section class='container'>
		<div class='ctgbar'>
			<div class='titlebar' style="text-align: center;">
				<input type="hidden" id="sg" value="${info.loc_sg}">
				<p>${info.loc_ctg2}</p>
				<p>${info.loc_name}</p>
				<p>Img Icon</p>
			</div>
			<hr class='hr-blurry'/>
			<div class='infobar'>
				<div class='infoimg d-flex justify-content-center'>
					<img src="${info.loc_img}" style="object-fot:cover; width: 1000px; height: 800px;">
				</div>
				<div class='infodetail'>
					<table>
						<tr>
							<th>GU</th>
							<td>${info.loc_sg}</td>
						</tr>
						<tr>
							<th>Address</th>
							<td>${info.loc_addr}</td>
						</tr>
						<tr>
							<th>Tel</th>
							<td>${info.loc_tel}</td>
						</tr> 
						<tr>
							<th>Link</th>
							<td>${info.loc_info}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='mapbar d-flex justify-content-center'>
				<div class='div_map' style="width: 800px; height: 500px;" id="map"></div>	
				<script type="text/javascript">
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
	   						center: new kakao.maps.LatLng(${info.loc_x}, ${info.loc_y}), // 지도의 중심좌표
	   						level: 3 // 지도의 확대 레벨
							};
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(${info.loc_x}, ${info.loc_y}); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				</script>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='tagbar'>
				<p>#tag,#tag,#tag,#tag,#tag,#tag,#tag,</p>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='tobar'>
				<ul class='cardbar' style="list-style-type: none;">
					<li style="float: left;">
					<!-- ajax line -->
					</li>
				</ul>
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>