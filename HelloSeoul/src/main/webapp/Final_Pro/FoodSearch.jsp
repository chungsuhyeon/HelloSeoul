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
<title>Hello, Seoul</title>
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
	<div class='row'>
		<div class='col-6'>
			<div class='photo h-75'>
				<h1>img</h1>
			</div>
			<div class="form-group h-25">
      			<label for="formFile" class="form-label mt-4">Input Food Image</label>
      			<input class="form-control" type="file" id="formFile">
    		</div>
		</div>
		<div class='col-6'>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th>Loc Name</th>
						<th>Loc Gu</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>xxps</td>
						<td>xxps</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>