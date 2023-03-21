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
	$(".postbar").click(function(){
		$("form").submit();
	});
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.tablebar tr > th{
	width: 5%;
}
</style>
<!-- Style Section End -->


</head>
<body>
<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
<<<<<<< HEAD
	<section class='section d-flex justify-content-center bg-info'>
		<div class='tablebar col-6 mt-4 mb-4 bg-light' style="border-radius: 25px;">
			<form action="/web/boardInsert" method="post">
				<table class='table'>
					<tbody>
						<tr>
							<th>Catergory</th>
							<td>
								<select class='form-select' name="com_ctg" style="width: 30%;">
									<option value="">&nbsp;+ 선택해주세요</option>
									<option value="">----------------------</option>
									<option value="1">정보공유</option>
									<option value="2">후기</option>	
									<option value="3">동행모집</option>
								</select>
							</td>
							<td> <input type="hidden" value="${user_id }" name="user_id">  </td>
						</tr>
						<tr>
							<th>Writer</th>
							<td>
								<input style="width: 30%;" class='form-control' type="text" readonly="readonly" name="user_nick" value="${user_nickName}"/>
							</td>
						</tr>
						<tr>
							<th>Title</th>
							<td>
								<input class='form-control' type="text" name="com_title" value=""/>
							</td>
						</tr>
						<tr>
							<th>Contents</th>
							<td>
								<textarea class="form-control" id="com_cont" name='com_cont' rows="20" style="resize: none;"></textarea>
							</td>
						</tr>
						<tr>
							<th>File</th>
							<td>
								 <input class="form-control" type="file" id="com_filename" name='com_filename'>
							</td>
						</tr>
	
					</tbody>
				</table>
			</form>
			<div class='buttonbar mb-4 d-flex justify-content-evenly'>
				<button type="button" class="postbar btn btn-success">Post</button>
				<button type="button" class="cancelbar btn btn-danger">Cancel</button>
=======
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
      							<td><c:choose>
						<c:when test="${i.com_ctg eq 1}">정보공유</c:when>
						<c:when test="${i.com_ctg eq 2}">후기</c:when>
						<c:otherwise>동행모집</c:otherwise>
						
						</c:choose></td>
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
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>