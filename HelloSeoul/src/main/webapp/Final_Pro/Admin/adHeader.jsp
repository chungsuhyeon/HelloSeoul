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
<title>AdminPage</title>
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
.managebox>a{
color: black;
font-size: 20px;
text-decoration: none;
}

</style>
<!-- Style Section End -->
</head>
<header class='container'>
	<div class='row'>
		<div class='logobox col-4'>
			 <a href="/web/Final_Pro/Admin/AdminPage.jsp">
				<img alt="logo" src="/web/resources/final_style/img/Logo.png" style="width: 100%;">
			</a>
		</div>
		<div class='managebox col-8 mt-4 text-center'>
			<a href="/web/gotoUserMg">UserManagement</a>
			&nbsp;&nbsp;&nbsp;&nbsp;				
			<a href="/web/Final_Pro/Admin/ComMg.jsp">CommunityManagement</a>
			&nbsp;&nbsp;&nbsp;&nbsp;				
			<a href="/web/Final_Pro/Admin/LocMg.jsp">LocationManagement</a>				
		</div>
	</div>
	<hr class='hr'>
</header>
</html>