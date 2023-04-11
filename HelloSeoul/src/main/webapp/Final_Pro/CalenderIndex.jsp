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
<title>Hello, Seoul!</title>
<!--JS Section Begin -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : 'http://http://127.0.0.1:5000/',
		data : {data:"testing connect"},
		dataType : 'text',
		success : function(r){
			console.log(r);
		},
		error : function(x){
			alert("Error!");
		}
		
	});
		
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<style type="text/css">

</style>
<!-- Style Section End -->


</head>
<body>
 
</body>
</html>