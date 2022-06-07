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
<link rel="stylesheet" type="text/css" href="../resources/css/question_css/question_view.css">
<title>펫띵 스토어가 무엇인가요?</title>
<style type="text/css">
	
	.hh{text-align: center;}
</style>
</head>
<body>
	
	<c:import url="/header.do"></c:import>
	
	
	
	
	<div class="hh"><br><br>
	<img src="<%=request.getContextPath()%>/resources/image/111.png" class="img-fluid" alt="고객센터" height="300" width="200">
	</div>
  <div class="main_text0">
    
  <ul class="icons3">
    
    <li>
      
      <div class="contents1_bold">Petdding 스토어는 크라우드 펀딩을 성공적으로 마친 제품의 판로 개척을 위해 제공되는 서비스에요.<br>
       전자상거래법상 통신판매에 해당됩니다.</div>
    </li>
    
    <li>
      
      <div class="contents1_bold">1. 개발 중인 제품은 입점이 어려워요. </div>
      <div class="contents2">
        이에 따라 개발 중인 제품은 Petdding 스토어를 통해 상품을 공급할 수 없어요. 최종 양산된 제품만을 등록할 수 있습니다.<br>
        Petdding은 스토어 서비스 이용자의 보호를 위해 '전자상거래 등에서의 소비자보호에 관한 법률'에 의거하여 소비자의 청약철회 등의 권리 행사를 보장합니다.
		
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">2. 기존 펀딩의 리워드에서 개선된 점이 있나요?</div>
      <div class="contents2">
         진행했던 펀딩 프로젝트의 리워드를 개선하여 판매하고자 하는 경우, 개선된 정도에 따라 스토어 입점 가능 여부가 달라져요.<br>
         정보제공고시를 수정/추가하지 않아도 무방한 수준으로 개선된 제품은 스토어 입점이 가능하지만, <br>
         그 이상의 범위로 개선된 제품은 어려울 수 있습니다. 아래 카테고리 별 예시를 확인하고, 스토어 입점 가능 여부를 알아보세요.
         
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">3. 카테고리 별 예시를 확인하세요.</div>
      <div class="contents2">
        1)색상/용량/사이즈 추가<br>
        입점 가능: 펀딩 프로젝트에서 리워드로서 제공했던 제품에서 색상, 용량 또는 크기가 변경된 경우 등 본질적으로 기존 리워드와 달라지지 않은 제품은 스토어로 판매할 수 있어요.<br>
        입점 불가: 메인 리워드 자체가 개선 또는 변경된 경우 스토어 입점이 어려워요.<br><br>
        2) 묶음 상품 추가<br>
        입점 가능: 기존 펀딩 프로젝트에서 제공했던 메인 리워드와 연관된 제품은 묶음 상품으로 제공할 수 있어요.<br>
        함께 사용 시에 도움이 되거나 효용을 증가시키는 제품 등이 해당돼요.<br>
        
        
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">4. 추가 리워드의 서류와 상품정보제공고시를 준비해 주세요.</div>
      <div class="contents2">
        법적 필수 서류 대상 품목에 해당하는 경우, 추가 서류 제출이 필요합니다.<br><br>
        
        유통 이력이 있는 제품 : 법적 필수 서류 제출이 필요하지 않아요.<br>
        유통 이력이 없는 제품 : 품목군에 따른 법적 필수 서류 제출이 필요해요.<br>
        용량/컬러 추가에 따라 추가 인증이 필요한 제품: 생활화학제품/의약외품/어린이제품/식품은 추가 서류 제출이 필요해요.<br>
        푸드 제품의 경우, 용량이 변경되면 품목제조보고서 제출이 필요해요.<br>
        사이즈 추가에 따라  금형을 새로 제작하는 경우, 서류 제출이 필요해요.<br>
        색상 추가로 인한 모델명이 변경된 경우, 서류 제출이 필요해요.
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">5. 모든 리워드에 대한 상품정보제공고시를 작성해 주세요.</div>
      <div class="contents2">
        스토어로 판매하는 모든 제품의 상품정보제공고시 작성이 필요해요.<br><br>
        
        푸드 : [가공식품 정보제공고시(예시)]<br>
        1. 제품명<br>
        2. 식품의 유형<br>
        3. 생산자 및 소재지<br>
        4. 제조연월일, 유통기한 또는 품질 유지 기한<br>
        5. 포장단위별 내용물의 용량(중량), 수량<br>
        6. 원재료명 및 함량<br>
        7. 영양성분(의무 표시 대상에 한함)<br>
        8. 유전자변형식품에 해당하는 경우 표시<br>
        9. 소비자 안전을 위한 주의사항<br>
        10. 수입식품에 해당하는 경우 '수입식품안전관리법에 따른 수입신고를 필함' 문구<br>
        11. 소비자 상담 관련 전화번호
      </div>

    </li>
  
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>