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
	$("button#cancelbt").click(function(){
		
		location.replace("/web/boardSelect");
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
	<section class='container d-flex justify-content-center'>
		<div class='tablebar col-8 mt-4 mb-4 bg-light' style="border-radius: 25px;">
			<form action="/web/boardInsert" method="post" enctype="multipart/form-data">
				<table class='table'>
					<tbody>
						<tr>
							<th>Catergory</th>
							<td>
								<select class='form-select' name="com_ctg" style="width: 30%;">
								<c:if test="${param.type eq 'write'}">
									<option value="">&nbsp;+ 선택해주세요</option>
									<option value="">----------------------</option>
									
									<option value="2">후기</option>	
									<option value="3">동행모집</option>
									</c:if>
									<c:if test="${param.type eq 'Planner'}">
									<option value="1">플래너공유</option>
									</c:if>
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
								 <input class="form-control" type="file" id="com_filename" name='file' >
								 <input type="hidden" id="planner_no" name="planner_no" 
								 value="${param.planner_no }"
								 
								 />
							</td>
							</tr>
						<tr>
							<c:if test="${param.type eq 'Planner'}">
							<th>Planner Title</th>
							<td>${Pltt}</td>
							</c:if>
						</tr>
	
					</tbody>
				</table>
			</form>
			<div class='buttonbar mb-4 d-flex justify-content-evenly'>
				<button type="button" class="postbar btn btn-success">Post</button>
				<button type="button" class="cancelbar btn btn-danger" id="cancelbt">Cancel</button>
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>