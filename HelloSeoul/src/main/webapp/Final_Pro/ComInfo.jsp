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
.tablebar tr > th{
	width: 5%; 
	}
.infobar{
	font-size: 20px;
	}
.titlebar{
 	border: solid;
	}
.contentsbar > div{
	border: solid;
	}
.settingbar{
	border: solid;
	}
#memberbar{
	font-size: 15px;
	}
.photobar > img{
	object-fot:cover;
 	width: 100%;
 	height: 100%;
	}
</style>
<!-- Style Section End -->
</head>
<body>
	<header>
		<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
	</header>
	<section class='section d-flex justify-content-center bg-info'>
		<div class='col-6 mt-4 mb-4'>
			<div class='infobar bg-light'>
				<c:forEach items="${info}" var="i">
					<div class='titlebar'>
						<input type="hidden" id='com_no' name='com_no' value='${i.com_no}'>
						<input type="hidden" id='user_id' name='user_id' value='${user_id}'>
						<input type="hidden" id='boarduser_id' name='boarduser_id' value='${i.user_id}' >
						<input type="hidden" id='com_ctg' name='com_ctg' value='${i.com_ctg}' >
						
						<span>
							<c:choose>
								<c:when test="${i.com_ctg eq 1}">[ctg1qwdqw]</c:when>
								<c:when test="${i.com_ctg eq 2}">[ctg12312355dw]</c:when>
								<c:otherwise>[ctg1123dscdsd]</c:otherwise>
							</c:choose>
							${i.com_title}
						</span>
						<br>
						<span>
							<img alt="user" src="/web/resources/final_style/img/icon/comuser.png"> ${i.user_nick}
							<img alt="reple" src="/web/resources/final_style/img/icon/reple.png"> ${i.reply}
							<img alt="hit" src="/web/resources/final_style/img/icon/hit.png"> ${i.com_hit}
							<img alt="regdate" src="/web/resources/final_style/img/icon/regdate.png"> ${i.com_regdate}
							<img alt="comgood" src="/web/resources/final_style/img/icon/comgood.png">
							<span id='top-good'>${i.good}</span>
							<img alt="combad" src="/web/resources/final_style/img/icon/combad.png">
							<span id='top-bad'>${i.bad}</span>
						</span>
					</div>
					<div class='contentsbar' style="display: inline-flex; width: 100%;">
						<div class='textbar col-6'>
							${i.com_cont}
						</div>
						<div class='photobar col-6' >
						<c:if test="${i.com_ctg==1 }">
						<!-- planner -->
						<input type="hidden" id="plno" value="${i.plno }">
								<div class='col-12'>
				<div class='col-12' style="display: inline-flex;" id="planTitle"></div>
			</div>
			
			<div class='data col-12' style="display: inline-flex;">
				<!-- tab head -->
				<div class='tabbar col-12'>
					<ul class='nav nav-tabs bg-primary' role='tablist' name="dayTabbar" style="width:100%;">
					</ul>
					
					<!-- tab contents -->
					<div id='myTabContent border border-info-1' class='tab-content'>
					</div>
				</div>
				</div>
							</c:if>
						<div class='photobar col-12'>
							<img alt="test" src="/web/resources/test/${i.com_filename }">
							</div>
						
							
						</div>
					</div>
					<div class='settingbar col-12' style="display: inline-flex;">
					<div class='backbar col-4'>
						<button type="button" class="btn btn-primary" id="listbt">List</button>
					</div>
					<div class='goodbad col-4'>
						<button type="button" class="btn btn-success" id='good'>
							<img alt="like" src="/web/resources/final_style/img/icon/like.png">
							Good ${i.good}
						</button>
						<button type="button" class="btn btn-warning" id='bad'>
							<img alt="dislike" src="/web/resources/final_style/img/icon/dislike.png">
							Bad ${i.bad}
						</button>
					</div>
					<div class='settingbar col-4' style="display: inline-flex;">
						<button type="button" class="btn btn-danger">Report</button>
						<c:if test="${user_id eq i.user_id}">
						<button type="button" class="btn btn-primary" onclick="check_id()">Modify</button>
						<button type="button" class="btn btn-primary" onclick="check_id2()">Delete</button>
						</c:if>
						<img alt="reple" src="/web/resources/final_style/img/icon/replebt.png">
						<img alt="scrap" src="/web/resources/final_style/img/icon/scrapbt.png">
					</div>
				</div>
			</c:forEach>	
			</div>
			<div class='replebar mt-4 bg-light'>
				<div class='replein col-12 mt-4' style="display: inline-flex;">
					<div class='col-10'>
						<textarea style="width: 95%; height: 100px; margin-left: 10px; margin-right: 10px;" id="reply_contents" name="reply_contents"></textarea>
						<span id="replybyte">0</span>
					</div>
					<div class='col-2'>
						<button type="button" class="btn btn-primary" style="width: 100%; height: 100%;" id="reply_Submit">Apply</button>
					</div>
				</div>
				<div class='col-12' style="text-align: center;">All Reple</div>
				<div class='replybody col-12'>
					<c:forEach items="${reply}" var="i">
					<div class='replyboard col-10' style="margin-left: 10px;"> 
						<input type="hidden" value="${i.rep_no}" id="rep_no">
						<input type="hidden" value="${i.user_id }" id="rep_user_id">
						<div class='replecontents'>					
							<span>${i.user_nick}|${i.rep_regdate}</span>
							<br>
							<span>${i.rep_cont}</span>
						</div>
						<div class='repleabar'>
							<a href='#'>reple</a>|
							<a href='/web/replyMo'>modi</a>|
							<a href='/web/deleteReplyMain?no=${i.rep_no }&boardno=${i.com_no}&user_id=${user_id}' onclick="confirm('정말로 삭제하겠습니까?')">
							delete
							</a>|
							<a href='#'>report</a>
						</div>
	 				</div>
 					</c:forEach>
				</div>
 				
			</div>				
		</div>
	</section>
	<footer>
		<jsp:include page="../Final_Pro/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
