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
<script src=/web/resources/final_style/calender/script.js></script>
<script type="text/javascript">
$(function(){
		
});
</script>
<!--JS Section End -->

<!-- Style Section Begin -->
<link type="text/css" rel="stylesheet" href="/web/resources/final_style/calender/style.css">
<style type="text/css">

</style>
<!-- Style Section End -->


</head>
<body onload="startTime()">
  <div class="calender">
    <div class="card">
      <div class="front">
        <div class="contentfront">
          <div class="month">
            <table>
              <tr class="orangeTr">
                <th>M</th>
                <th>T</th>
                <th>W</th>
                <th>T</th>
                <th>F</th>
                <th>S</th>
                <th>S</th>
              </tr>
              <tr class="whiteTr">
                <th></th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
              </tr>
              <tr class="whiteTr">
                <th>7</th>
                <th>8</th>
                <th>9</th>
                <th>10</th>
                <th>11</th>
                <th>12</th>
                <th>13</th>
              </tr>
              <tr class="whiteTr">
                <th>14</th>
                <th>15</th>
                <th>16</th>
                <th>17</th>
                <th>18</th>
                <th>19</th>
                <th>20</th>
              </tr>
              <tr class="whiteTr">
                <th>21</th>
                <th>22</th>
                <th>23</th>
                <th>24</th>
                <th>25</th>
                <th>26</th>
                <th>27</th>
              </tr>
              <tr class="whiteTr">
                <th>28</th>
                <th>29</th>
                <th>30</th>
                <th>31</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </table>
          </div>
          <div class="date">
            <div class="datecont">
              <div id="date"></div>
              <div id="day"></div>
              <div id="month"></div>
              <i class="fa fa-pencil edit" aria-hidden="true"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="back">
        <div class="contentback">
          <div class="backcontainer">
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>