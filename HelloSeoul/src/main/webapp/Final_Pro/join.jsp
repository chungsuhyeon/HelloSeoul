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
	
	   $("select[name='user_id3']").change(function(){
		   if($(this).val()=='direct'){
			   //$("input[name='user_id2']").attr("disabled",false);
			   //$("input[name='user_id2']").attr("readonly",false);
			   $("input[name='user_id2']").removeAttr("readonly");
			   $("input[name='user_id2']").val('');
			   $("input[name='user_id2']").focus();
		   }else{
			   //$("input[name='user_id2']").attr("disabled",true);
			   $("input[name='user_id2']").attr("readonly",true);
			   $("input[name='user_id2']").val( $("select[name='user_id3']").val());
		   }			   
	   }); /// 아이디등록

	   // 국적입력하면 전화번호에 국가번호 입력, 포커스 다음칸으로 
		$("select[name='user_nation1']").change(function(){
	 		$("input[name='user_tel1']").val($("select[name='user_nation1']").val());
	 		$("input[name='user_tel2']").focus();
	 		$("input[name='user_tel1']").attr("disabled",true);
	 		//alert($("select[name='user_nation1']").val());
		
    	}); //국적,국가번호 입력
	
	
	

});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.form-control {
	width: 40%;
}
</style>
<!-- Style Section End -->


</head>
<body>
	<header>
	<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section class=bg-light>
		<div class='container bg-dark' style="width: 800px; margin-top: 20px; border-radius: 30px;">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  JOIN PAGE</h2>
			<form action="">
				<div class="form-group">
  					<label class="col-form-label mt-4" for="inputDefault">ID</label>
  						<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input type="text" class="form-control" placeholder="abcde" name="user_id1" id="inputDefault">&nbsp;<font size ="5"> @</font>
			  					&nbsp;&nbsp;&nbsp;&nbsp;
			  				    <input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault">
			  				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
			  				         <select class="form-select" name="user_id3" id="inputDefault">
						                 <option selected="selected" value="direct">직접입력</option>
										 <option value="naver.com">naver.com</option>
										 <option value="daum.net">daum.net</option>
										 <option value="bit.com">bit.com</option>
										 <option value="gmail.com">gmail.com</option>  
										 <option value="yahoo.com">yahoo.com</option> 	
										 <option value="aol.com">aol.com</option>
								<input type="hidden" class="form-control" name="user_id" id="inputDefault">		 
			  				</div>
	  					</div>
	  					  					
  					<label class="col-form-label mt-4" for="inputDefault">Nick Name</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input style="width: 400px;" type="text" class="form-control" placeholder="Nick Name" id="inputDefault">			  					
			  				</div>
	  					</div>
	  					
	  				<label class="col-form-label mt-4" for="inputDefault">Password</label>
  						<div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password" class="form-control" id="inputDefault">
  						    </div>
  						</div>
  					<label class="col-form-label mt-4" for="inputDefault">Confirm password</label>
  						 <div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password" class="form-control" id="inputDefault">
  						    </div>
  						</div> 	  					
  					
  					<label class="col-form-label mt-4" for="inputDefault">Name</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input type="text" class="form-control" name="user_name1" placeholder="First Name" id="inputDefault">
			  					&nbsp;&nbsp;&nbsp;&nbsp;
			  					<input type="text" class="form-control" name="user_name2" placeholder="Last Name" id="inputDefault">
			  					<input type="hidden" class="form-control" name="user_name" id="inputDefault">
		  					</div>
	  					</div>
	  					
	  					
	  					
	  					
  					<label class="col-form-label mt-4" for="inputDefault">Nation</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				         <select class="form-select" name="user_nation1" id="inputDefault">
						                 <option selected="selected">사는국가</option>
										 <option value="1">미국</option>
										 <option value="7">러시아</option>
										 <option value="33">프랑스</option>
										 <option value="34">스페인</option>
										 <option value="44">영국</option>
										 <option value="49">독일</option>
										 <option value="61">호주</option>
										 <option value="63">필리핀</option>
										 <option value="64">뉴질랜드</option>
										 <option value="65">싱가포르</option>
										 <option value="66">태국</option>
										 <option value="81">일본</option>
										 <option value="82">대한민국</option>
										 <option value="84">베트남</option>
										 <option value="86">중국</option>
										 <option value="852">홍콩</option>
										 <option value="886">대만</option>
										 <option value="91">인도</option>
										 <option value="971">아랍에미리트</option>
								<input type="hidden" class="form-control" name="user_id" id="inputDefault">		 
			  				</div>
	  					</div>
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
  					
      				<label for="exampleSelect1" class="form-label mt-4">TelePhone</label><br>
  					<div class="form-group" style="display: inline-flex;">
  					<input type="text" name="">
      					//<select class="form-select" id="exampleSelect1">
        					<option>1</option>
        					<option>2</option>
        					<option>3</option>
        					<option>4</option>
        					<option>5</option>
      					</select>
      					<h4>&nbsp;&nbsp;-&nbsp;&nbsp;</h4>
  						<input type="text" class="form-control" placeholder="Middle Number" id="inputDefault">
  						<h4>&nbsp;&nbsp;-&nbsp;&nbsp;</h4>
  						<input type="text" class="form-control" placeholder="Back Number" id="inputDefault">
    				</div>
    				<br>
  					<label class="col-form-label mt-4" for="inputDefault">Birth</label>
  					<input type="date" class="form-control">
  					<fieldset class="form-group">
      					<legend class="mt-4">Gender</legend>
      					<div style="display:inline-flex;">
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
        					<label class="form-check-label" for="optionsRadios1">Male</label>&nbsp;&nbsp;&nbsp;     					
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">Female</label>&nbsp;&nbsp;
      					</div>
      					</div>
    				</fieldset>
    				<fieldset class="form-group">
      					<legend class="mt-4">Purpose</legend>
      					<div style="display:inline-flex;">
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
        					<label class="form-check-label" for="optionsRadios1">관광</label>&nbsp;&nbsp;&nbsp;     					
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">업무</label>&nbsp;&nbsp;&nbsp;
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">학업</label>&nbsp;&nbsp;&nbsp;
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">기타</label>
      					</div>
      					
      					</div>
    				</fieldset>
					<fieldset class="form-group">
      					<legend class="mt-4">First</legend>
      					<div style="display:inline-flex;">
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
        					<label class="form-check-label" for="optionsRadios1">쇼핑</label>&nbsp; &nbsp;&nbsp;    					
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">휴식</label>&nbsp;&nbsp;&nbsp;
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
        					<label class="form-check-label" for="optionsRadios1">행사참여</label>&nbsp; &nbsp;&nbsp;    					
      					</div>
      					<div class="form-check">
        					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        					<label class="form-check-label" for="optionsRadios2">기타</label>&nbsp;&nbsp;&nbsp;
      					</div>
      					</div>
    				</fieldset>
				</div>
				<div class="d-grid gap-2">
  					<button class="btn btn-lg btn-primary mt-2" type="button">Block button</button>
  				</div>
			</form>
		</div>
	</section>
</body>
</html>