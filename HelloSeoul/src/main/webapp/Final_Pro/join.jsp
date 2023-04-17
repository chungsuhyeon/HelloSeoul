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
				   $("input[name='user_id2']").removeAttr("readonly");
				   $("input[name='user_id2']").val('');
				   $("input[name='user_id2']").focus();
			   }else{				   
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
	     				   data:{'id':user_id},
	     				   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	     				   dataType:'text',
	     				   success:function(result){
	     					  //console.log(result);
	     					  if(result=='true'){
	     						  alert("Disavailable");	     						 
	     						  $("input[name='user_id1']").val('');
	     						  $("input[name='user_id1']").focus();
	     					 }else{
	     						 alert("Available");	     						
	     						$("input[name='user_nick']").focus();
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
			       //alert(user_nick);
	 		       var pattern_nick = /^[a-zA-Z]{4,100}$/i; 	 		           
			       if(user_nick.match(pattern_nick)==null){
			    	   alert("Please enter 4 characters or more");
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
// 		 					  console.log(data);
		 					  if(data=='true'){	
		 						  alert("Disavailable");		 						  
		 						  $("input#user_nick").val('');
		 						  $("input#user_nick").focus();
		 					 }else{
		 						 alert("Available");		 						 
		 						$("input#user_pw").focus();
		 					 }
		 				   },
		 				   error:function(){
		 					   alert('error');
		 				   }
	 				   });	        	    
	 	        	  }
 	  	          }); // nickname 형식 및 중복체크-end    		       
			        

 // password 네자이상 
  			 $("input[name='user_pw2']").focus(function(){  	  					 
 	  			        if($("input[name='user_pw']").val().length<4){
 	  			        	alert("Please set it to 4 characters or more");	 
                            $("input[name='user_pw']").val('');
                            $("input[name='user_pw']").focus(); 		          
                           } 
 	  			   });// password 네자이상 -end 
 	  			   

  	//password 입력값 동일여부 확인  
	  			   $("input[name='user_pw2']").blur(function(){ 
	  					 
	  			        
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
	  			   });	//password 입력값 동일여부 확인       
	       
    
  // 국적선택(대륙선택 후 국가선택)    
				     $("select#continent").change(function(){
				    	 let user_continent = $("select[name='continent']").val() 
				    	 //alert(user_continent);
				      	   $.ajax({
				    	    	  url:'/web/ajaxcontinent',
				    	    	  type:'POST',
				    	    	  data:{id:user_continent},
				    	    	  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				    	    	  dataType:'json',
				    	    	  success:function(result){  

				   	    		  $(result).each(function(idx, list){
// 				    	    			  console.log(list['COUNTRY_NAME']);
// 				    	    			  console.log(list['COUNTRY_NO']);
				    	    			  var myNationName = list['COUNTRY_NAME'];
				       	    		      var myNationNo = list['COUNTRY_NO'];       	    	         	    		        	        
				      	    	          $("select#country_no").append('<option value='+ myNationNo+'>'+ myNationName+ '</option>');
				   	    		  });
				    	    	  },//success
				    	    	  error:function(){
					   				 alert('error');
					   			  }	//error
				    	    	 
				    	         });//ajax      
				          });//function   
				          
				   $("select#country_no").blur(function(){
					  console.log($("select#country_no").val()); 
				   });
    

   // 가입정보 저장, 공백체크  	   
				   $("button#save").click(function(){ //값 유무 확인					   
					   $("input[name='user_id']").val($("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val());
				   
				       if($("input[name='user_nick']").val()==""){ //닉네임 
				    	   alert("Please enter your Nick name");
				    	  $("input[name='user_nick']").focus();
				    	   exit;
				       }				   
				   
				       if($("select[name='country_no']").val()==null){ //국적 
				    	   alert("Please enter your Nationality");
				    	  $("select[name='continent']").focus();
				    	   exit;
				       }
				       if($("input[name='user_birth']").val()==""){  //생일 
				    	   alert("Please enter your Birthday");
				    	   $("input[name='user_birth']").focus();
				    	   exit;
				       }
				       if($("select[name='user_pp']").val()=="0"){  //여행목적
				    	   alert("Please enter your Travel Purposey");
				    	   $("select[name='user_pp']").focus();
				    	   exit;
				       }
				       if($("select[name='user_first']").val()=="0"){ //여행우선순우
				    	   alert("Please enter your Travel Priority");
				    	   $("select[name='user_first']").focus();
				    	   exit;
				       }				    	   

				       $("form[name='joinFrm']").submit(); 
				       alert("success");
				   
				   }); //가입정보 저장, 공백체크 -end
				

				   
      });// 전체함수-end
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">
<style type="text/css">

