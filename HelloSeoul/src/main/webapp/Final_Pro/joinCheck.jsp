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
	// email 등록
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
	 		  }); // email 등록-end
	 		  
// 가입아이디 체크  
			$("button#user_id").click(function(){
				 var pattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/i;
				 let user_id = $("input[name='user_id']").val();
				 //alert(user_id.match(pattern));
				 
				 if(user_id.match(pattern)==null){
					 alert("Please enter your registered Email \n ex) seoul@gmail.com");
					 $("input[name='user_id']").val('');
					 $("input[name='user_id']").focus();
				 }
				 else{
				       $.ajax({
		 				   url:'/web/ajaxFindID',
		 				   type:'POST',	
		 				   data:{id:user_id},
		 				   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		 				   dataType:'text',
		 				   success:function(result){
		 					   console.log(result);
		    					  if(result=='false'){
			                          alert("Please enter a correct email address"); 						  
		 					     	  $("input[name='user_id']").val('');
		 					     	  $("input[name='user_id']").focus();
		    					 }else{
		    						 alert("Please enter a new password");    						 
		    						 $("input[name='user_id']").attr("readonly",true); 						 
		    					 }
		    					}			   
		 				 });	        	    
		    	   } 
			}); // 가입아이디 체크-end
	 		  

  			        
  	// password 네자이상 
				 $("input[name='user_pw']").blur(function(){ 
	  					 // console.log('blur'); 
	  			        if($("input[name='user_pw']").val().length>=4){
	  			        	
	  			        }else{ 
	  			        	alert("Please set it to 4 characters or more");	 
                            $("input[name='user_pw']").val('');	         	
 	  			        	setTimeout(function(){
 	  			        		$("input[name='user_pw']").focus();
 	  			             }, 1);
	  			        } 
	  			   });// password 네자이상 -end
	       
 	                	

  	//password 입력값1,2같은지 확인 
	  			   $("input[name='user_pw2']").blur(function(){ //포커스가 다른곳으로 가면 콘솔창에서 blur가 나온다 
	  					 // console.log('blur'); 
	  			        
	  			        if($("input[name='user_pw']").val()==$("input[name='user_pw2']").val()){	
	  			        	$("input[name='user_pw']").val();
	  			        }else{
	  			        	$("input[name='user_pw']").val('');
	  			        	$("input[name='user_pw2']").val('');
	  			        	setTimeout(function(){
 	  			        		$("input[name='user_pw']").focus();
 	  			             }, 1);
	  			        	alert("The entered password is different.\n Please Check Password");
	  			        } 
	  			   });	//password 입력값1,2같은지 확인 
	  			   
	  //password 수정(update)     
	     $("button#user_pw").click(function(){	    	 
	     
	    	 if($("input[name='user_id']").val()==""){ //Email adress
		    	   alert("Please enter your Email");
		    	  $("input[name='user_id']").focus();
		    	   exit;
		       }				   
		   
		       if($("select[name='user_pw']").val()==""){ //new password
		    	   alert("Please enter your Password");
		    	  $("select[name='user_pw']").focus();
		    	   exit;
		       } 
		       $("form[name='joinpw']").submit(); 		       

				if(($(this).attr('id'))=='user_pw'){  //페이지 이동 
					document.location.href ="/web/Final_Pro/login.jsp";
				}

	      });
	  			   
      });// 전체함수-end
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">
.form-control {
	width: 40%;
}
</style>


<!-- check,join button style -->
<style>
.find-btn{
	text-align: center;
}
.btn-primary mt-2{
	display :inline-block;
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
			<h2 align="center">Find Password</h2>
			<form action="/web/joinPwUpdate" name="joinpw" method="post">
				<div class="form-group"> 	
  					<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Email</label>
	  				    	<div>
		  				    	<div class="form-group" style="display: inline-flex;">
			  						<input style="width: 400px;" type="text" class="form-control" placeholder="Please enter your registered Email" name="user_id"  id="user_id">&nbsp;&nbsp;&nbsp;&nbsp;
					  					<div class="d-grid gap-2">
					  						<button style="height:35px;width: 150px;" class="btn btn-lg btn-primary mt-2" id="user_id" type="button">Email-Check<span id="user_id"></span></button>
					  					</div>			  					
			  			    	</div>
	  				    	</div>
	  					<br>
  						<br>
	  					
	  				<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Password</label>
  						<div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password" name="user_pw" placeholder="Password" class="form-control" id="user_pw">
  						    </div>
  						</div>
  					<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Confirm password</label>
  						  <div>
  						      <div class="form-group" style="display: inline-flex;">
  						  	     <input style="width: 400px;" type="password"  placeholder="Confirm password"  name="user_pw2"   class="form-control" id="inputDefault">&nbsp;&nbsp;&nbsp;&nbsp; 
  						  	   	   	<div class="form-group" style="display: inline-flex;">			  					
					  					<button style="height:35px;width: 180px;" class="btn btn-lg btn-primary mt-2" id="user_pw" type="button">Password Reset<span id="user_pw"></span></button>
					  				 </div>  						  
  						      </div>
  						  </div> 
  					    	<br>
  					    	<br> 
                </form>
		</div>
	</section>
</body>
</html>