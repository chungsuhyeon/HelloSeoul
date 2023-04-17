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
	$('#file').change(function(){
		const fileDOM = document.querySelector('#file');
		const preview = document.querySelector('.photo');
		const imageSrc = URL.createObjectURL(fileDOM.files[0]);
		$('.photo img').attr('src',imageSrc);


	});
	
	
    $('#test').click(function() {
        var formData = new FormData();
        formData.append('file', $('input[type=file]')[0].files[0]);


        $.ajax({
            url: '/web/jsonParsing',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType : 'json',
            success: function(res) {
            	$('.photo h1').remove();
            	$('.photo h2').remove();
            	$('.photo').append(`
        				<h2>FoodName : \${res.foodname}</h2>
        				<h2>Accuracy : \${res.accuracy}</h2>
            			`);
            	var food = res.foodname
            	console.log(res.foodname);
            	console.log(food);
            	$.ajax({
            		url:'/web/RecommandFood',
            		method:'POST',
            		data:{'foodName':food},
            		dataType:'json',
            		success:function(res){
            			console.log(res);
            			$('tbody>tr').remove();
            			for(var x in res){
            				console.log(x);
            				$('tbody').append(`
            						<tr>
            							<td>\<a href="/web/gotoHotspotinfo?pc=\${res[x].LOC_PC}">\${res[x].LOC_NAME}</a></td>
            							<td>\${res[x].LOC_SG}</td>
            						</tr>
            						`);
            			}
            			
            		},
            		error:function(x){
            			alert("error!");
            		}
            	})
            	
            	
            },
            error: function(error) {
                // 오류 처리
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
<jsp:include page="header.jsp"></jsp:include>
<section class='container'>
	<div class='row'>
		<div class='col-6'>
			<div class='photo'>
				<img src="/web/resources/final_style/img/No_name.jpg" style="width: 100%; height:500px;">
				<h1>No Image</h1>
			</div>
			<form id="uploadForm" enctype="multipart/form-data">
			<div class="form-group">
      			<label for="formFile" class="form-label mt-4">Input Food Image</label>
      			<input class="form-control" type="file" id="file" name="file">
    		</div>
	    	</form>
    		<div class='d-flex'>
    			<button class='aiimg btn btn-primary mt-1 w-100' id="test">Search</button>
    		</div>
		</div>
		<div class='rec col-6'>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th>Loc Name</th>
						<th>Loc Gu</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Search Please</td>
						<td>Search Please</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>