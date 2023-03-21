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
	   // 아이디(이메일)등록
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
	   });  // 아이디(이메일)등록



           // 아이디 중복체크 
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
					  $("span#sid").html("<font color='white'> email 중복입니다</font>");
					  $("input[name='user_id1']").val('');
					  $("input[name='user_id1']").focus();
				 }else{
					 $("span#sid").html("<font color='white'>email 사용<br>가능합니다</font>")
				 }
			   },
			   error:function(){
				   alert('error');
			   }			   
		   }); 
    }); // 아이디 중복체크
    /* ========================================================================================================*/      
     $("select#continent").change(function(){
    	 //alert('test');
     	 alert($("select[name='continent']").val())
    	 let user_continent = $("select[name='continent']").val() 
      	   $.ajax({
    	    	  url:'/web/ajaxcontinent',
    	    	  type:'POST',
    	    	  data:{id:user_continent},
    	    	  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
    	    	  dataType:'text',
    	    	  success:function(result){
    	    		 alert(result);
<<<<<<< HEAD
    	    		     	    		  
    	    	  }    	    	    	 
    	    	 
    	         });  
    	        
    	 
     });  
=======
    	    		  //$(result).each(function(idx, list){
    	    		  //	 console.log(list); 
    	    		 for(let i =0; i < list(result).length; i++){
    	    			 alert(result[i]);
    	    		 } //for   
    	    		 
    	    	  },//success
    	    	  
    	    	  error:function(){
	   				 alert('error');
	   			  }	//error
    	    	 
    	         });//ajax      
     });//function     
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
    
<<<<<<< HEAD
    
=======
>>>>>>> branch 'subMain' of https://github.com/chungsuhyeon/HelloSeoul.git
     /* ========================================================================================================*/     

 	   // 국적입력하면 전화번호에 국가번호 입력, 포커스 다음칸으로 
		$("select[name='user_nation']").change(function(){
	 		$("input[name='user_tel1']").val($("select[name='user_nation']").val());
	 		$("input[name='user_tel2']").focus();
	 		$("input[name='user_tel1']").attr("disabled",true);
	 		//alert($("select[name='user_nation1']").val());		
    	}); //국적,국가번호 입력 
	
	  
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
<!-- Style Section End -->


</head>
<body>
	<header>
	<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section class=bg-light>
		<div class='container bg-dark' style="width: 800px; margin-top: 20px; border-radius: 30px;">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  JOIN PAGE</h2>
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
						                 <option selected="selected" value="direct">직접입력</option>
										 <option value="naver.com">naver.com</option>
										 <option value="daum.net">daum.net</option>
										 <option value="bit.com">bit.com</option>
										 <option value="gmail.com">gmail.com</option>  
										 <option value="yahoo.com">yahoo.com</option> 	
										 <option value="aol.com">aol.com</option>
										 
								<input type="hidden" class="form-control" name="user_id" id="inputDefault">	&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="d-grid gap-2">
  										<button style="height:35px;width: 150px;" class="btn btn-lg btn-primary mt-2" id="check" type="button">중복체크<span id="sid"></</span></button>
  									</div>
			  				</div>
	  					</div>
	  					  					
  					<label class="col-form-label mt-4" for="inputDefault">Nick Name</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input style="width: 400px;" type="text" class="form-control" placeholder="Nick Name" name="user_nick"  id="inputDefault">			  					
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
  					
  					<label class="col-form-label mt-4" for="inputDefault">Name</label>
	  					<div>
		  				   	<div class="form-group" style="display: inline-flex;">
			  					<input type="text" class="form-control" name="user_name1" placeholder="First Name" id="inputDefault">
			  					&nbsp;&nbsp;&nbsp;&nbsp;
			  					<input type="text" class="form-control" name="user_name2" placeholder="Last Name" id="inputDefault">
			  					<input type="hidden" class="form-control" name="user_name" id="user_name">
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
                                    <select class="form-select" name="user_nation" id="inputDefault">
						                 <option selected="selected">Nation</option>
										 <option value="1" type="text" id="미국">미국</option>
										 <option value="7">러시아</option>
										 <option value="33" type="text" id="프랑스">프랑스</option>
										 <option value="34">스페인</option>
										 <option value="44">영국</option>
										 <option value="49">독일</option>										
									</select> 									 
			  				</span>
	  					</div>
  					<label for="exampleSelect1" class="form-label mt-4">TelePhone</label><br>
	  					<div class="form-group" style="display: inline-flex;">
		  					<input style="width: 150px;" type="text" class="form-control" name="user_tel1" placeholder="Country Number" id="inputDefault">
		  						<h4>&nbsp;&nbsp;-&nbsp;&nbsp;</h4>
		      				<input style="width: 150px;" type="text" class="form-control" name="user_tel2" placeholder="First Number" id="inputDefault">
		      					<h4>&nbsp;&nbsp;-&nbsp;&nbsp;</h4>
		  					<input style="width: 150px;" type="text" class="form-control" name="user_tel3" placeholder="Middle Number" id="inputDefault">
		  						<h4>&nbsp;&nbsp;-&nbsp;&nbsp;</h4>
		  					<input style="width: 150px;" type="text" class="form-control" name="user_tel4" placeholder="Back Number" id="inputDefault">
		  				    <input type="hidden" class="form-control" name="user_tel" placeholder="Back Number" id="inputDefault">
	    				</div>
	    				<br>

  					<label class="col-form-label mt-4" for="inputDefault">Birth</label>
  						<input style="width: 450px;" name="user_birth" type="date" class="form-control">
  					<!-- <fieldset class="form-group"> -->
  					
  					<label class="col-form-label mt-4" for="inputDefault">Gender</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_gender" id="inputDefault">
						              <option selected="selected">성별</option>
									  <option value="1">남자</option>
									  <option value="2">여자</option>
								</select>		  									  
			  				</div>
	  					</div>
  					<label class="col-form-label mt-4" for="inputDefault">Purpose</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_pp" id="inputDefault">
						              <option selected="selected">목적</option>
									  <option value="1">관광</option>
									  <option value="2">업무</option>
									  <option value="3">학업</option>
									  <option value="4">기타</option>
								 </select>		  									  
			  				</div>
	  					</div>
	  					<label class="col-form-label mt-4" for="inputDefault">First</label>
  						<div>
		  				   	<div style="width: 400px;" class="form-group" style="display: inline-flex;">
  			  				      <select class="form-select" name="user_first" id="inputDefault">
						              <option selected="selected">우선순위</option>
									  <option value="1">쇼핑</option>
									  <option value="2">관광</option>	
									  <option value="3">행사참여</option>
									  <option value="4">기타</option>
								 </select>		  								  
			  				</div>
	  					</div>
	  					<br>		
  				<div class="d-grid gap-2">
  					<button class="btn btn-lg btn-primary mt-2" type="button" id="save">Join Button</button>
  				</div>
			</form>
		</div>
	</section>
</body>
</html>