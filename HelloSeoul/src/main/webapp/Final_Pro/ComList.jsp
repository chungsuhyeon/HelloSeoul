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

<title>Hello, Seoul!</title>

<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	$('.write').click(function(){
		if($("input#user_id").val()==""){
			alert("login plz");
		}
		else if($("input#user_id").val()!=""){
			location.replace("/web/Final_Pro/ComWrite.jsp");
		}
	});
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
@
</style>
<!-- Style Section End -->


</head>
<body>
<jsp:include page="./header.jsp"></jsp:include>
	<section class='section bg-light'>
		<div class='newcomm container-fluid bg-image' style="background-image: url('/web/resources/final_style/img/comm/listbackground.jpg'); padding: 30px; padding-top: 50px;">
			<div class='newcomm' style="display: inline-flex; position: relative;">
				<div class='newcomm-contents bg-image' style="background-image:url('/web/resources/final_style/img/no_name.jpg'); width:500px; height:600px; margin: 50px;">
					<!-- 커뮤니티 글 첨부 파일 이미지 태그 -->
					<img alt="" src="/web/resources/final_style/img/comm/newcomm.png" style="width:550px; height: 700px; margin-top: -50px; margin-left: -20px;">
				</div>
				<div class='newcomm-title' style="position: absolute; margin-top: 580px; margin-left: 80px">
					<!-- 커뮤니티 글 제목 태그 -->
					<h3>Title Test line ...!!!!!</h3>
				</div>
			</div>
			<div class='newcomm' style="display: inline-flex; position: relative;">
				<div class='newcomm-contents bg-image' style="background-image:url('/web/resources/final_style/img/no_name.jpg'); width:500px; height:600px; margin: 50px;">
					<img alt="" src="/web/resources/final_style/img/comm/newcomm.png" style="width:550px; height: 700px; margin-top: -50px; margin-left: -20px;">
				</div>
				<div class='newcomm-title' style="position: absolute; margin-top: 580px; margin-left: 80px">
					<h3>Title Test line ...!!!!!</h3>
				</div>
			</div>
			<div class='newcomm' style="display: inline-flex; position: relative;">
				<div class='newcomm-contents bg-image' style="background-image:url('/web/resources/final_style/img/no_name.jpg'); width:500px; height:600px; margin: 50px;">
					<img alt="" src="/web/resources/final_style/img/comm/newcomm.png" style="width:550px; height: 700px; margin-top: -50px; margin-left: -20px;">
				</div>
				<div class='newcomm-title' style="position: absolute; margin-top: 580px; margin-left: 80px">
					<h3>Title Test line ...!!!!!</h3>
				</div>
			</div>
		</div>
		<div class='tagtbbar container-fluid' style="display: inline-flex; padding-top: 20px;">
			<div class='col-4'>
				<div class='tagline bg-dark' style="border: solid; width:80%; border-radius: 20px; padding: 10px;">
					<div class='col-12' style="text-align: center;">Real-Time Hot Tag</div>
					<div class='tagbox'>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>					
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>					
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>					
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>					
					<button type="button" class="btn btn-outline-success" style="margin:  5px;">Success</button>					
					</div>
				</div>
			</div>
			<div class='col-8'>
				<input type="hidden" value="${user_id }" id="user_id"name="user_id"/>
				<div class='col-12' style="display: inline-flex; margin-bottom: 10px;">
				<h2>Community List</h2>
				<button type="button" class="write btn btn-primary" style="float: right; margin-left: auto;">Write</button>	
				</div>
				<table class="table table-hover" style="border: solid;">
					<thead>
    					<tr class="table-primary">
      						<th>ComNo</th>
      						<th>Category</th>
      						<th>Title</th>
      						<th>Nick</th>
      						<th>RegDate</th>
    					</tr>
	  				</thead>
  					<tbody>
  						<c:forEach items="${board}" var='i'>
    						<tr class="table-info">
      							<td>${i.com_no}</td>
      							<td>${i.com_ctg }</td>
      							<td><a href="/web/infoSelect?no=${i.com_no}">${i.com_title}</a></td>
      							<td>${i.user_nick}</td>
      							<td>${i.com_regdate}</td>
    						</tr>
  						</c:forEach>
  					</tbody>
  				</table>
  				<div class='d-flex justify-content-center'>
  					<ul class="pagination pagination-sm">
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