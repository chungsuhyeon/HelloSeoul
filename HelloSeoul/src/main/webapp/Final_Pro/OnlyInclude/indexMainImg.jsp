<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<!DOCTYPE html>
<html>
<c:choose>
<c:when test="${user_first eq 1}">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/web/resources/final_style/img/homeImg/food/떡볶이1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=134355">
      <div class="carousel-caption d-none d-md-block">
        <h5>Ssada Kimbap Gangnam Woosung branch</h5>
        <p>"Ssada Kimbap"It is a famous restaurant in Seocho-gu, Seoul, and the nearest subway station is Gangnam Station.</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/food/비빔밥1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=139441">
      <div class="carousel-caption d-none d-md-block">
        <h5>Curly Ttukbaegi Yumyum Bibimbap</h5>
        <p>You're thinking about where to go? Then, I recommend the famous restaurant in Jongno-gu, Seoul, "Curly Ttukbaegi Yumyum Bibimbap"!</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/food/족발1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=139250">
      <div class="carousel-caption d-none d-md-block">
        <h5>Nado Jokbal Gangnam Main Store</h5>
        <p>If you're looking for a good restaurant in Gangnam-gu, Seoul, visit "Nado Jokbal (Gangnam Main Branch)"</p>
      </div>
    </a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</c:when>
<c:when test="${user_first eq 2}">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/web/resources/final_style/img/homeImg/shopping/신세계백화점1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=416">
      <div class="carousel-caption d-none d-md-block">
        <h5>싸다 김밥 강남 우성점</h5>
        <p>"싸다김밥(강남우성점)"은 서울특별시 서초구에 있는 맛집으로, 가장 가까운 지하철역은 강남역입니다.</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/shopping/제2롯데월드몰1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=401">
      <div class="carousel-caption d-none d-md-block">
        <h5>뽀글 뚝배기 냠냠 비빔밥</h5>
        <p>어디 가야 할지 고민이시라고요? 그럼 서울특별시 종로구 맛집, "뽀글 뚝배기 냠냠 비빔밥"을 추천합니다!</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/shopping/현대백화점1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=417">
      <div class="carousel-caption d-none d-md-block">
        <h5>나도 족발 강남본점</h5>
        <p>서울특별시 강남구에서 맛집을 찾으신다면 "나도족발(강남본점)"에 방문해보세요</p>
      </div>
    </a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</c:when>
<c:when test="${user_first eq 3}">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/web/resources/final_style/img/homeImg/tour/경북궁1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=204">
      <div class="carousel-caption d-none d-md-block">
        <h5>싸다 김밥 강남 우성점</h5>
        <p>"싸다김밥(강남우성점)"은 서울특별시 서초구에 있는 맛집으로, 가장 가까운 지하철역은 강남역입니다.</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/tour/롯데월드아이스링크1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=2">
      <div class="carousel-caption d-none d-md-block">
        <h5>뽀글 뚝배기 냠냠 비빔밥</h5>
        <p>어디 가야 할지 고민이시라고요? 그럼 서울특별시 종로구 맛집, "뽀글 뚝배기 냠냠 비빔밥"을 추천합니다!</p>
      </div>
    </a>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/tour/시민의숲1080.jpg" class="d-block w-100" alt="...">
      <a href="/web/gotoHotspotinfo?pc=297">
      <div class="carousel-caption d-none d-md-block">
        <h5>나도 족발 강남본점</h5>
        <p>서울특별시 강남구에서 맛집을 찾으신다면 "나도족발(강남본점)"에 방문해보세요</p>
      </div>
    </a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</c:when>
<c:otherwise>
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/web/resources/final_style/img/homeImg/basic/동대문1080.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h2>Dongdaemun</h2>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/basic/롯데월드1080.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h2>Lotte World</h2>
      </div>
 </div>
    <div class="carousel-item">
      <img src="/web/resources/final_style/img/homeImg/basic/반포대교1080.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h2>Banpo Bridge</h2>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</c:otherwise>
</c:choose>
</html>