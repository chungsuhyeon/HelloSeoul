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
<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
	<section class='container'>
		<div class='ctgbar'>
			<div class='titlebar' style="text-align: center;">
				<p>CateGoryName</p>
				<p>Title</p>
				<p>Img Icon</p>
			</div>
			<hr class='hr-blurry'/>
			<div class='infobar'>
				<div class='infoimg'>
					<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">
				</div>
				<div class='infodetail'>
					<table>
						<tr>
							<td colspan='2'>
							Contents
							</td>
						</tr>
						<tr>
							<th>ColumnName</th>
							<td>Contents</td>
						</tr>
						<tr>
							<th>ColumnName</th>
							<td>Contents</td>
						</tr>
						<tr>
							<th>ColumnName</th>
							<td>Contents</td>
						</tr>
						<tr>
							<th>ColumnName</th>
							<td>Contents</td>
						</tr>
					</table>
				</div>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='mapbar'>
				<div class='map'>
					<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">
				</div>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='tagbar'>
				<p>#tag,#tag,#tag,#tag,#tag,#tag,#tag,</p>
			</div>
			<hr class='hr hr-blurry'/>
			<div class='tobar'>
				<ul class='cardbar' style="list-style-type: none;">
					<li style="float: left;">
						<div class='card' style="width: 300px; margin-left: 2px; margin-right: 2px;">
							<h3 class='card-header'>Location Name</h3>
							<div class='card-body'>
								<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">						
							</div>
						</div>
					</li>
					<li style="float: left;">
						<div class='card' style="width: 300px; margin-left: 2px; margin-right: 2px;">
							<h3 class='card-header'>Location Name</h3>
							<div class='card-body'>
								<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">						
							</div>
						</div>
					</li>
					<li style="float: left;">
						<div class='card' style="width: 300px; margin-left: 2px; margin-right: 2px;">
							<h3 class='card-header'>Location Name</h3>
							<div class='card-body'>
								<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">						
							</div>
						</div>
					</li>
					<li style="float: left;">
						<div class='card' style="width: 300px; margin-left: 2px; margin-right: 2px;">
							<h3 class='card-header'>Location Name</h3>
							<div class='card-body'>
								<img src="/web/resources/final_style/img/mainIdex/mainimg01.jpg" style="object-fot:cover; width: 100%; height: 100%;">						
							</div>
						</div>
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