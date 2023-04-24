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
					<th>TotalDB : x</th>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class='row'>
	<div class='col-6'>
		<table class='table'>
			<thead>
				<tr>
					<th>Gungu</th>
					<th>Count</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>jongro</td>
					<td>1223</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class='col-6'>
		<table class='table'>
			<thead>
				<tr>
					<th colspan="2">Add Location</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Loc_name</td>
					<td>
						<input type="text" class='form-control'>
					</td>
				</tr>
				<tr>
					<td>loc_ctg1</td>
					<td>
						<select>
						
						</select>
					</td>
				</tr>
				<tr>
					<td>loc_ctg2</td>
					<td>
						<select>
						
						</select>
					</td>
				</tr>
				<tr>
					<td>sg</td>
					<td>
						<select>
						
						</select>
					</td>
				</tr>
				<tr>
					<td>locaddr</td>
					<td>
						<input type="text" class='form-control'>
					</td>
				</tr>
				<tr>
					<td>loctel</td>
					<td>
						<input type="text" class='form-control'>
					</td>
				</tr>
				<tr>
					<td>loctime</td>
					<td>
						<input type="text" class='form-control'>
					</td>
				</tr>
				<tr>
					<td>locinfo</td>
					<td>
						<textarea rows="" cols=""></textarea>
					</td>
				</tr>
				<tr>
					<td>locimg</td>
					<td>
						<input type="text" class='form-control'>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class='btn btn-primary'>Add</button>
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