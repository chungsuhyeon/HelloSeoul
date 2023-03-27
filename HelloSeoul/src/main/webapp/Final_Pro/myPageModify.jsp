<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	function minEndDate(){
		let startDate = $("input[name='tripStart']").val();
		$("input[name='tripEnd']").prop('min', startDate);
	}
	
	function maxStartDate(){
		let endDate = $("input[name='tripEnd']").val();
		$("input[name='tripStart']").prop('max', endDate);
	}
	
	$(function(){
		// submit 버튼 클릭 → 유효성 검사
		$("button#btn_submit").click(function(){
			if($("input#title").val().length == 0) {
				alert("Please enter the title");
				$("input#title").val('');
				$("input#title").focus();			
				return false;
			}		
			if($("input[name='tripStart']").val().length == 0 || $("input[name='tripEnd']").val().length == 0){
				alert("Please choose the date");
				$("input[name='tripStart']").val('');
				$("input[name='tripEnd']").val('');
				$("input[name='tripStart']").focus();	
				return false;			
			}						
			$("form[name='mypageCreateDateFrm']").submit();
		}); // $("button#btn_submit").click
		
		$("button#btn_cancle").click(function(){
				document.location.href ="myPageMain.jsp";
		}); // $("button#btn_cancle").click
		
	}); // function
	
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
	td{
		text-align: center;
	}
	tr > td:nth-child(2){
		width : 70%;
	}
</style>
<!-- Style Section End -->

</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	<section>
		<div class='container-fluid bg-warning' style="display: inline-flex;">
			<div class='col-4'></div>
			<div class='col-4 mt-5'>
				<form action="/web/createPlannerDate?modi=createPlanner" name="mypageCreateDateFrm" method="post">
					<table class="table table-hover bg-light" style="width: 80%;">
						<thead>
							<tr class="table-primary">
								<th colspan="2">
									<h4>Planner Create</h4>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<h4>Title : </h4>
								</td>
								<td>
									<input type="text" class="form-control" placeholder="Input Title" id="title" name="title">
								</td>
							</tr>
							<tr>
								<td>
									<h4>Start Date : </h4>
								</td>
								<td>
									<input type="date" class="form-control" style="width: 100%;" name="tripStart" onchange="minEndDate()">
								</td>
							</tr>
							<tr>
								<td>
									<h4>End Date : </h4>
								</td>
								<td>
									<input type="date" class="form-control"  style="width: 100%;" name="tripEnd" onchange="maxStartDate()">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<h4 style="text-align: center;">Planner memo</h4>
									<textarea style="width: 100%; height: 200px; resize: none;" name="memo"></textarea>
								</td>
							</tr>
							<tr>
								<td style="width:50%;">
									<button class="btn btn-lg btn-success" type="button" style="width: 100%" id="btn_submit">Create</button>
								</td>
								<td>
									<button class="btn btn-lg btn-danger" type="button" style="width: 100%" id="btn_cancle">Cancel</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>								
			</div>
			<div class='col-4'></div>
		</div>
	</section>
	
	<footer>
		<jsp:include page="./footer.jsp"></jsp:include>
	</footer>
</body>
</html>