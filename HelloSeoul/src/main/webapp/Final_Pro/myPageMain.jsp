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
// 			location.href = "/web/allPageLoad?no=" + no + "&modi=plannerShow";
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
				<c:forEach var="i" items="${userCreatedPlanner}" begin="0" end="3">
					<div name="${i.PLANNER_NO}" class='mx-2'>
						<table class="loadMyPlanner table table-hover">
	<!--   						<thead> -->
	<!--     						<tr> -->
	<!--       							<th>Planner Title</th> -->
	<!--       							<td>planner_title</td> -->
	<!--     						</tr> -->
	<!--   						</thead> -->
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
	    					</tbody>
	    				</table>
					</div>			
				</c:forEach>			
			</div>
			<hr class='hr'>
			<!-- Paging Button -->
			<div class='pagingbox d-flex justify-content-center my-4'>
				<div>
  					<ul class="pagination pagination-lg">
    					<li class="page-item disabled">
      						<a class="page-link" href="#">&laquo;</a>
    					</li>
   						<li class="page-item active">
      						<a class="page-link" href="#">1</a>
    					</li>
    					<li class="page-item">
      						<a class="page-link" href="#">2</a>
    					</li>
    					<li class="page-item">
      						<a class="page-link" href="#">3</a>
    					</li>
    					<li class="page-item">
      						<a class="page-link" href="#">4</a>
    					</li>
    					<li class="page-item">
      						<a class="page-link" href="#">5</a>
    					</li>
    					<li class="page-item">
      						<a class="page-link" href="#">&raquo;</a>
    					</li>
  					</ul>
  				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>