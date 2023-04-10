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
<title>Hello, Seoul</title>
<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	//email bgein
	$("select#user_id_third").change(function(){
		if($(this).val()=='direct'){
			$("#user_id_second").removeAttr("readonly")
			$("#user_id_second").val('');
			$("#user_id_second").focus();
		}
		else{
			$("#user_id_second").attr("readonly",true);
			$("#user_id_second").val($(this).val());	
		}
		
	});
	
	//email check
	$("#checkid").click(function(){
		let user_id = $("#user_id_first").val()+'@'+$("#user_id_second").val();
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; ///^[0-9a-zA-Z]/: 이메일 주소의 첫 글자는 숫자나 알파벳으로 시작, /i : 대소문자 구분X
		if(user_id.match(pattern)==null){
			alert("Please enter in the correct format \n ex)seoul@gmail.com");
			$("#user_id_first").val('');	
			$("#user_id_second").val('');
			$("#user_id_first").focus();
		}
		else{
		       $.ajax({
 				   url:'/web/ajaxFindID',
 				   type:'POST',	
 				   data:{id:user_id},
 				   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
 				   dataType:'text',
 				   success:function(result){
 					  if(result=='true'){
 						 alert("Disavailable");
 						  $("#user_id_first").val('');
 						  $("input#user_id_first").focus();
 					 }else{
 						alert("Available");
 					 }
 				   },
 				   error:function(){
 					   alert('');
 				   }			   
 				 });
			
		}
	});
	//nick check
	
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
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
<section class='container d-flex justify-content-center'>
	<table class="table w-50">
		<thead>
			<tr>
				<th>JOIN</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<label for="user_id_first" class="form-label mt-1">ID</label>
					<div class="col-auto d-flex">
						<input type="text" class="form-control w-25" id="user_id_first" placeholder="jason1234">
						<p>@</p>
						<input type="text" class="form-control w-25" id="user_id_second" placeholder="gamil.com" readonly="readonly">
						<select class="form-select w-25" id="user_id_third">
							<option selected="selected" value="nodata">Select</option>
							<option value="direct">Direct input</option>
							<option value="daum.net">daum.net</option>
							<option value="bit.com">bit.com</option>
							<option value="gmail.com">gmail.com</option>  
							<option value="yahoo.com">yahoo.com</option> 	
							<option value="aol.com">aol.com</option>
						</select>
						<button class="btn btn-primary mx-2" id="checkid">Check-ID</button>
					</div>
    				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    			</td>
			</tr>
			<tr>
				<td>
					<label for="user_nick" class="form-label mt-1">Nick Name</label>
					<div class="col-auto d-flex">
						<input type="text" class="form-control w-50" id="user_nick" placeholder="MrJason">
						<button class="btn btn-primary mx-2">Check-Nick</button>						
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_password1" class="form-label mt-1">Password</label>
					<div class="col-auto d-flex">
						<input type="password" class="form-control w-50" id="user_password1">					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_password2" class="form-label mt-1">Confirm Password</label>
					<div class="col-auto d-flex">
						<input type="password" class="form-control w-50" id="user_password2">					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_nation" class="form-label mt-1">Nation</label>
					<div class="col-auto d-flex">
						<select class="form-select w-25">
							<option selected="selected" value="nodata">Select</option>
							<option value="direct">Direct input</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="bit.com">bit.com</option>
							<option value="gmail.com">gmail.com</option>  
							<option value="yahoo.com">yahoo.com</option> 	
							<option value="aol.com">aol.com</option>
						</select>
						<select class="form-select w-25">
							<option selected="selected" value="direct">Direct input</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="bit.com">bit.com</option>
							<option value="gmail.com">gmail.com</option>  
							<option value="yahoo.com">yahoo.com</option> 	
							<option value="aol.com">aol.com</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_birth" class="form-label mt-1">Birth</label>
					<input type="date" class="form-control w-25" id="user_birth">
				</td>
			</tr>
			<tr>
				<td>
					<fieldset class="form-group">
						<legend class="mt-1">Gender</legend>
						<div class="d-flex">
							<div class="form-cehck">
								<input type="radio" class="form-check-input" id="man" name="optionsRadios">
								<label for="man" class="form-check-label">Man</label>
							</div>
							<div class="form-cehck">
								<input type="radio" class="form-check-input" id="woman" name="optionsRadios">
								<label for="woman" class="form-check-label">Woman</label>
							</div>
							<div class="form-cehck">
								<input type="radio" class="form-check-input" id="secret" name="optionsRadios">
								<label for="secret" class="form-check-label">Secret</label>
							</div>
						</div>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_purpose" class="form-label mt-1">Purpose</label>
					<div class="col-auto">
						<select class="form-select w-50">
							<option selected="selected" value="direct">Direct input</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="bit.com">bit.com</option>
							<option value="gmail.com">gmail.com</option>  
							<option value="yahoo.com">yahoo.com</option> 	
							<option value="aol.com">aol.com</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_priority" class="form-label mt-1">Priority</label>
					<div class="col-auto">
						<select class="form-select w-50">
							<option selected="selected" value="direct">Direct input</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="bit.com">bit.com</option>
							<option value="gmail.com">gmail.com</option>  
							<option value="yahoo.com">yahoo.com</option> 	
							<option value="aol.com">aol.com</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-primary w-100">Join Up</button>
				</td>
			</tr>
		</tbody>
	</table>
</section>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>