<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

$('document').ready(function(){
// 	if($("#com_ctg").val()=1){
	const urlParams = new URL(location.href).searchParams;
	const no = $("#plno").val();
	console.log($("#com_ctg").val());
	// 일정에 따른 tab 구현
	$.ajax({
		url: '/web/ajaxMypagePlannerTabBar',
		type: 'post',
		data: {no:no},
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(result){												
			// 타이틀 input
			$("div#planTitle").append(`<h3>Title : \${result.PLANNER_TITLE}</h3>`);
			
			// 날짜 tab				
			var start = new Date(result.PLANNER_START);

			for(var i=0; i<result.numDate; i++){
				var year = start.getFullYear().toString();
				var mon = (start.getMonth() + 1).toString();
				var day = start.getDate().toString();
				
				mon = mon.length == 1 ? "0" + mon : mon;
				day = day.length == 1 ? "0" + day : day;
				
				// 최종 날짜 변수
				var show_date = year + "-" + mon + "-" + day;
				
				if(!i){
					$("ul[name='dayTabbar']").append(
							`<li class='nav-item' role='presentaion'>
								<a class='nav-link active' data-bs-toggle='tab' href='#Day\${i}' aria-selected='true' role='tab'>\${show_date}</a>
							</li>`
					);
					$("div.tab-content").append(
							`<div class='tab-pane fade active show' id='Day\${i}' role='tabpanel'>
								<table class='table table-hover'>
									<tbody></tbody>
								</table>
							</div>`						
					);
				} else {
					$("ul[name='dayTabbar']").append(
							`<li class='nav-item' role='presentaion'>
								<a class='nav-link' data-bs-toggle='tab' href='#Day\${i}' aria-selected='false' role='tab'>\${show_date}</a>
							</li>`
					);
				}
				$("div.tab-content").append(
						`<div class="tab-pane fade" id="Day\${i}" role="tabpanel">
							<table class='table table-hover'>
								<tbody></tbody>
							</table>
						</div>`						
				);
				start.setDate(start.getDate() + 1);
			} // 날짜 tab for문 끝
			
			$.ajax({
				url: '/web/ajaxMypagePlannerTabContent',
				type: 'post',
				data: {no:no},
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success: function(result){
					$(result).each(function(idx, list){
						list['planner_shour'] = list['planner_shour'].length == 1 ? "0" + list['planner_shour'] : list['planner_shour']
						list['planner_smin'] = list['planner_smin'].length == 1 ? "0" + list['planner_smin'] : list['planner_smin']
						
						$("div#" + list['planner_date'] + " table tbody").append(
								`<tr class='table-light'>
									<td>
										<span> \${list["planner_shour"]} : \${list["planner_smin"]} </span>
									</td>
									<td>
										<span>\${list["loc_name"]}</span>
										<br>
										<span style="font-size: 5px">\${list["loc_sg"]} > \${list["loc_ctg1"]} > \${list["loc_ctg2"]} </span>
									</td>
								</tr>`
						);							
					}); // $(result).each
				},
				error: function(){
					alert("error : " + error);
				}
			}); // ajax taa-content
			
		},
		error: function(){
			alert("error : " + error);
		}
	}); // ajax

}); // $('document').ready
function check_id(){
	var no=$("input#com_no").val();
	var user_id=$("input#user_id").val();
	if(
			$("input#user_id").val()==""
			
			){
		alert("login plz");
	}else if(
			($("input#user_id").val())!=($("input#boarduser_id").val())
			){
		alert("id가 맞지않습니다");
	}
	else{
		location.replace("/web/modifyAction?no="+no+"&user_id="+user_id);
	}
}
function check_id2(){
	var no=$("input#com_no").val();
	var user_id=$("input#user_id").val();
	if(
			$("input#user_id").val()==""
			
			){
		alert("login plz");
	}else if(
			($("input#user_id").val())!=($("input#boarduser_id").val())
			){
		alert("id가 맞지않습니다.");
	}
	else{
		confirm('정말로 삭제하시겠습니까?');
		location.replace("/web/deleteCom?no="+no+"&user_id="+user_id);
	}
}
</script>
<script type="text/javascript">
	$(function() {
		$("textarea#reply_contents").focus(function() {
			$("textarea#reply_contents").val("");
		});
		$("textarea#reply_contents").keyup(
				function() {
					$("span#replybyte").text(
							$("textarea#reply_contents").val().length);
				});

		$("button#reply_Submit").click(	function() {
				if ($("input#user_id").val() == "") {
					alert("login plz");
					}
				else{
					$.ajax({
							type : 'POST',
							url : '/web/replyInsert',
							data : {reply : $("textarea").val(),
									no : $("input#com_no").val(),
									id : $("input#user_id").val()
									},
							dataType : 'json',
							success : function(p) {
								$('.replybody div').remove();
								$(p).each(function(index,x){
									$(".replybody").append(`<div class='replyboard col-10' style="margin-left: 10px;"> 
																<input type="hidden" value="\${x['rep_no']}" id="rep_no">
																<input type="hidden" value="\${x['user_id']}" id="rep_user_id">
																<div class='replecontents'>					
																	<span>\${x['user_nick']}|\${x['rep_regdate']}</span>
																	<br>
																<span>\${x['rep_cont']}</span>
																</div>
																<div class='repleabar'>
																	<a href='#'>reple</a>|
																	<a href='/web/replyMo'>modi</a>|
																	<a href='/web/deleteReplyMain?no=\${x["rep_no"]}&boardno=\${x["com_no"]}&user_id=\${user_id}' onclick="confirm('정말로 삭제하겠습니까?')">
																	delete
																	</a>|
																	<a href='#'>report</a>
																</div>
						 									</div>`);
									$(Object.keys(x)).each(function(j,key){
										console.log(key+" "+ x[key]);
										});
									});
								},
								error : function() {
									console.log("error");
									}

							});
					}
		});
		//-----------------------------------------------------------------ajax--------------------------------------------------------------------------------------------------

		$("button#good").click(function() {
			if ($("input#user_id").val() == "") {
				alert("login plz");
				}
			else{
				$("button#good").html("<img alt='like' src='/web/resources/final_style/img/icon/like.png'>Good");
				$("button#bad").html("<img alt='dislike' src='/web/resources/final_style/img/icon/dislike.png'>Bad");
				$("span#top-bad").html("");
				$("span#top-good").html("");
				$.ajax({
					type : 'POST',
					url : '/web/goodAction',
					data : {
							com_no : $("input#com_no").val(),
							user_id : $("input#user_id").val()
							},
					dataType : 'json',
					success : function(p) {
						$(p).each(function(index, x) {
						$("button#good").append(x.GOOD);
						$("button#bad").append(x.BAD);
						$("span#top-bad").append(x.BAD);
						$("span#top-good").append(x.GOOD);
						});
						},
					error : function() {
						console.log("error");
						}
					});
				}
			});
		$("button#bad").click(function() {
			if ($("input#user_id").val() == ""){
				alert("login plz");
				}
			else{
				$("button#good").html("<img alt='like' src='/web/resources/final_style/img/icon/like.png'>Good");
				$("button#bad").html("<img alt='dislike' src='/web/resources/final_style/img/icon/dislike.png'>Bad");
				$("span#top-bad").html("");
				$("span#top-good").html("");
				$.ajax({
					type : 'POST',
					url : '/web/badAction',
					data : {
							com_no : $("input#com_no").val(),
							user_id : $("input#user_id").val()
							},
					dataType : 'json',
					success : function(p) {
						$(p).each(function(index, x) {
						$("button#good").append(x.GOOD);
						$("button#bad").append(x.BAD);
						$("span#top-bad").append(x.BAD);
						$("span#top-good").append(x.GOOD);
						});
						},
					error : function() {
						console.log("error");
						}
					});
				}
			});
		$("button#listbt").click(function(){
			location.replace("/web/boardSelect");
			
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
<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
<section class='container'>
	<div class='row d-flex justify-content-center'>
		<div class='col-10'>
			<table class='table'>
				<thead>
					<tr class='table-primary'>
						<th colspan="2">[Category] Title</th>
					</tr>
					<tr>
						<th colspan="2">
							<img class='mx-1' alt="user" src="/web/resources/final_style/img/icon/comuser.png">NickName
							<img class='mx-1' alt="reple" src="/web/resources/final_style/img/icon/reple.png">0
							<img class='mx-1' alt="hit" src="/web/resources/final_style/img/icon/hit.png">0
							<img class='mx-1' alt="regdate" src="/web/resources/final_style/img/icon/regdate.png">2023-04-10
							<img class='mx-1' alt="comgood" src="/web/resources/final_style/img/icon/comgood.png">
							<span id='top-good'>0</span>
							<img class='mx-1' alt="combad" src="/web/resources/final_style/img/icon/combad.png">
							<span id='top-bad'>0</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Contents</td>
						<td style="border-left-width : 1px;">Loc_img</td>
					</tr>
					<tr>
						<td class='text-center' colspan="2">
							<button type="button" class="btn btn-success" id='good'>
								<img alt="like" src="/web/resources/final_style/img/icon/like.png">
								Good 0
							</button>
							<button type="button" class="btn btn-warning" id='bad'>
								<img alt="dislike" src="/web/resources/final_style/img/icon/dislike.png">
								Bad 0
							</button>
						</td>
					</tr>
					<tr>
						<td class='text-end' colspan="2">
							<button type="button" class="btn btn-danger">Report</button>
							<button type="button" class="btn btn-primary" onclick="check_id()">Modify</button>
							<button type="button" class="btn btn-primary" onclick="check_id2()">Delete</button>
							<button type="button" class="btn btn-primary" onclick="check_id2()">Reple</button>
							<button type="button" class="btn btn-primary" onclick="check_id2()">Scrap</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class='row'>
		<div class='col-10'>
			<h1>Reple</h1>
		</div>
	</div>
</section>
<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
</body>
</html>
