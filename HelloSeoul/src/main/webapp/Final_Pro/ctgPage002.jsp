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
<title>Insert title here</title>
<!--JS Section Begin -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68fb4c87ba8765d71119fecd40096446"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	//location gu ajax
	$.ajax({
		type : 'post',
		url : '/web/readyForLocation',
		dataType : 'json',
		success : function(s){
			for(var x=0 ; x<s.length ; x++){
				$('#locctg').append(`<option value=\${s[x].kr_gu}>\${s[x].en_gu}</option>`);
				}
		},
		error : function(f){
			
		}
	});
	//show list ajax (table body)
	$.ajax({
		type : 'post',
		url : '/web/readyForCategory',
		dataType : 'json',
		data : {'loc_ctg1' : '${param.loc_ctg1}'},
		success : function(s){
			for(var x=0 ; x<s.length ; x++){
				$('#tablebd').append(`
						<tr class='table-light'>
						<td style='padding-left : 10%;'><input type="checkbox" name="jjim" value=\${s[x].LOC_PC}></td>
						<td id='loc_name'>\${s[x].LOC_NAME}</td>
						</tr>
						`);
			}
			console.log(x);
		},
		error : function(f){
			
		}
	});
	
	//list info + map
	$('tr')
	//list jjim submit
	$('#jjimsubmit').click(function(){
		$("input[name='jjim']").each(function(){
			if($(this).prop("checked")){
				alert($(this).val());
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
	<header>
	<jsp:include page="./header.jsp"></jsp:include>
	</header>
	${location}
	<section class='container-fluid' style="display: inline-flex;">
		<div class='col-2 border-primary'>
			<!-- loc ajax -->
			<div class='searchbar1 col-12' style="display: inline-flex;">
				<select class='form-select' id='locctg'>
					<option value="choose">Location</option>
				</select>
				<select class='form-select' id='detailctg'>
					<option value="choose">Detail</option>
				</select>
			</div>
			<div class='searchbar2 col-12' style="display: inline-flex;">
				<input type="text" class="form-control" placeholder="Location Name" id="inputDefault">
				<button type="button" class="btn btn-primary">Search</button>
			</div>
			<div></div>
			<div class='ctglist'>
				<table class='table table-hover'>
					<thead>
						<tr class='table-primary'>
							<th>Steamed</th>
							<th>Location Name</th>
						</tr>
					</thead>
					<tbody id="tablebd">
					<!-- table body ajax -->
					</tbody>
				</table>
			</div>
			<div class='jjimsubmit'>
			<button class="btn btn-lg btn-success" type="button" style="width: 100%" id="jjimsubmit">Submit</button>
			</div>
		</div>
		<div class="col-6">
			<h1>info</h1>
		</div>
		<div class="col-4">
			<h1>mapping</h1>
		</div>
	</section>
</body>
</html>