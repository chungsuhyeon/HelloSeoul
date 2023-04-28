<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("button").click(function(){
		if(($(this).attr('id'))=='join'){
			 document.location.href ="/web/Final_Pro/join.jsp";
		}
		else if(($(this).attr('id'))=='login'){
			document.location.href ="/web/Final_Pro/login.jsp";
		}
		else if(($(this).attr('id'))=='logout'){
			document.location.href ="/web/HelloSeoulLogout";
		}
		else if(($(this).attr('id'))=='comm'){		
			document.location.href ="/web/boardSelect";
		}
		else if(($(this).attr('id'))=='mypage'){
			document.location.href ="/web/myPageLoad";
		}
	});
});
</script>
<!--JS Section End -->
<!-- Style Section Begin -->
<style type="text/css">
.menuBox>a{
	margin-left: 4px;
	margin-right: 4px;
	font-size: 20px;
	color : #2c3e50;
	text-decoration: underline;
	font-weight: bold;
}
</style>
<!-- Style Section End -->
</head>
<header class='container'>
	<div class='row'>
		<div class='logoBox col-3 mt-4'>
			<a class="logo navbar-brand" href="/web/Final_Pro/index.jsp"><img alt="logo" src="/web/resources/final_style/img/Logo.png" style="width: 100%;"></a>
		</div>
		<div class='menuBox col-6 text-center mt-4'>
			<a href="/web/gotoctg">Location Search</a>
			<a href="/web/Final_Pro/FoodSearch.jsp">K-Food Search</a>
			<a href="/web/gotohotspot">Hotspot</a>
			
		</div>
		<div class='settingBox col-3 mt-3 text-end'>
			<div class="btn-group" role="group" aria-label="settingLabel">
				<button type="button" class="btn btn-primary" id="comm">Community</button>
				<c:choose>
					<c:when test="${user_id eq null}">
						<button type="button" class="btn btn-primary" id="login">Login</button>
						<button type="button" class="btn btn-primary" id="join">Join</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary" id="logout">Logout</button>
						<button type="button" class="btn btn-primary" id="mypage">Mypage</button>				
					</c:otherwise>
				</c:choose>
			</div>
			<!-- Google 번역 -->
			<div id="google_translate_element" class="hd_lang"></div>
			<script>
				function googleTranslateElementInit() {
					new google.translate.TranslateElement({
						pageLanguage: 'ko',
						includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
						layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
						autoDisplay: false
					}, 'google_translate_element');
				}
			</script>
			<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
			<!-- //Google 번역 -->
		</div>
	</div>
	<hr class='hr'/>
</header>
</html>