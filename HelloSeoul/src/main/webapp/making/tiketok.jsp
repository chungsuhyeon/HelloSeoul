<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<!-- <html> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<!-- <head> -->
<!-- <meta charset="EUC-KR"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<%-- <jsp:include page="../Final_Pro/header.jsp"></jsp:include> --%>

<!-- <a href="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=2ac7TGIMKndIFA9424lQVDkcFAZVXAO7&searchdate=20230410&data=AP01"> -->
<!--  Exchange -->
<!-- </a> -->

<!-- <iframe src="https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=2ac7TGIMKndIFA9424lQVDkcFAZVXAO7&searchdate=20230410&data=AP01"></iframe> -->


<!-- </body> -->
<!-- </html> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@ page session="false" %>
<html>
<head>
        <title>Home</title>
</head>
<body>
<button onclick="test()" type="button">Ajax</button>

<script>
var obj = {"name": "vita", "age": 25};

function test() {
    $.ajax({
        url: "<c:url value="/test" />",
        type: "post",
        data: JSON.stringify(obj),
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
            alert("성공");
        },
        error: function(errorThrown) {
            alert(errorThrown.statusText);
        }
    });
}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>