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
	<section class='section d-flex justify-content-center bg-info'>
		<div class='col-6 mt-4 mb-4'>
			<div class='infobar bg-light'>
			<c:forEach items="${info}" var="i">
				<div class='titlebar'>
					<input type="hidden" id='com_no' name='com_no' value='${i.com_no}'>
					<input type="hidden" id='user_id' name='user_id' value='${user_id}'>
					<input type="hidden" id='boarduser_id' name='boarduser_id' value='${i.user_id}'>
					<span>[
							<c:choose>
								<c:when test="${i.com_ctg eq 1}">1</c:when>
								<c:when test="${i.com_ctg eq 2}">2</c:when>
								<c:otherwise>3</c:otherwise>
							</c:choose>
							] ${i.com_title}
					</span>
					<br>
					<span>
						<img alt="user" src="/web/resources/final_style/img/icon/comuser.png"> ${i.user_nick}
						<img alt="reple" src="/web/resources/final_style/img/icon/reple.png"> ${i.reply}
						<img alt="hit" src="/web/resources/final_style/img/icon/hit.png"> ${i.com_hit}
						<img alt="regdate" src="/web/resources/final_style/img/icon/regdate.png"> ${i.com_regdate}
						<img alt="comgood" src="/web/resources/final_style/img/icon/comgood.png"> ${i.good}
						<img alt="combad" src="/web/resources/final_style/img/icon/combad.png"> ${i.bad}
					</span>
				</div>
				<div class='contentsbar' style="display: inline-flex; width: 100%;">
					<div class='textbar col-6'>
						${i.com_cont}
					</div>
					<div class='photobar col-6'>
						photoline
					</div>
				</div>
				<div class='setbar col-12' style="display: inline-flex;">
					<div class='backbar col-4'>
					go list
					</div>
					<div class='goodbad col-4'>
					img good ${i.good } img ${i.bad }
					</div>
					<div class='settingbar col-4' style="display: inline-flex;">
					<button type="button" class="btn btn-danger">Report</button>
					<button type="button" class="btn btn-primary">Modify</button>
					<button type="button" class="btn btn-primary">Delete</button>
					<img alt="reple" src="/web/resources/final_style/img/icon/replebt.png">
					<img alt="scrap" src="/web/resources/final_style/img/icon/scrapbt.png">
					</div>
				</div>
			</c:forEach>	
			</div>
			<div class='replebar'>
				
			</div>
		</div>
	</section>
	<footer>
	<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>