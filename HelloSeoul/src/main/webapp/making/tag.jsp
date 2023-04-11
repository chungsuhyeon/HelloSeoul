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
<title>Community List</title>
<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	//Board Write
	$('.write').click(function(){
		if($("input#user_id").val()==""){
			alert("로그인 후 이용 가능합니다.");
		}
		else if($("input#user_id").val()!=""){
			location.replace("/web/Final_Pro/ComWrite.jsp?type=write&plno=0");
		}
	});
	//Board Info
	$("div#top3list").click(function(){
		var no=$(this).text();
		document.location.href="/web/infoSelect?no="+no;
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
<jsp:include page="./header.jsp"></jsp:include>
<section class='container'>
	<div class='row'>
		<div class='hotboard col-6'>
		<c:forEach var='i' items="${top3}">
		
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  				<div class="carousel-inner">
    				<div class="carousel-item active">
      					<img src="..." class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
      					<img src="..." class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
      					<img src="..." class="d-block w-100" alt="...">
    				</div>
  			</div>
  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Previous</span>
  			</button>
	  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Next</span>
	  		</button>
			</div>
		
		
		</c:forEach>	
		</div>
		<div class='boardlist col-6'>
			<div class='row'>
				<div class='col-6'>
				Board List
				</div>
				<div class='col-6 text-end'>
					<button class='btn btn-primary'>Write</button>
				</div>
			</div>
			<div class='row'>
				<div class='col-12'>
					<table class='table'>
						<thead>
							<tr class='table-primary'>
								<th>No</th>
								<th>Category</th>
								<th>Title</th>
								<th>Nick Name</th>
								<th>RegDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${board}" var='i'>
    						<tr>
      							<td>${i.COM_NO}</td>
      							<td>${i.COM_CTG }</td>
      							<td><a href="/web/infoSelect?no=${i.COM_NO}">${i.COM_TITLE}</a></td>
      							<td>${i.USER_NICK}</td>
      							<td>${i.COM_REGDATE}</td>
    						</tr>
  							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class='row'>
				<div class='paging col-12 d-flex justify-content-center'>
					<ul class="pagination pagination-sm">
  					<c:choose>
  					<c:when test="${pageBean.currentBlock==1}">
    					<li class="page-item disabled">
      						<a class="page-link" href="#">&laquo;</a>
    					</li>
    				</c:when>
    				<c:otherwise>
    					<li class="page-item">
      						<a class="page-link" href="/web/boardSelect?page=${pageBean.startPage-1}">&laquo;</a>
    					</li>
    				</c:otherwise>
    				</c:choose>
    				<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}">
    				<c:choose>
    				<c:when test="${pageBean.currentPage==i}">
    					<li class="page-item active">
      						<a class="page-link" href="#">${i}</a>
    					</li>
    				</c:when>
    				<c:otherwise>
    					<li class="page-item">
      						<a class="page-link" href="/web/boardSelect?page=${i}">${i}</a>
    					</li>
    				</c:otherwise>
    				</c:choose>
    				</c:forEach>
					<c:choose>
  					<c:when test="${pageBean.totalPage==pageBean.endPage }">
    					<li class="page-item disabled">
      						<a class="page-link" href="#">&raquo;</a>
      					</li>
    				</c:when>
    				<c:otherwise>
    					<li class="page-item">
      						<a class="page-link" href="/web/boardSelect?page=${pageBean.endPage+1 }">&raquo;</a>
      					</li>
    				</c:otherwise>
    				</c:choose>		
  					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>