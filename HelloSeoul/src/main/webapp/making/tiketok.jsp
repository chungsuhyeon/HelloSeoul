<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>
예매완료

</h1>
<c:set var="seat" value="1,2,3"></c:set>
<c:forEach var="i" items="${seat }">
${i }<br>



</c:forEach>
<c:forEach var='i' items="A,B,C,D,E,F,G,H,I">
						<div class='seat col-12' style="display: inline-flex;">
							<h3 style=" width: 5%;" >${i}</h3>
							<div class="seat"style="width: 90%; display:flex;">
							<c:forEach var='x' begin="0" end="9">

							

							
 							<button type="button"
											class="emptyeseat btn btn-outline-primary"					
											style="margin: 1px;display: inline-flex; width: 100%; height:45px; " value="${i}${x}">${i}&nbsp;${x}</button> 
						
							
						
							</c:forEach>
							</div>
						</div>
					</c:forEach>


</body>
</html>