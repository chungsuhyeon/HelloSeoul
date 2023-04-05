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
		$.ajax({
			type:'post',
			url:'/web/userrecom',
			data: {'userid' : $('#userid').val()},
			datatype:'text',
			success:function(r){
				console.log(r);
			},
			error:function(x){
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
<header class='headerline'>
<jsp:include page="header.jsp"></jsp:include>
</header>
	<section class='section'>
		<input type="hidden" id="userid" value="${user_id}">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" class="d-block w-100" alt="...">
      				<div class="carousel-caption d-none d-md-block">
        				<h5>First slide label</h5>
        				<p>Some representative placeholder content for the first slide.</p>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img src="/web/resources/final_style/img/mainIdex/mainimg02.jpg" class="d-block w-100" alt="...">
      				<div class="carousel-caption d-none d-md-block">
        				<h5>Second slide label</h5>
        				<p>Some representative placeholder content for the second slide.</p>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img src="/web/resources/final_style/img/mainIdex/mainimg03.jpg" class="d-block w-100" alt="...">
      				<div class="carousel-caption d-none d-md-block">
        				<h5>Second slide label</h5>
        				<p>Some representative placeholder content for the second slide.</p>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img src="/web/resources/final_style/img/mainIdex/mainimg04.jpg" class="d-block w-100" alt="...">
      				<div class="carousel-caption d-none d-md-block">
        				<h5>Second slide label</h5>
        				<p>Some representative placeholder content for the second slide.</p>
      				</div>
    			</div>
  			</div>
  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  			</button>
		</div>
		<div class='container-fluid'>
			<div class='col-12'>
			<hr class='hr'>
			</div>
			<div class='col-6'>
				<h1>Calander</h1>
				<div class='mt-4' style="margin-right: 10px;">
 					<jsp:include page="../making/testmonth.jsp"></jsp:include>
				</div>
			</div>

			<div class='col-6' style="margin-top: 80px; margin-bottom: 100px;">
 				<div class='moneytb'>
					<table class='table table-hover'>
						<thead>
							<tr class='table-primary' style="text-align: center;">
								<th>Nation</th>
								<th>currency</th>
								<th>KRW</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>America</td>
							<td>$</td>
							<td>1000</td>
							</tr>
							<tr>
							<td>America</td>
							<td>$</td>
							<td>1000</td>
							</tr>
							<tr>
							<td>America</td>
							<td>$</td>
							<td>1000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
				<iframe src="https://kr.widgets.investing.com/live-currency-cross-rates?theme=darkTheme&pairs=13926,13925,13927,1915,13923,13924,1918,1919,1031410,1920,1921,1922,14486,1925,1926,13922,1928,1089823" width="100%" height="600" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0"></iframe><div class="poweredBy" style="font-family: Arial, Helvetica, sans-serif;">Publisher<a href="https://kr.investing.com?utm_source=WMT&amp;utm_medium=referral&amp;utm_campaign=LIVE_CURRENCY_X_RATES&amp;utm_content=Footer%20Link" target="_blank" rel="nofollow">Investing.com</a></div>
				</div>					 
			</div>
		</div>
	</section>
	<footer class='footerline'>
	<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>