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
<jsp:include page="./OnlyInclude/header.jsp"></jsp:include>
<section class='container'>
<jsp:include page="./OnlyInclude/indexMainImg.jsp"></jsp:include>
<hr class='hr'/>
<div class='row'>
	<div class='col-6'>
		<div class='col-12'>
			<jsp:include page="./OnlyInclude/calendar.jsp"></jsp:include>
		</div>
	</div>
	<div class='col-6'>
		<div class='row'>
			<div class='col-12'>
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
		</div>
	</div>
</div>
</section>
<jsp:include page="./OnlyInclude/footer.jsp"></jsp:include>
</body>
</html>