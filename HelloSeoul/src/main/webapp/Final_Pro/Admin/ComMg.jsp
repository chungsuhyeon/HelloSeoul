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
<title>AdminPage</title>
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
<jsp:include page="adHeader.jsp"></jsp:include>
<section class='mains container'>
<div class='row'>
	<div class='col-12'>
		<table class='table'>
			<tbody>
				<tr>
					<td>TotalPost : x</td>
					<td>TodayPost : x</td>
					<td>TodayRport : x</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class='row'>
	<div class='col-12'>
		<table class='table'>
			<thead>
				<tr>
					<th>ComNo</th>
					<th>title</th>
					<th>postuser</th>
					<th>reportreason</th>
					<th>manage</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>23</td>
					<td>tedinfdq</td>
					<td>dqwndiq@naver.coom</td>
					<td>adver</td>
					<td>
						<a href="#">More</a>
						<a href="#">Delete</a>
						<a href="#">Rollback</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

</section>
<jsp:include page="adFooter.jsp"></jsp:include>
</body>
</html>