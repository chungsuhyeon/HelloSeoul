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
	

    // email 형식 및 중복체크
	           $("button#check").click(function(){ 	        	   
 	        	   let user_id =$("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val(); 	        	 
 	        	   var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; ///^[0-9a-zA-Z]/: 이메일 주소의 첫 글자는 숫자나 알파벳으로 시작, /i : 대소문자 구분X
 	        	   //alert(user_id.match(pattern));	 		       
	        	   if(user_id.match(pattern)==null){
	        		   alert("Please enter in the correct format \n ex)seoul@gmail.com");
	        		   $("input[name='user_id1']").val('');
	        		   $("input[name='user_id1']").focus();
	        		   $("input[name='user_id2']").val('');        		   
	        	   }
	        	   else{
	     		       $.ajax({
	     				   url:'/web/ajaxFindID',
	     				   type:'POST',	
	     				   data:{id:user_id},
	     				   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	     				   dataType:'text',
	     				   success:function(result){
	     					  // console.log(result);
	     					  if(result=='true'){
	     						  $("span#sid").html("<br><font color='red'>Disavailable</font>");
	     						  $("input[name='user_id1']").val('');
	     						  $("input[name='user_id1']").focus();
	     					 }else{
	     						 $("span#sid").html("<br><font color='white'>Available</font>")
	     					 }
	     				   },
	     				   error:function(){
	     					   alert('error');
	     				   }			   
	     				 });	        	    
	        	   } 
	        	 }); //email 형식 및 중복체크-end	 		   
	
    
    // nickname 형식 및 중복체크 
		           $("button#userNick").click(function(){	         		     
			       let user_nick =$("input[name='user_nick']").val();	
			       alert(user_nick);
	 		       var pattern_nick = /^[a-zA-Z]{2,6}$/i; 	 		           
			       if(user_nick.match(pattern_nick)==null){
			    	   alert("6글자이하로");
			    	   $("input[name='user_nick']").focus();
	        		   $("input[name='user_nick']").val('');
			       }
			       else{	 		          
		 		       $.ajax({
		 				   url:'/web/checkUsernick',
		 				   type:'POST',	
		 				   data:{nickname:user_nick},
		 				   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		 				   dataType:'text',
		 				   success:function(data){
		 					  //console.log(data);
		 					  if(data=='true'){
		 						  $("span#nick").html("<br><font color='red'>Disavailable★</font>");
		 						  $("input#user_nick").val('');
		 						  $("input#user_nick").focus();
		 					 }else{
		 						 $("span#nick").html("<br><font color='white'>Available★</font>")
		 					 }
		 				   },
		 				   error:function(){
		 					   alert('error');
		 				   }
	 				   });	        	    
	 	        	  }
 	  	          }); // nickname 형식 및 중복체크-end    
		       
		       
  			        
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
	  			        	alert("Please Check Password");
	  			        } 
	  			   });	//password 입력값1,2같은지 확인 
	       
	     
	       
    
    

				

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
			<form action="/web/joinMemberInsert" name="joinFrm" method="post">
				<div class="form-group"> 					
	  				
	  						
	  					  					
  					<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Email</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input style="width: 400px;" type="text" class="form-control" placeholder="Email" name="user_nick"  id="user_nick">&nbsp;&nbsp;&nbsp;&nbsp;
				  					<div class="d-grid gap-2">
				  						<button style="height:35px;width: 150px;" class="btn btn-lg btn-primary mt-2" id="userNick" type="button">Email-Check<span id="nick"></span></button>
				  					</div>			  					
			  				</div>
	  					</div>
	  					
	  				<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Password</label>
  						<div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password" name="user_pw" placeholder="Password" class="form-control" id="user_pw">
  						    </div>
  						</div>
  					<label class="col-form-label mt-4" for="inputDefault">&nbsp;&nbsp;Confirm password</label>
  						 <div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password"  placeholder="Confirm password"  name="user_pw2"   class="form-control" id="inputDefault">  						  
  						    </div>
  						</div>  				
  					
	  					
	  			    	<div class="find-btn" >	  					            						     
  					              <button class="btn btn-lg btn-primary mt-2" type="button" id="save" style="width: 300px;">Password Reset </button>
  					    </div>					
                </form>
		</div>
	</section>
</body>
</html>