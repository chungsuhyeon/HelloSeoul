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
		<div class='todaybox col-6'>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th>수</th>
						<th>count</th>
						<th>전일대비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>오늘의 방문자수 :</td>
						<td>20</td>
						<td>↑</td>
					</tr>
					<tr>
						<td>오늘의 게시글수 :</td>
						<td>20</td>
						<td>↑</td>
					</tr>
					<tr>
						<td>오늘의 플래너생성수 :</td>
						<td>20</td>
						<td>↑</td>
					</tr>
					<tr>
						<td>누적 회원자수 :</td>
						<td>20</td>
						<td>↑</td>
					</tr>
					<tr>
						<td>누적 플래너생성수 :</td>
						<td>20</td>
						<td>↑</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class='chartimg col-6'>
			<h1>Chart</h1>
		</div>
	</div>
</section>
<jsp:include page="adFooter.jsp"></jsp:include>
</body>
</html>