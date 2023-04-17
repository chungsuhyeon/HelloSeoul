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
	$('#user').click(function(){
		$.ajax({
			type:'post',
			url:'/web/collectUser',
			dataType:'json',
			success: function(result){
				console.log(result);
			},
			error : function(er){
				alert("error!");
			}
		});
	});
	
	$('#board').click(function(){
		$.ajax({
			type:'post',
			url:'/web/collectBoard',
			dataType:'jason',
			success:function(result){
				
			},
			error : function(er){
				alert("error!");
			}
		});
	});
	
	$('planner').click(function(){
		$.ajax({
			type:'post',
			url:'/web/collectPlanner',
			dataType:'jason',
			success:function(result){
				
			},
			error : function(er){
				alert("error!");
			}
		});
	});
	
	$('#dbase').click(function(){
		$.ajax({
			type:'post',
			url:'/web/collectMaindb',
			dataType:'jason',
			success:function(result){
				
			},
			error : function(er){
				alert("error!");
			}
		});
	});
	
	$('#test').click(function(){
		$.ajax({
			type:'post',
			url:'/web/pagingtest',
			dataType:'text',
			success:function(result){
				alert(result);
			},
			error : function(er){
				alert("error!");
			}
		});
	});
		
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
<section class='container-fluid bg-dark'>
	<div class='row'>
		<div class='col-1'>
			<button type="button" class='btn btn-outline-primary'>Test</button>
			<button type="button" class='btn btn-outline-primary'>Test</button>
			<button type="button" class='btn btn-outline-primary'>Test</button>
			<button type="button" class='btn btn-outline-primary'>Test</button>
			<button type="button" class='btn btn-outline-primary'>Test</button>
			<button type="button" class='btn btn-outline-primary'>Test</button>
		</div>
	</div>
</section>
</body>
</html>