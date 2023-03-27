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
	 		  }); // email 등록



    // email 중복체크 
           $("button#check").click(function(){
         	 // alert('test');
	       //alert($("input[name='user_id']").val($("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val()));
	       alert($("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val());
	       let user_id =$("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val();	  
	       
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
 		   }); // email 중복체크
      
    
      // nick name  중복체크 
           $("button#userNick").click(function(){
         	  //alert('test');	      
	     
	       let user_nick =$("input[name='user_nick']").val();	  
	           alert($("input[name='user_nick']").val());
	       $.ajax({
			   url:'/web/checkUsernick',
			   type:'POST',	
			   data:{nickname:user_nick},
			   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			   dataType:'text',
			   success:function(result){
				  console.log(result);
				  if(result=='true'){
					  $("span#sid").html("<br><font color='red'>Disavailable★</font>");
					  $("input[name='user_nick']").val('');
					  $("input[name='user_nick']").focus();
				 }else{
					 $("span#sid").html("<br><font color='white'>Available★</font>")
				 }
			   },
			   error:function(){
				   alert('error');
			   }			   
		   }); 
       }); // nick name  중복체크  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     $("select#continent").change(function(){
    	 //alert('test');
//      	 alert($("select[name='continent']").val())
    	 let user_continent = $("select[name='continent']").val() 
      	   $.ajax({
    	    	  url:'/web/ajaxcontinent',
    	    	  type:'POST',
    	    	  data:{id:user_continent},
    	    	  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
    	    	  dataType:'json',
    	    	  success:function(result){  
//     	    		  console.log(result);
//      	    		  console.log(result.length);
   	    		  $(result).each(function(idx, list){
//     	    			  console.log(idx);
//     	    			  console.log(list);
    	    			  console.log(list['COUNTRY_NAME']);
    	    			  console.log(list['COUNTRY_NO']); 	    	
//     	    	     for(var i = 0 ;i<result.length ;i++){
    	    			  var myNationName = list['COUNTRY_NAME'];
       	    		      var myNationNo = list['COUNTRY_NO'];   
     	    	         	    		        	        
      	    	        	 $("select#user_nation").append('<option value='+ myNationNo+'>'+ myNationName+ '</option>');
//       	    	        }
   	    		  });
    	    	  },//success
    	    	  error:function(){
	   				 alert('error');
	   			  }	//error
    	    	 
    	         });//ajax      
          });//function     
    
     /* ========================================================================================================*/    
     
   
	

     

	  
    	//password 중복체크
		   $("input[name='user_pw2']").blur(function(){ //포커스가 다른곳으로 가면 콜솔창에서 blur가 나온다 
				 // console.log('blur'); 
		        if($("input[name='user_pw']").val()==$("input[name='user_pw2']").val() && $("input[name='user_pw']").val().length>0){
		        	
		        	$("input[name='user_pw']").val();
		        }else{
		        	$("input[name='user_pw']").val('');
		        	$("input[name='user_pw2']").val('');
		        	$("input[name='user_pw']").focus();
		        	alert("비밀번호를 확인하세요");
		        } 
		   });
  
		//입력정보 확인
    	$("button#total_check").click(function(){
			     window.open("/web/Final_Pro/joinCheck.jsp","확인","left=100,right= 200, top=200,width=400, height=400");

			});
    	
    	
		 // 가입정보 저장  	   
	   $("button#save").click(function(){ //값 유무 확인		   
		   $("input[name='user_id']").val($("input[name='user_id1']").val()+'@'+$("input[name='user_id2']").val());
		   $("input[name='user_name']").val($("input[name='user_name1']").val()+' '+$("input[name='user_name2']").val());	   
		   $("input[name='user_tel']").val($("input[name='user_tel1']").val()+'-'+$("input[name='user_tel2']").val()+'-'+$("input[name='user_tel3']").val()+'-'+$("input[name='user_tel4']").val());       
		   alert($("select[name='user_nation']").val());
		   
		   $("select[name='user_nation']").val();
		  //("select[name='user_nation']").val($("option[type='text']").attr("id"));
		
			
		   //$("option[name='user_nation']").attr();    
		   //alert($("option[type='text']").prop("id"));   	       
	       //alert($("input#user_name").val().length);
	       $("form[name='joinFrm']").submit(); 
	   
	   });


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
			<h2 align="center">JOIN PAGE</h2>
			<form action="/web/joinMemberInsert" name="joinFrm" method="post">
				<div class="form-group">
  					<label class="col-form-label mt-4" for="inputDefault">ID</label>
  						<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input type="text" class="form-control" placeholder="abcde" name="user_id1" id="inputDefault">&nbsp;<font size ="5"> @</font>
			  					&nbsp;&nbsp;&nbsp;&nbsp;
			  				    <input type="text" class="form-control" placeholder="gmail.com" name="user_id2" id="inputDefault">
			  				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
			  				         <select class="form-select" name="user_id3" id="inputDefault">
						                 <option selected="selected" value="direct">Direct input</option>
										 <option value="naver.com">naver.com</option>
										 <option value="daum.net">daum.net</option>
										 <option value="bit.com">bit.com</option>
										 <option value="gmail.com">gmail.com</option>  
										 <option value="yahoo.com">yahoo.com</option> 	
										 <option value="aol.com">aol.com</option>
										 
								<input type="hidden" class="form-control" name="user_id" id="inputDefault">	&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="d-grid gap-2">
  										<button style="height:35px;width: 150px;" class="btn btn-lg btn-primary mt-2" id="check" type="button">Email-Check<span id="sid"></span></button>
  									</div>
			  				</div>
	  					</div>
	  					  					
  					<label class="col-form-label mt-4" for="inputDefault">Nick Name</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input style="width: 400px;" type="text" class="form-control" placeholder="Nick Name" name="user_nick"  id="inputDefault">&nbsp;&nbsp;&nbsp;&nbsp;
				  					<div class="d-grid gap-2">
				  						<button style="height:35px;width: 150px;" class="btn btn-lg btn-primary mt-2" id="userNick" type="button">Nick-Check</button>
				  					</div>			  					
			  				</div>
	  					</div>
	  					
	  				<label class="col-form-label mt-4" for="inputDefault">Password</label>
  						<div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password" name="user_pw" class="form-control" id="inputDefault">
  						    </div>
  						</div>
  					<label class="col-form-label mt-4" for="inputDefault">Confirm password</label>
  						 <div>
  						    <div class="form-group" style="display: inline-flex;">
  						  	  <input style="width: 400px;" type="password"  name="user_pw2"   class="form-control" id="inputDefault">
  						  	<!--   <input style="width: 400px;" type="hidden" name="user_pw"  class="form-control" id="inputDefault"> -->
  						    </div>
  						</div> 	  					
  								

   				
  					<label class="col-form-label mt-4" for="inputDefault">Nation</label>
  						<div >
		  				   	<span  style="display: inline-flex;width: 180px;">
		   					       <select class="form-select" name="continent" id="continent">
						                 <option selected="selected">Continent</option>
										 <option value="Asia" >Asia</option>
										 <option value="Europe">Europe</option>
										 <option value="Africa" >Africa</option>
										 <option value="North America">North America</option>
										 <option value="South America">South America</option>
										 <option value="Oceania">Oceania</option>
								   </select>		 
							</span>	&nbsp;&nbsp;&nbsp;		 
							<span  style="display: inline-flex;width: 200px;">	 
                                    <select class="form-select" name="user_nation" id="user_nation">						                 
									</select> 									 
			  				</span>
	  					</div>  					

  					<label class="col-form-label mt-4" for="inputDefault">Birth</label>
  						<input style="width: 450px;" name="user_birth" type="date" class="form-control"  >
  					<!-- <fieldset class="form-group"> -->
  					
  					<label class="col-form-label mt-4" for="inputDefault">Gender</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_gender" id="inputDefault">
						              <option selected="selected">Gender</option>
									  <option value="1">male</option>
									  <option value="2">female</option>
								</select>		  									  
			  				</div>
	  					</div>
  					<label class="col-form-label mt-4" for="inputDefault">Purpose</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_pp" id="inputDefault">
						              <option selected="selected">Purpose</option>
									  <option value="1">travel</option>
									  <option value="2">business trip</option>
									  <option value="3">study</option>
									  <option value="4">etc</option>
								 </select>		  									  
			  				</div>
	  					</div>
	  					<label class="col-form-label mt-4" for="inputDefault">Priority</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_first" id="inputDefault">
						              <option selected="selected">Priority</option>
									  <option value="1">food</option>
									  <option value="2">tour</option>	
									  <option value="3">entertainment</option>
									  <option value="4">etc</option>
								 </select>		  								  
			  				</div>
	  					</div>				
	  					
	  					
	  			    	<div class="find-btn" >					  		 
	  					          <button class="btn btn-lg btn-primary mt-2" type="button" id="total_check">check</button>	
	  					          &nbsp;&nbsp;&nbsp;&nbsp;  						     
  					              <button class="btn btn-lg btn-primary mt-2" type="button" id="save"> join up</button>
  					    </div>					
                </form>
		</div>
	</section>
</body>
</html>