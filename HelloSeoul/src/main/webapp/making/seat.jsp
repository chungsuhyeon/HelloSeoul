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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	$(".seat >button").click(function(){
		//좌석벨류
		alert($(this).val());
		
		//유무
		if($(this).attr('class')=='useseat btn btn-primary'){
			alert('this seat is used!');
		}else{
			alert('emptyseat');
			//function seat use ajax
		}
	});
	
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.screen {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}
</style>
<!-- Style Section End -->


</head>
<body>
	<section class='section'>
		<div class='container-fluid' style="display: inline-flex; border: solid;">
		<div class="screen" align="center">Screen</div>
			<!-- 좌석표 -->
			<div class='seatbar col-4'>
			<c:forEach var='i' begin="0" end="9">
				<div class='seat col-12' style="display: inline-flex;">
					<h3>${i}</h3>
					<c:forEach var='x' begin="0" end="9">
						<c:choose>
							<c:when test="${x%2==0}">
								<button type="button" class="emptyeseat btn btn-outline-primary" style="margin: 1px;" value="${i}">${i}-${x}</button>					
							</c:when>
							<c:otherwise>
								<button type="button" class="useseat btn btn-primary" style="margin: 1px;" value="${i}">${i}-${x}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:forEach>
			</div>
			<!-- 테이블 시작 및 결제 관련 -->
<!-- 			<div class='paybar col-4'> -->
<!-- 				<table class='table table-hover'> -->
<!-- 					<thead> -->
<!-- 						<tr class='table-primary'> -->
<!-- 							<th>th</th> -->
<!-- 							<th>th</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						<tr class='table-info'> -->
<!-- 							<td>td</td> -->
<!-- 							<td>td</td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 			</div> -->
		</div>
	</section>
	<footer>
	</footer>
</body>
</html>