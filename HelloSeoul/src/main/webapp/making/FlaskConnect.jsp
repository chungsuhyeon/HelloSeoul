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
<title>Insert title here</title>
<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('.tt').click(function(){
		document.location.href="/web/pgAction?Page=1&Block=1";
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
<button class='tt btn btn-primary'>pgt</button>
<div class='pg d-flex justify-content-center mt-4'>
<ul class='pagination'>
	<c:choose>
		<c:when test="${pageBean.currentPage eq 1}">
			<li class="page-item disabled">
				<a class="page-link" href="#">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href="/web/pgAction?Page=1&Block=1">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pageBean.currentBlock eq 1}">
			<li class="page-item disabled">
			  <a class="page-link" href="#">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage-1}&Block=${pageBean.currentBlock-1}">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:forEach var="pg" begin="${(pageBean.currentBlock-1)*pageBean.blockScale+1}" end="${pageBean.currentBlock*pageBean.blockScale}">
		<c:choose>
			<c:when test="${pg eq pageBean.currentPage}">
				<li class="page-item active">
					<a class="page-link" href="#">${pg}</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href="#">${pg}</a>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pageBean.currentPage eq pageBean.totalPage}">
			<li class="page-item disabled">
				<a class="page-link" href="#">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage+1}&Block=${pageBean.currentBlock+1}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pageBean.currentBlock eq 1}">
			<li class="page-item disabled">
			  <a class="page-link" href="#">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href="/web/pgAction?Page=${pageBean.totalPage}&Block=${pageBean.totalBlock}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>
</div>
</body>
</html>