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
<section class='container'>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/web/resources/final_style/img/mainIdex/mainimg02.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/web/resources/final_style/img/mainIdex/mainimg03.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="visually-hidden">Next</span>
</button>
</div>
<hr class='hr'/>
<div class='row'>
	<div class='col-6'>
		<div class='col-12 d-inline-flex justify-content-center'>
			<button class='btn btn-primary'>Prev</button>
			<h2>Month</h2>
			<button class='btn btn-primary'>Next</button>
		</div>
		<div>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th>Sun</th>
						<th>Mon</th>
						<th>Tue</th>
						<th>Wen</th>
						<th>Tur</th>
						<th>Fri</th>
						<th>Sat</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class='col-6'>
		<div class='row'>
			<div class='col-6'>
				<table class='table'>
					<thead>
						<tr>
							<th>Nation</th>
							<th>KRW</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Korea</td>
							<td>1000</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class='col-6'>
				<div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
  					<div class="card-header">Weather</div>
  					<div class="card-body">
    					<h4 class="card-title">Primary card title</h4>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>