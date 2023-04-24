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
<div class='totalbox row'>
	<div class='col-12'>
		<table class='table'>
			<tbody>
				<tr>
					<th>TotalUsers : x</th>
					<th>TodayJoin : x</th>
					<th>TodayOut : x</th>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class='userbox row'>
	<div class='col-12'>
		<table class='table text-center'>
			<thead>
				<tr class='table-primary'>
					<th>User ID</th>
					<th>Nickname</th>
					<th>Gender</th>
					<th>Nation</th>
					<th>PostCount</th>
					<th>Manage</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='i' items="${users}">
				<c:if test="${i.USER_ID ne 'Admin'}">
				<tr>
					<td class='w-25'>${i.USER_ID}</td>
					<td>${i.USER_NICK}</td>
					<c:choose>
						<c:when test='${i.USER_GENDER eq "1"}'>
							<td>Male</td>
						</c:when>
						<c:when test='${i.USER_GENDER eq "2"}'>
							<td>Female</td>
						</c:when>
						<c:otherwise>
							<td>Secret</td>
						</c:otherwise>
					</c:choose>					
					<td>${i.USER_NATION}</td>
					<td>${i.PTCOUNT}</td>
					<td>
						<a href='#'>Stop</a>
						<a href='#'>Out</a>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class='userffpp row'>
	<div class='col-6'>
		<table class='table'>
			<thead>
				<tr class='table-primary'>
					<th>User_ff</th>
					<th>Count</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='i' items='${userFirstCount}'>
					<tr>
						<c:choose>
						<c:when test="">
							<td>${i.USER_FIRST}</td>
						</c:when>
						<c:when test="">
							<td>${i.USER_FIRST}</td>
						</c:when>
						<c:when test="">
							<td>${i.USER_FIRST}</td>
						</c:when>
						<c:when test="">
							<td>${i.USER_FIRST}</td>
						</c:when>
						<c:otherwise>
							<td>${i.USER_FIRST}</td>
						</c:otherwise>
						</c:choose>
						<td>${i.COUNTING }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class='col-6'>
		<table class='table'>
			<thead>
				<tr class='table-primary'>
					<th>User_ff</th>
					<th>Count</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>bus</td>
					<td>122</td>
				</tr>
				<tr>
					<td>bus</td>
					<td>122</td>
				</tr>
				<tr>
					<td>bus</td>
					<td>122</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</section>
<jsp:include page="adFooter.jsp"></jsp:include>
</body>
</html>