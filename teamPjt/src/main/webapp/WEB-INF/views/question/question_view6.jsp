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
      
      <div class="contents1_bold">1. 서포터는 이럴 때 환불을 신청할 수 있어요.</div>
      <div class="contents2">
        서포터는 상품을 받고 7일 동안 단순 변심으로 환불을 신청할 수 있어요.<br>
        서포터는 상품을 받고 90일 동안 하자를 이유로 환불(반품)을 신청할 수 있어요.<br>
		서포터는 상품을 받고 상품의 하자를 알게 된 날로부터 30일 동안 하자를 이유로 환불(반품)을 신청할 수 있어요<br>
		주문 제작 상품은 ‘상품 준비 중’일 때 서포터가 환불을 신청하지 않도록 사전에 소통해 주세요.
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">2. 메이커는 이럴 때 환불을 처리할 수 있어요.</div>
      <div class="contents2">
        메이커는 부득이한 일이 발생했다면 서포터의 주문을 직접 취소(환불 처리)할 수 있어요.<br>
        메이커는 구매 확정 후 90일 동안 서포터와 협의해서 직접 취소(환불 처리)할 수 있어요.<br>
		직접 취소를 할 때 결제 금액의 환불이 진행되는데, 취소를 철회할 수 없으니 신중하게 결정해 주세요.
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">3. 직접 취소는 이렇게 할 수 있어요.</div>
      <div class="contents2">
      	스토어 메이커 스튜디오에서 [판매 관리] 메뉴에 들어가 직접 취소하려는 주문 번호의 ‘메이커 직접 취소’를 눌러요.<br>
      	직접 취소하는 사유를 선택하고 상세 내용을 입력하면 직접 취소됩니다.<br>
      	주문 상태 별 선택할 수 있는 취소 사유는 아래와 같아요. 해당하는 사유를 하나씩 선택할 수 있어요.<br>
      	상품 준비 중 : 서포터의 단순 변심, 배송 문제, 상품 품절<br>
      	배송 대기 중, 배송 중, 배송 완료, 수령 완료 : 서포터의 단순 변심, 배송 문제, 상품 하자<br>
      	구매 확정 : 상품 하자<br>
      </div>  

    </li>

    
    
    
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>