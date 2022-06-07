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
      
      <div class="contents1_bold">1. 상품을 상시 판매 할 수 있어요.</div>
      <div class="contents2">
        Petdding 스토어는 온라인 펀딩 플랫폼이 아닌 커머스 플랫폼입니다.<br>
        펀딩을 통해 검증된 제품·서비스를 상시 판매할 수 있어요.<br>
		펀딩과 다르게 Petdding 스토어에서는<br><br>
		<ul>
			<li>★ 구매 즉시 결제돼요.</li>
			<li>★ 결제 후 바로 배송이 진행돼요.</li>
			<li>★ 단순 변심·배송 문제 등으로 교환·환불이 가능해요.</li>
		</ul>

      </div>

    </li>

    <li>
      
      <div class="contents1_bold">2. 펀딩에 성공한 리워드, 펫띵에서 이렇게 소개하세요.</div>
      <div class="contents2">
        앵콜 프로젝트: 동일한 제품으로 다시 프로젝트를 진행하는 경우 / 동일하지만 일부분이 개선된 리워드로 프로젝트를 진행하는 경우
		<br>스토어 프로젝트: 동일한 제품으로 다시 프로젝트를 진행하는 경우 (펀딩보다는 상시 판매를 원하는 경우)
      </div>
      
    </li>
    <li>
    	<div class="contents1_bold">3. 스토어는 전자상거래 법이 적용돼요.</div>
      <div class="contents2">
      	스토어는 펀딩이 아닌 커머스(판매) 플랫폼입니다. 서포터의 단순 변심에 따른 반품 신청이 가능해요.<br>
      	반품 신청 기간: 상품 수령 후 7일 이내 가능. <br>
      	하자 발견 시 반품 문의 가능 기간: 기본 반품 신청 기간 이후에도 하자 발견 시점으로 30일 이내 문의가 가능합니다.<br>
      	 제품 발송 완료 후 3개월 이내, 혹은 사실을 안 날로부터 30일 이내 하자로 인한 반품 문의를 할 수 있어요.
      </div>
    
    </li>
    <li>
    	<div class="contents1_bold">3. 스토어는 전자상거래 법이 적용돼요.</div>
      <div class="contents2">
      	스토어는 펀딩이 아닌 커머스(판매) 플랫폼입니다. 서포터의 단순 변심에 따른 반품 신청이 가능해요.<br>
      	반품 신청 기간: 상품 수령 후 7일 이내 가능. <br>
      	하자 발견 시 반품 문의 가능 기간: 기본 반품 신청 기간 이후에도 하자 발견 시점으로 30일 이내 문의가 가능합니다.<br>
      	 제품 발송 완료 후 3개월 이내, 혹은 사실을 안 날로부터 30일 이내 하자로 인한 반품 문의를 할 수 있어요.
      </div>
    
    </li>
    
    
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>