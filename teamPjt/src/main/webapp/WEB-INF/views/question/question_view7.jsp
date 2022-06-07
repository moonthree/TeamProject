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
      
      <div class="contents1_bold">1.메이커/리워드 만족도 평가 모두 3.5 이상인 프로젝트</div>
      <div class="contents2">
        스토어 프로젝트 제출 시점을 기준으로 해요<br>
        만족도 기준을 충족하지 않는다면 제출이 어려워요.<br>
		
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">2.결제 완료 서포터 100명 혹은 펀딩 결제 완료 금액 1,000만 원 이상인 프로젝트</div>
      <div class="contents2">
        결제 완료 서포터는 결제 건수를 기준으로 해요 (펀딩 메이커 스튜디오 > 결제 현황 > 결제 완료 건수에서 확인할 수 있어요)<br>
        결제 완료 금액은 펀딩 모집 금액 중 결제 실패 건을 제외한 총 금액을 뜻해요 (펀딩 메이커 스튜디오 > 결제 현황 > 결제 완료 금액에서 확인할 수 있어요)<br>
		※ 모든 데이터는 1개의 프로젝트를 기준으로 충족되어야 해요
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">3. 사업자인 메이커의 프로젝트</div>
      <div class="contents2">
        사업자인 메이커님들만 스토어 입점 후 판매가 가능해요.<br>
        만약 개인으로 펀딩 프로젝트를 진행했다면 사업자 등록 후 사업자 등록증을 제출해 주세요.<br><br>
		※ 입점 조건을 만족했더라도 스토어 개설이 제한될 수 있어요<br>
		최종 정산이 완료되지 않은 프로젝트<br>
		리워드가 제공되지 않은 [ 기부·후원 ] 카테고리의 프로젝트<br>
		주류, 숙박업 등 19세 이상만 참여가 가능한 프로젝트<br>
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">Petdding 스토어 수수료 (부가세 별도)</div>
      <div class="contents2">
        Petdding 스토어 입점 수수료 : 10% (PG사 수수료 포함)<br>
        Petdding 온리 스토어 입점 수수료 : 20% (PG사 수수료 포함)<br>
      </div>

    </li>

    
    
    
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>