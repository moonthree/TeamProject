<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/introduction_css/introduction.css">
    <title>펫띵 소개</title>
    
    <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			.h {
				text-align: center;
			}
	 
	</style>
    


</head>
<body>

 <c:import url="/header.do"></c:import>

<div class="wrap">
      <div>
      <img src="<%=request.getContextPath()%>/resources/image/introduction/aboutus.PNG" class="img-fluid" alt="공지사항" height="585px" width="100%">
      </div>
      </div>
      <!-- intro end-->
      <ul class="amount">
        <li>
          <div>
            <div class="contents1">전국 반려가구</div>
            <div class="result">약 638만가구</div>
          </div>
        </li>
        <li>
          <div>
            <div class="contents1">전국 반려동물</div>
            <div class="result">약 860만 마리</div>
          </div>
        </li>
        <li>
          <div>
            <div class="contents1">전국 반려견</div>
            <div class="result">약 602만 마리</div>
          </div>
        </li>
        <li>
            <div>
              <div class="contents1">전국 반려묘</div>
              <div class="result">약 258만 마리</div>
            </div>
        </li>
      </ul>
      <!-- amount end -->

      <div class="main_text0">
        <h1>SERVICE</h1>
        <div class="contents4">엄마, 아빠의 마음을 담아 정성으로 판매합니다.</div>
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="<%=request.getContextPath()%>/resources/image/introduction/icon2.svg">
            </div>
            <div class="contents1_bold">신선한 상품</div>
            <div class="contents2">
                유통기한 지난 제품도 없습니다.
                오직 신선한 상품들만 보유하고있어요!
            </div>
            
          </li>

          <li>
            <div class="icon_img">
              <img src="<%=request.getContextPath()%>/resources/image/introduction/icon0.svg">
            </div>
            <div class="contents1_bold">친절한 상담</div>
            <div class="contents2">
                궁금한것은 무엇이든 연락주세요.
                친절한 상담원이 안내해드려요!
            </div>
            
          </li>

          <li>
            <div class="icon_img">
              <img src="<%=request.getContextPath()%>/resources/image/introduction/icon1.svg">
            </div>
            <div class="contents1_bold">다양한 상품</div>
            <div class="contents2">
                반려견, 반려묘 등 다른 애완동물 상품들도 많아요!
            </div>
            
          </li>
        </ul>
      </div>

      <div class="main_text1">
        <h1>ABOUT</h1>
        <div class="contents1">부모의 마음을 담다.</div>
        <div class="service">
          <div class="food_photo">
            <img src="<%=request.getContextPath()%>/resources/image/introduction/aboutus2.PNG" class="img-fluid" alt="공지사항">
          </div>
          <div class="contents2">
              <h2>반려동물은 가족입니다.</h2>
              무엇이 필요할까? <br>
              무엇이 중요할까?<br>
              무엇이 더 행복하게 만들어 줄 수 있을까?<br>
              헤어지는 날까지 항상 옆에서 행복하면 좋겠다...라는 고민으로 출발해서 <br>
              지금의 펫띵이 만들어 졌습니다. <br>
              저희는 엄청난 것을 원하는 것이 아닙니다. 그냥 아이들과 함께 웃고,<br>
              행복했으면 좋겠다는 마음으로 운영합니다. <br>
              부모의 마음을 담아 아이들과 마음을 이을 수 있도록<br>
              아이들도 부모의 마음을 이어갔으면 좋겠습니다. <br><br>
              
              세상의 모든 아이들이 행복하고 밝게 웃으면서 살아가는<br>
              세상이 오길 바랍니다. <br>
              
          </div>
        </div>
      </div>

      <div class="main_text2">
      
        <ul>
          <li>
            <div><h1>CONTACT</h1></div>
            <a class="navtext" href="<%=request.getContextPath()%>/mypage/mypage.do">스토어</a>
            <div class="more2"><a href="<%=request.getContextPath()%>/mypage/mypage.do">더 알아보기</a></div>
          </li>
          <li>
          	<div><h1>CONTACT</h1></div>
            <a class="navtext" href="<%=request.getContextPath()%>/funding/main.do">펀딩</a>
            <div class="more2"><a href="<%=request.getContextPath()%>/funding/main.do">더 알아보기</a></div>
          </li>
        </ul>
      </div>
      
      

      
    



		
			
			
			
	

 <c:import url="/footer.do"></c:import>
</body>
</html>