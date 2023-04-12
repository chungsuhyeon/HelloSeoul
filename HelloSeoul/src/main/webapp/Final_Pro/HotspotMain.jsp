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
	$('#searchbt').click(function(){
		if($('#query').val().length!=0){
			alert($('#query').val());
			
			$.ajax({
				type: 'post',
				url: '/web/searchHot',
				data: {'query': $('#query').val()},
				dataType: 'json',
				success: function(s){
					alert(s);
				},
				error: function(x){
					alert("Error!");	
				}
			});
			
		}else{
			alert("plz!");
		}
	});
	
	$('#test').click(function(){
		$.ajax({
			type: 'post',
			url: '/web/paging',
			data: {'page': 3},
			dataType: 'json',
			success: function(s){
				$('.infocard a').remove();
				for(var i=0; i<s.length;i++){
					console.log(s[i]);
					$('.infocard').append(`
							<a href="/web/gotoHotspotinfo?pc=\${s[i].LOC_PC}">
							<li class='mb-4' style="float: left; width:310px; height:380px;">
								<div class="card" style="width: 300px; margin-left: 5px; margin-right: 5px;">
				  					<h3 class="card-header">\${s[i].LOC_NAME}</h3>
				  					<div class='card-body'>
										<img src="\${s[i].LOC_IMG}" style="object-fot:cover; width: 100%; height: 100%;">
				  					</div>
				  					<div class="card-body">
					    				<p class="card-text">\${s[i].LOC_INFO}</p>
					  				</div>
					  				<div class="card-footer text-muted">
				    				2 days ago
				  					</div>
								</div>						
							</li>
							</a>
					`);

				}
			},
			error: function(x){
				alert("Error!");	
			}
		});
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
	<section class='section'>
		<div class='container d-block' >
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  				<div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="/web/resources/final_style/img/hotspot/1280LotteTower.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
				      	<h3>Lotte Tower</h3>
				      	<p>Highest Building</p>
				      </div>
				    </div>
				    <div class="carousel-item">
				      <img src="/web/resources/final_style/img/hotspot/1280LotteTower.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
				      	<h5>First slide label</h5>
				      	<p>Some representative placeholder content for the first slide.</p>
				      </div>
				    </div>
				    <div class="carousel-item">
				      <img src="/web/resources/final_style/img/hotspot/1280LotteTower.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
				      	<h5>First slide label</h5>
				      	<p>Some representative placeholder content for the first slide.</p>
				      </div>
				    </div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class='navbar'>
				<div class='ctgbar'>
				<ol class="breadcrumb bg-primary mt-4">
	  				<li class="breadcrumb-item"><a href="#">LandMark</a></li>
	  				<li class="breadcrumb-item"><a href="#">History</a></li>
	  				<li class="breadcrumb-item"><a href="#">Nature</a></li>
	  				<li class="breadcrumb-item"><a href="#">Etc</a></li>
				</ol>
				</div>
				<div class='searchbar d-flex'>
					<input type="text" class="form-control" id="query" placeholder="Location Name" value="">
					<button type="button" class="btn btn-primary" id="searchbt">Search</button>
				</div>
			</div>
			<div class='infobar row'>
				<c:forEach var='i' items='${hotspot}'>
					<div class="card mb-3 col-3">
						<h4 class="card-header" style="overflow: hidden">${i.loc_name}</h4>
						<div class="card-body">
							<a href="/web/gotoHotspotinfo?pc=${i.loc_pc}"><img src="${i.loc_img}" style="width: 100%; height: 200px;"></a>
						</div>
						<div class="card-body">
					  		<p class="card-text"><a href="${i.loc_info}">${i.loc_info}</a></p>
						</div>
						<div class="card-body">
							<hr class='hr'>
					  		<a href="#" class="card-link">Jjim</a>
					  		<a href="/web/gotoHotspotinfo?pc=${i.loc_pc}" class="card-link">More</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class='pagingbar d-flex justify-content-center mt-4'>
				<div class='paging'>
					<ul class="pagination">
					    <li class="page-item disabled">
					      <a class="page-link" href="#">&laquo;</a>
					    </li>
					    <li class="page-item active">
					      <a class="page-link" href="#">1</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">2</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">3</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">4</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">5</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">&raquo;</a>
					    </li>
		  			</ul>
				</div>			
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>