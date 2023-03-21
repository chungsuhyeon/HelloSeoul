<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 

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

});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">

</style>
<!-- Style Section End -->


</head>
<footer class='footer container-fluid bg-primary' style="display: inline-flex; height: 100px;">
	<div class='col-4'>
	</div>
	<div class='iconbar col-4 mt-4' style="display: inline-flex;">
		<div class='d-flex justify-content-center w-100'>
			<a href="/web/Final_Pro/index.jsp"><img alt="" src="/web/resources/final_style/img/icon/home.png"></a>
			<a href="#"><img alt="" src="/web/resources/final_style/img/icon/up-arrow.png" style="margin-left: 50px; margin-right: 50px;"></a>
			<c:choose>
				<c:when test="${user_id eq null}">
					<a href="/web/Final_Pro/join.jsp"><img alt="" src="/web/resources/final_style/img/icon/add-user.png"></a>
				</c:when>
				<c:otherwise>
					<a href="/web/myPageLoad"><img alt="" src="/web/resources/final_style/img/icon/user.png"></a>
				<a href="/web/Final_Pro/join.jsp"><img alt="" src="/web/resources/final_style/img/icon/add-user.png"></a>
				<a href="/web/myPageLoad"><img alt="" src="/web/resources/final_style/img/icon/user.png"></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class='col-4'>
	</div>
</footer>
</html>