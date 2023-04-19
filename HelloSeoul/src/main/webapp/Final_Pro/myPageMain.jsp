<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		$(".loadMyPlanner").click(function(){
			var no = $(this).parent().attr('name');
			location.href = "/web/Final_Pro/myPageShow.jsp?no=" + no;
		}); // $(".loadMyPlanner").click
				
	}); // function
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
	.contentsbox table{
		height: 300px;
		width: 400px;
	}
</style>
<!-- Style Section End -->

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<div class='container'>
		<!-- User Info -->
		<div class='userinfobox d-flex row'>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th colspan="4"><h2>${user_nickName}</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr class='table-primary text-center'>
						<td>Nationality : ${userInfo.USER_NATION}</td>
						<td>Age : ${userInfo.USER_AGE}</td>
						<td>Tourism purpose : ${userInfo.USER_PP}</td>
						<td>1st place in tourism : ${userInfo.USER_FIRST}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- Nav Bar -->
		<div class='navbox'>
			<ol class="breadcrumb bg-light">
  				<li class="breadcrumb-item"><a href="/web/Final_Pro/myPageJjim.jsp">Wish</a></li>
  				<li class="breadcrumb-item"><a href="/web/Final_Pro/myPageCreate.jsp">Planner Create</a></li>
			</ol>
		</div>
			<!-- Contents Box -->
			<div class='contentsbox d-inline-flex'>
				<c:forEach var="i" items="${userCreatedPlanner}" begin="0" end="2">
					<div name="${i.PLANNER_NO}" class='mx-2'>
						<table class="loadMyPlanner table table-hover">
	  						<tbody class='table-light text-center'>
	  							<tr>
	      							<th>Planner Title</th>
	      							<td>${i.PLANNER_TITLE}</td>
	    						</tr>
	    						<tr>
	      							<th>Location</th>
	      							<td>Seoul</td>
	    						</tr>
	    						<tr>
		      						<th>Date</th>
	    	  						<td>${fn:substringBefore(i.PLANNER_START, ' ')} ~ ${fn:substringBefore(i.PLANNER_END, ' ')}</td>
	    						</tr>
	    						<tr>
	      							<th>Planner Memo</th>
	      							<td>${i.PLANNER_INFO}</td>
	    						</tr>
	    						<tr>
	      							<th>Last Update</th>
	      							<td>${i.UPDATE_USER} / ${fn:substring(i.PLANNER_REGDATE, 0, 16)}</td>
	    						</tr>
	    					</tbody>
	    				</table>
					</div>			
				</c:forEach>			
			</div>
			<hr class='hr'>
			<!-- Paging Button -->
			<div class='pagingbar d-flex justify-content-center mt-4'>
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
						<c:when test="${pageBean.currentPage eq 1}">
							<li class="page-item disabled">
							  <a class="page-link" href="#">&laquo;</a>
							</li>
						</c:when>
						<c:when test="${pageBean.currentPage eq ((pageBean.currentBlock-1)*pageBean.blockScale)+1}">
							<li class="page-item">
								<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage-1}&Block=${pageBean.currentBlock-1}">&laquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage-1}&Block=${pageBean.currentBlock}">&laquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pg" begin="${(pageBean.currentBlock-1)*pageBean.blockScale+1}" end="${pageBean.currentBlock*pageBean.blockScale}">
						<c:choose>
							<c:when test="${pg eq pageBean.currentPage}">
								<li class="page-item active">
									<a class="page-link" href="/web/pgAction?Page=${pg}&Block=${pageBean.currentBlock}">${pg}</a>
									<input type="hidden" id="conStart" value="${pageBean.pageStart}">
									<input type="hidden" id="conEnd" value="${pageBean.pageEnd}">
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/web/pgAction?Page=${pg}&Block=${pageBean.currentBlock}">${pg}</a>
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
						<c:when test="${pageBean.currentPage eq (pageBean.currentBlock*pageBean.blockScale)}">
							<li class="page-item">
								<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage+1}&Block=${pageBean.currentBlock+1}">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="/web/pgAction?Page=${pageBean.currentPage+1}&Block=${pageBean.currentBlock}">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageBean.currentBlock eq pageBean.totalBlock}">
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
		</div>
	</section>
	<footer>
		<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>