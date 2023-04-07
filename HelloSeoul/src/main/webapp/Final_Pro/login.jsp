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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("button").click(function(){
		if(($(this).attr('id'))=='login'){
			if($("input#inputID").val().length==0 || $("input#inputPassword").val().length==0){
	   	        alert('id or password check');
	   	    	$("input#inputID").val('');
	   	    	$("input#inputPassword").val('');
	   	    	$("input#inputID").focus();
	   	    	return false;
	   	    }
	   		$("form").submit();
		}
		else if(($(this).attr('id'))=='join'){
			document.location.href ="/web/Final_Pro/join.jsp";
		}
		else if(($(this).attr('id'))=='findPw'){
			document.location.href ="/web/Final_Pro/joinCheck.jsp";
		}
	});
});
</script>
<!--JS Section End -->
<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
h4{
	color: white;
}
</style>
<!-- Style Section End -->


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class='container'>
	<div class='row d-flex justify-content-center'>
		<div class='col-3 bg-primary mt-5 rounded'>
			<div class="loginBox row mt-1 mx-1">
				<h4>ID</h4>
				<input class="form-control form-control-lg" type="text" placeholder="ID" id="inputID" name="user_id" style="width: 300px;">
				<h4>Password</h4>
				<input class="form-control form-control-lg" type="password" placeholder="Password" id="inputPassword" name="password" style="width: 300px;">
			</div>
			<hr class="hr">
			<div class="buttonBox d-flex justify-content-around mb-2">
				<button type="submit" class="btn btn-info" id="login">Login</button>
				<button type="button" class="btn btn-success" id="join">Join</button>
				<button type="button" class="btn btn-danger" id="findPw">FindID</a></button>
			</div>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>