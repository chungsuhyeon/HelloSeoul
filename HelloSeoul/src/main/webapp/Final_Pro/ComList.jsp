<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	$('button#write').click(function(){
// 		console.log("good");
// 		var nul=null;
		if($("input#user_id").val()==""){
			alert("로그인 후 이용 가능합니다.");
		}
		else if($("input#user_id").val()!=""){
			location.replace("/web/Final_Pro/ComWrite.jsp?type=write&planner_no=0");
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
	<input type="hidden" id="user_id" value=${user_id }>
		<div>Hot Reviews</div>
		<div class='hotboard col-6'>
			<div id="carouselExampleFade" class="carousel slide carousel-fade col-12" data-bs-ride="carousel">
  				<div class="carousel-inner">
  					<c:forEach var='i' items="${top3}" varStatus="status">
  					<c:if test="${status.index==0 }">
  					    				<div class="carousel-item active" data-bs-interval="2000">
      					<a href="/web/infoSelect?no=${i.com_no}"><img src="/web/resources/test/${i.com_filename}" style="height:500px;height: 500px "class="d-block w-100" alt="..."></a>
      					<div class="carousel-caption d-none d-md-block">
					        <h5>${i.com_title }</h5>
					        <p>${i.com_cont }</p>
      					</div>
    				</div>
    			</c:if>
    				
    				<div class="carousel-item" data-bs-interval="2000">
      					<a href="/web/infoSelect?no=${i.com_no}"><img src="/web/resources/test/${i.com_filename}" style="height:500px;height: 500px "class="d-block w-100" alt="..."></a>
      					<div class="carousel-caption d-none d-md-block">
					        <h5>${i.com_title }</h5>
					        <p>${i.com_cont }</p>
      					</div>
    				</div>
    				</c:forEach>
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
			<div class='col-12'>
				<div>Planner Share</div>
				<div class='sharebox d-inline-flex'>
				
				</div>
			</div>
		</div>
		<div class='boardlist col-6'>
			<div class='row'>
				<div class='col-6'>
				Board List
				</div>
				<div class='col-6 text-end'>
					<button class='write btn btn-primary' id="write">Write</button>
				</div>
			</div>
			<div class='row'>
				<div class='col-12'>
					<table class='table'>
						<thead>
							<tr class='table-primary'>
								<th>No</th>
								<th>Category</th>
								<th class='w-25'>Title</th>
								<th class='w-25'>Nick Name</th>
								<th>RegDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${board}" var='i'>
    						<tr>
      							<td>${i.COM_NO}</td>
      							<td><c:choose>
								<c:when test="${i.COM_CTG eq 1}">[PlannerShare]</c:when>
								<c:when test="${i.COM_CTG eq 2}">[Review]</c:when>
								<c:otherwise>[together travel]</c:otherwise>
							</c:choose></td>
<<<<<<< HEAD

      							<td><a href="/web/infoSelect?no=${i.COM_NO}" style="text-decoration: none;color:black;">${i.COM_TITLE}
      							<c:if test="${i.REPLY>0 }"> <span style="color: red;">&nbsp;[${i.REPLY }]</span></c:if>
      							</a></td>
      							<td class='text-center'>${i.USER_NICK}</td>

=======
      							<td><a href="/web/infoSelect?no=${i.COM_NO}">${i.COM_TITLE}</a></td>
      							<td>${i.USER_NICK}</td>
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
      							<td>${fn:substringBefore(i.COM_REGDATE, ' ')}</td>
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