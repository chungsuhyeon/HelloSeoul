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
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	if(dd<10){
		dd='0'+dd;
	}
	if(mm<10){
		mm='0'+mm;
	}
	today=yyyy+mm+dd;
	
	
		$.ajax({
			type:"POST",
			url:'/web/coin',
			data : {'day':today},
			dataType:'json',
			success: function(r){
				var ptoday = yyyy+'-'+mm+'-'+dd;
				console.log(r);
				$('.coin').append(`
						<table class='table text-center'>
						<thead>
							<tr class='table-primary'>
								<th colspan='2'>\${ptoday}</th>
							</tr>
							<tr class='table-primary'>
								<th>Nation</th>
								<th>Exchange Rate</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
						`);
				for(var x=0;x<r.length;x++){
					if(r[x].cur_unit != 'KRW'){
						$('.table tbody').append(`
								<tr>
									<td>\${r[x].cur_unit}(\${r[x].cur_nm})</td>
									<td>\${r[x].ttb}</td>
								</tr>
								`);						
					}
				}
			},
			error: function(x){
				alert("error");
			}
			
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
<jsp:include page="./OnlyInclude/header.jsp"></jsp:include>
<section class='container'>
<jsp:include page="./OnlyInclude/indexMainImg.jsp"></jsp:include>
<hr class='hr'/>
<div class='row'>
	<div class='col-6'>
		<div class='col-12'>
			<jsp:include page="./OnlyInclude/calendar.jsp"></jsp:include>
		</div>
	</div>
	<div class='col-6'>
		<div class='row'>
			<div class='coin col-12' style="overflow-x:hidden; ovaerflow-y:scroll; height: 410px;">

			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="./OnlyInclude/footer.jsp"></jsp:include>
</body>
</html>