</style>
<!-- Style Section End -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class='container d-flex justify-content-center'>
<form action="/web/joinMemberInsert" name="joinFrm" method="post">
	<table class="table">
			<thead>
				<tr>
					<th><h2>JOIN</h2></th>
				</tr>
			</thead>
		<tbody>
		
			<tr>
				<td>
					<label for="user_id_first" class="form-label mt-1">ID</label>
					<div class="col-auto d-flex">
						<input type="text" class="form-control w-25" name="user_id1" placeholder="jason1234">
						<p>@</p>
						<input type="text" class="form-control w-25" name="user_id2" placeholder="enter domain" readonly="readonly">
							<select class="form-select w-25" name="user_id3">
								<option value="direct">select</option>
								<option value="direct">direct</option>
								 <option value="naver.com">naver.com</option>
								 <option value="daum.net">daum.net</option>
								 <option value="bit.com">bit.com</option>
								 <option value="gmail.com">gmail.com</option>  
								 <option value="yahoo.com">yahoo.com</option> 	
								 <option value="aol.com">aol.com</option>
							</select>
						<input type="hidden" class="form-control" name="user_id" id="inputDefault">	
						<button type="button" class="btn btn-primary mx-2" id="check">Check-ID<span id="sid"></span></button>						
					</div>
    				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    			</td>
			</tr>
			<tr>
				<td>
					<label for="user_nick" class="form-label mt-1">Nick Name</label>
						<div class="col-auto d-flex">
							<input type="text" class="form-control w-50" name="user_nick" id="user_nick" placeholder="MrJason">
								<button  type="button" class="btn btn-primary mx-2" id="userNick">Check-Nick<span id="nick"></span></button>						
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_password1" class="form-label mt-1">Password</label>
						<div class="col-auto d-flex">
							<input type="password" class="form-control w-50" name="user_pw" id="user_pw">					
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_password2" class="form-label mt-1">Confirm Password</label>
						<div class="col-auto d-flex">
							<input type="password" class="form-control w-50" name="user_pw2">					
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="country_no" class="form-label mt-1">Nation</label>
						<div class="col-auto d-flex">
							<select class="form-select w-25" name="continent" id="continent">
								     <option selected="selected">select</option>
								     <option value="Asia" >Asia</option>
									 <option value="Europe">Europe</option>
									 <option value="Africa" >Africa</option>
									 <option value="North America">North America</option>
									 <option value="South America">South America</option>
									 <option value="Oceania">Oceania</option>
							</select>
							<select class="form-select w-25 mx-4" name="country_no" id="country_no" >
	 						</select>
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_birth" class="form-label mt-1">Birth</label>
						<input type="date" class="form-control w-25" name="user_birth" id="user_birth">
				</td>
			</tr>
			<tr>
				<td>
					<fieldset class="form-group" >
						<legend class="mt-1" style="font-size:16px;">Gender</legend>
							<div class="d-flex">						
								<div class="form-cehck">
									<label for="male"><input type="radio" class="form-check-input" checked="checked"  name="user_gender"  value="1">male</label>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
								 <div class="form-cehck">
									<label for="female"><input type="radio" class="form-check-input" id="woman" name="user_gender" value="2">female</label>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="form-cehck">
									<label for="secret"><input type="radio" class="form-check-input" id="secret" name="user_gender"  value="3">secret</label>
								</div>
							</div>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_purpose" class="form-label mt-1">Purpose</label>
						<div class="col-auto">
							<select class="form-select w-50" name="user_pp">							
								  <option selected="selected" value="0">Select</option>
								  <option value="1">travel</option>
								  <option value="2">business trip</option>
								  <option value="3">study</option>
								  <option value="4">etc</option>
							</select>
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<label for="user_priority" class="form-label mt-1">Priority</label>
						<div class="col-auto">
							<select class="form-select w-50" name="user_first" id="inputDefault">							
								  <option selected="selected" value="0">Select</option>
								  <option value="1">food</option>
								  <option value="2">tour</option>	
								  <option value="3">entertainment</option>
								  <option value="4">etc</option>
							</select>
						</div>
				</td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-primary w-100" id="save" type="button">Join Up</button>
				</td>
			</tr>
			
		</tbody>

	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>