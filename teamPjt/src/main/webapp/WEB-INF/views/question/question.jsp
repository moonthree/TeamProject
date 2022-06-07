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
<link rel="stylesheet" type="text/css" href="../resources/css/question_css/question.css">
    <title>펫띵 문의사항</title>
    
    <style type="text/css">
			.hh{margin:auto;
				margin-top:100px;
				margin-bottom: 20px;
			}
			.hk{margin:auto;
				margin-top:100px;
				text-align:center;
				font-weight: bold;
			}
			
	 
	</style>
    


</head>
<body>
<c:import url="/header.do"></c:import>
<div class="main_text0">
        <h1 class="hh">문의사항</h1>
        <div class="contents1">자주하는 질문</div>
        
        <ul class="icons">
          <li>
            
            <div class="contents1_bold">펫띵 스토어가 무엇인가요?</div>
            <div class="contents2">
                소비자에게인정 받은 제품을 언제든지 판매할 수 있어요.
            </div>
            <div class="more1">
              <a href="<%=request.getContextPath()%>/question/question_view1.do">MORE</a>
            </div>
          </li>

          <li>
            
            <div class="contents1_bold">펫띵 스토어와 펀딩은 어떻게 다른가요?</div>
            <div class="contents2">
                펫띵 스토어는 펀딩이 아닌 <br>커머스 플랫폼입니다.
            </div>
            <div class="more1">
              <a href="<%=request.getContextPath()%>/question/question_view2.do">MORE</a>
            </div>
          </li>

          <li>
            
            <div class="contents1_bold">펫띵배송 상품이 뭔가요?</div>
            <div class="contents2">
                 펫띵이 판매자가 되어 <br>책임지고 배송해드려요!
            </div>
            <div class="more1">
             <a href="<%=request.getContextPath()%>/question/question_view3.do">MORE</a>
            </div>
          </li>
        </ul>
        
        <ul class="icons2">
        <li>
          
          <div class="contents1_bold">스토어 판매를 중단/재개하고 싶으면 <br>어떻게 하나요?</div>
          <div class="contents2">
               스토어 판매를 중단하거나 재개하고 싶다면 <br> 고객센터에 요청서를 접수해 주세요.
          </div>
          <div class="more1">
           <a href="<%=request.getContextPath()%>/question/question_view4.do"> MORE</a>
          </div>
        </li>

        <li>
          
          <div class="contents1_bold">펫띵 스토어 입점 과정이 어떻게 되나요?</div>
          <div class="contents2">
              펫띵 스토어 입점 프로세스를 확인하세요.
          </div>
          <div class="more1">
           <a href="<%=request.getContextPath()%>/question/question_view5.do"> MORE</a>
          </div>
        </li>

        <li>
          
          <div class="contents1_bold">스토어 프로젝트의 환불과 취소 정책이 궁금해요</div>
          <div class="contents2">
              펀딩금 반환과는 정책이 달라요.
          </div>
          <div class="more1">
           <a href="<%=request.getContextPath()%>/question/question_view6.do"> MORE</a>
          </div>
        </li>
      </ul>
    

	    <ul class="icons2">
	      <li>
	        
	        <div class="contents1_bold">스토어 입점 기준과 수수료는 무엇인가요?</div>
	        <div class="contents2">
	            스토어 입점 기준과 수수료를 안내해 드릴게요.
	        </div>
	        <div class="more1">
	         <a href="<%=request.getContextPath()%>/question/question_view7.do"> MORE</a>
	        </div>
	      </li>
	
	      <li>
	        
	        <div class="contents1_bold">타 커머스에서도 동시 판매가 가능한가요?</div>
	        <div class="contents2">
	            펫띵 스토어는 '펀딩'과는 달리 <br>동시 판매가 가능합니다.
	        </div>
	        <div class="more1">
	          <a href="<%=request.getContextPath()%>/question/question_view8.do">MORE</a>
	        </div>
	      </li>
	
	      <li>
	        
	        <div class="contents1_bold">스토어에 상품을 등록하고 싶어요.</div>
	        <div class="contents2">
	            입점 후 수정이 불가능한 항목들이 있어요. <br>상품 정보는 꼼꼼히 확인해 주세요.
	        </div>
	        <div class="more1">
	          <a href="<%=request.getContextPath()%>/question/question_view9.do">MORE</a>
	        </div>
	      </li>
	    </ul>
	  
	
		  <ul class="icons2">
		    <li>
		      
		      <div class="contents1_bold">펫띵 스토어 입점 상품 조건이 궁금해요.</div>
		      <div class="contents2">
		          기존 펀딩 프로젝트와 다른 리워드는 <br>스토어 입점이 어려울 수 있어요.
		      </div>
		      <div class="more1">
		       <a href="<%=request.getContextPath()%>/question/question_view10.do"> MORE</a>
		      </div>
		    </li>
		
		    <li>
		      
		      <div class="contents1_bold">배송 전인데 배송지를 변경할 수 있나요?</div>
		      <div class="contents2">
		          결제 완료된 주문 건의 배송지 변경은 <br>불가능합니다.
		      </div>
		      <div class="more1">
		        <a href="<%=request.getContextPath()%>/question/question_view11.do">MORE</a>
		      </div>
		    </li>
		
		    <li>
		      
		      <div class="contents1_bold">펫띵 스토어 상품은 합배송이 가능한가요?</div>
		      <div class="contents2">
		           펫띵 스토어는 합배송이 불가능합니다.
		      </div>
		      <div class="more1">
		       <a href="<%=request.getContextPath()%>/question/question_view12.do"> MORE</a>
		      </div>
		    </li>
		    
		  </ul>
        
      </div>
      

  <div class="hk">
     펫띵배송 상품 등 궁금하신 점은 모두 펫띵 고객센터로 문의해주세요.<br>
	 펫띵 고객센터로 상담하기<br><br>
	
	<ul>
		<li>★ 펫띵 대표 고객센터 : 1111-1111</li>
		<li>★ 펫띵 펀딩상담 : help.funding@petdding.com</li>
		<li>★ 펫띵 스토어상담 : help.store@petdding.com</li>
		<li>★ 이메일(24시간 접수 가능)</li>
	</ul>
   </div>
   
   		<div class="main_text2">
      
        <ul>
          <li>
            <div><h1>CONTACT</h1></div>
            <a class="navtext" href="<%=request.getContextPath()%>/store/store_main.do">스토어</a>
            <div class="more2"><a href="<%=request.getContextPath()%>/store/store_main.do">더 알아보기</a></div>
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