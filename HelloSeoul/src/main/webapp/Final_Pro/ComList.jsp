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
			location.replace("/web/Final_Pro/ComWrite.jsp");
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
<header>
<jsp:include page="./header.jsp"></jsp:include>
</header>
<section class='container'>
	<div class='row'>
		<c:forEach var='i' items="${top3}">
		<div class='newcomm col-4 bg-image' style="background-image: url('/web/resources/final_style/img/comm/listbackground.jpg');">
			<div class='newcomm-contents bg-image' id="top3list" style="background-image: url('/web/resources/test/${i.com_filename }');"></div>
			<div class='newcomm-title'>
				<h3>${i.com_title }</h3>
			</div>
		</div>
		</c:forEach>
	</div>
	<div class='boardList row'>
		<div class='col-12'>
			<div class='row'>
			<input type='hidden' class='form-control' id="user_id" name="user_id" value="${user_id}"/>
				<div class='col-8 text-start'>
					<h2>게시판 목록</h2>
				</div>
				<div class='col-4 text-end'>
					<button type="button" class="write btn btn-primary">글쓰기</button>	
				</div>
				<table class="table table-hover text-center" style="border: solid;">
					<thead>
    					<tr class="table-primary">
      						<th>글번호</th>
      						<th>카테고리</th>
      						<th>제목</th>
      						<th>닉네임</th>
      						<th>작성일자</th>
    					</tr>
	  				</thead>
  					<tbody>
  						<c:forEach items="${board}" var='i'>
    						<tr class="table-info">
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
	</div>
	<div class='paging col-12'>
		<div class='d-flex justify-content-center'>
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
</section>
<footer>
<jsp:include page="./footer.jsp"></jsp:include>
</footer>
</body>
</html>