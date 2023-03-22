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
				$("button#bad").html("<i class='glyphicon glyphicon-thumbs-down'></i>비공감");
				$("button#good").html("<i class='glyphicon glyphicon-thumbs-up'></i>공감");
				$("i#top-bad").html("");
				$("i#top-good").html("");
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
						$("i#top-bad").append(x.BAD);
						$("i#top-good").append(x.GOOD);
						});
						},
					error : function() {
						console.log("error");
						}
					});
				}
			});
		$("button#bad")
				.click(
						function() {
							if ($("input#user_id").val() == "") {
								alert("login plz");
							} else {
								$("button#bad")
										.html(
												"<i class='glyphicon glyphicon-thumbs-down'></i>비공감");
								$("button#good")
										.html(
												"<i class='glyphicon glyphicon-thumbs-up'></i>공감");
								$("i#top-bad").html("");
								$("i#top-good").html("");
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
											//	 					console.log($("i#top-good").html("1"));
											$("i#top-bad").append(x.BAD);
											$("i#top-good").append(x.GOOD);
										});
									},
									error : function() {
										console.log("error");
									}

								});
							}
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
						<input type="hidden" id='boarduser_id' name='boarduser_id' value='${i.user_id}'>
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
							<img alt="comgood" src="/web/resources/final_style/img/icon/comgood.png"> ${i.good}
							<img alt="combad" src="/web/resources/final_style/img/icon/combad.png"> ${i.bad}
						</span>
					</div>
					<div class='contentsbar' style="display: inline-flex; width: 100%;">
						<div class='textbar col-6'>
							${i.com_cont}
						</div>
						<div class='photobar col-6'>
							<img alt="test" src="/web/resources/final_style/img/indexFood.jpg">
						</div>
					</div>
					<div class='settingbar col-12' style="display: inline-flex;">
					<div class='backbar col-4'>
						<button type="button" class="btn btn-primary">List</button>
					</div>
					<div class='goodbad col-4'>
						<button type="button" class="btn btn-success" id='good'>
							<img alt="like" src="/web/resources/final_style/img/icon/like.png">
							Good ${i.good}
						</button>
						<button type="button" class="btn btn-warning">
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
