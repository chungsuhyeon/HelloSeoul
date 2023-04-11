<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 

<!DOCTYPE html>
<html>
<style type="text/css">
.footlink>a{
	color: #2c3e50;
}
</style>
<footer class='container'>
<hr class="hr"/>
<div class="row">
	<div class="col-4 d-flex">
		<a class="logo navbar-brand" href="/web/Final_Pro/index.jsp"><img alt="logo" src="/web/resources/final_style/img/Logo.png" style="width: 50%; height: 50%;"></a>
		<p>Develop 2023</p>
	</div>
	<div class="footlink col-8">
		<a href="/web/Final_pro/index.jsp">Home</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/web/gotoctg">Location Search</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/web/Final_Pro/FoodSearch.jsp">K-Food Search</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/web/gotohotspo">Hotspot</a>
		&nbsp;&nbsp;&nbsp;
		<a href="#">Ticketing</a>
		&nbsp;&nbsp;&nbsp;
		<a href="/web/boardSelect">Community</a>
		&nbsp;&nbsp;&nbsp;
		<c:choose>
			<c:when test="${user_id eq null}">
				<a href="/web/Final_Pro/join.jsp">Join</a>
			</c:when>
			<c:otherwise>
				<a href="/web/myPageLoad">Mypage</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</footer>
</html>