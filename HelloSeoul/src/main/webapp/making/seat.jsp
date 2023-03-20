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

<script type="text/javascript">
	$(function() {
		$(".seat >button").click(function() {
			//좌석벨류
			alert($(this).val());

			//유무
			if ($(this).attr('class') == 'useseat btn btn-primary') {
				alert('this seat is used!');
			} else {
				alert('emptyseat');
				//function seat use ajax
			}
		});

	});
</script>


<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet"
	href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
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
				<div  class="col-5" style="display:flex;">성인 &nbsp;&nbsp;
								<button type="button"  title="성인 좌석 선택 감소">-</button>
								<div >
									<button type="button" title="성인 현재 좌석 선택 수"
										>2</button>
									
								</div>
								<button type="button" title="성인 좌석 선택 증가">+</button>
							</div>
							<div class="col-4" style=" display:flex;">청소년&nbsp;
							<button type="button"  title="성인 좌석 선택 감소">-</button>
								<div >
									<button type="button" title="성인 현재 좌석 선택 수"
										>2</button>
									
								</div>
								<button type="button" title="성인 좌석 선택 증가">+</button>
							</div>
							</div>
				<div class='bg-primary'
					style="margin-top: 15px; margin-bottom: 15px; width: 60%; height: 30px; margin-left: 15%; font-weight: bold; text-align: center; color: white;">screen</div>

				<div style="margin-bottom: 15px;">
					<c:forEach var='i' begin="0" end="9">
						<div class='seat col-12' style="display: inline-flex;">
							<h3>${i}</h3>
							<c:forEach var='x' begin="0" end="9">
								<c:choose>
									<c:when test="${x%2==0}">
										<button type="button"
											class="emptyeseat btn btn-outline-primary"
											style="margin: 1px;" value="${i}">${i}-${x}</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="useseat btn btn-primary"
											style="margin: 1px;" value="${i}">${i}-${x}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class='col-1' style="border-right: solid 1px;"></div>
			<div class='col-2'><span><img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86815/86815_185.JPG" alt="영화 포스터" style="margin-top:20%;display: inline; width: 100%;height: 80%; "></span></div>
			<div class='col-2' >
			<div >
			<!-- btn-left -->
			
			<div class='seatbar col-12' style=" height: 100%; margin-top:20%; margin-left:5%; font-size: 25px" >
			
				<div  style="display: block;">
					<span >제목:스즈메의 문단속(2D)</span>
				</div>
				
				<div  style="display: block;">
					<span  title="12세 관람가">관람등급:12세 관람가</span>
				</div>
				<div  style="display: block;">
					<span  title="12세 관람가">상영시간:90분</span>
				</div>
			
				<div  style="display: block;">
					<span >장소:</span>
					<span><a target="_blank" style="width:100%;" onmousedown="javascript:logClick('SUMMARY/극장상세보기');" href="http://www.cgv.co.kr/theaters/?theaterCode=0001" title="CGV 강변">CGV 강변</a></span>
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
				<div  title="극장선택" style="display: none;"></div>
			</div>
			
			
			<!-- btn-right -->
			
		</div>
			</div>
			<div class='col-2' ></div>
		</div>
		<!-- 테이블 시작 및 결제 관련 -->

	</section>

	<footer> </footer>
</body>
</html>