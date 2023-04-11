<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/css/flatly_bootstrap.css">

<script type="text/javascript">
$(function(){

});

</script>
</head>
<body>
<jsp:include page="../Final_Pro/header.jsp"></jsp:include>
<!-- <div> -->
<!-- <input type="checkbox" value="부적적">부적절 -->
<!-- </div> -->
<!-- <div> -->
<!-- <input type="checkbox" value="부적적">부적절 -->
<!-- </div> -->
<!-- <div> -->
<!-- <input type="checkbox" value="부적적">부적절 -->
<!-- </div> -->
<!-- <div> -->
<!-- <input type="checkbox" value="부적적">부적절 -->
<!-- </div> -->
<!-- <div> -->
<!-- <input type="checkbox" value="부적적">부적절 -->
<!-- </div> -->
<!-- <div> -->
<!-- <textarea rows="5px" cols="5px"></textarea> -->
<!-- </div> -->
<!-- <div> -->
<!-- <button>신고하기</button><button>취소</button> -->
<!-- </div> -->
<!-- 팝업창 -->   
         <div class="modal" id="plannerSharePopUp" style="position: fixed; top:0; left: 0; bottom: 0; right: 0; background: rgba(0, 0, 0, 0.5);">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Nickname search to share planner</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="popupClose">
                        <span aria-hidden="true"></span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <span>Nickname</span>
                     <br>
                     <input type="text">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="">Search</button>
                  </div>
                  <div class="modal-footer">
<!--                      <button type="button" class="btn btn-primary">Save changes</button> -->
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="popupClose">Close</button>
                  </div>
               </div>
            </div>
         </div>
</body>
</html>