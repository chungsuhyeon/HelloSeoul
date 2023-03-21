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
<jsp:include page="header.jsp"></jsp:include>
	<section class='section'>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  			<div class="carousel-indicators">
    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  			</div>
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
		<div class='container-fluid' style="display: inline-flex;">
			<div class='col-6'>
				<jsp:include page="./CalenderIndex.jsp"></jsp:include>
			</div>
			<div class='col-6'>
				<jsp:include page="./Coin.jsp"></jsp:include>				
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>