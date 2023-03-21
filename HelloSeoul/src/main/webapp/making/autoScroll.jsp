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
/* Slider */
#textSlider.row {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100% !important;
}
#textSlider div {
	color: #666;
	font-family: 'Lato', sans-serif;
	text-transform: uppercase;
	font-size: 14pt ;
}

.iamCol {
    text-align: right;
	float: left;
	font-weight: 300;
	font-size:30pt;
}
.iamCol p:nth-child(2) { margin-top: -20pt !important; }
.slideCol {
	text-align: left;
  overflow: hidden;
	font-weight: 500;
	font-size:14pt;
	display: block;
	white-space: nowrap;
}
.slideCol p { margin: 0px !important; }

.scroller {
   height: 70pt;
   line-height: 70pt;
   overflow: hidden;
}
.scroller .inner { animation: 10s normal infinite running scroll; }
@keyframes scroll {
   0%  	{margin-top: -20px;}
   15% 	{margin-top: -20px;}

   25%  {margin-top: -100pt;}
   40%  {margin-top: -100pt;}
   
   50%  {margin-top: -200pt;}
   65%  {margin-top: -200pt;}

   75%  {margin-top: -280pt;}
   90%  {margin-top: -280pt;}

   100% {margin-top: 0px;}
}

</style>
<!-- Style Section End -->


</head>
<body>
<div id="textSlider" class="row">
	<div class='col-8'>
		<table class='table table-hover'>
			<thead>
				<tr>
					<th>Nation</th>
					<th>currency</th>
					<th>KRW</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="col-8 slideCol">
		<div class="scroller">
			<div class="inner">
				<table class='table'>
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
		</div>
	</div>
</div>
</body>
</html>