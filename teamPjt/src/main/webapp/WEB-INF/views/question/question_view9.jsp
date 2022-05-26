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
      
      <div class="contents1_bold">입점 후에는 상품의 재고와 금액, 노출 여부를 제외한 항목들은 모두 수정이 불가능해요.<br>
      	 아래 내용을 꼼꼼히 확인해 보시고, 잘못된 상품 정보가 등록되지 않도록 찬찬히 따라해 보세요.</div>
    </li>
    
    <li>
      
      <div class="contents1_bold">1. 상품의 노출 유형을 정해요</div>
      <div class="contents2">
        스토어 프로젝트를 작성하고 있을 때는 이미지형과 목록형 중에서 원하는 노출 유형을 자유롭게 전환할 수 있어요. <br>
        이미지형과 목록형의 차이는 아래와 같아요.<br><br>
        이미지형은 상품마다 등록한 이미지가 함께 노출돼요.<br>
        목록형은 이미지 없이 상품 정보만 노출돼요.
		
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">2. 상품 정보를 등록해요</div>
      <div class="contents2">
         총 8가지 정보를 등록해 주세요. 재고와 금액, 노출 여부를 제외한 다른 상품 정보들은 입점 후 수정이 불가능하니 하나씩 천천히 입력해 주세요.<br><br>
         1) 상품 금액<br>
         펀딩으로 제품이나 서비스를 소개했을 때 메이커님을 믿고 긴 시간 기다려 주었던 서포터들을 위해, 펀딩 가격보다 낮은 가격으로 설정하는 건 피해 주세요.<br>
         상품 금액은 입점 후에도, 별도의 수정 요청을 접수할 필요 없이 스튜디오의 상품 금액란에서 직접 수정할 수 있어요.<br><br>
         2) 상품 설명<br>
         각인 서비스를 제공하거나 옵션을 3개 이상 설정해야 한다면 ‘상품 설명’에 <주문 요청 사항>을 어떻게 입력하면 될지 안내해 주세요.<br>
         서포터들이 정확하게 요청할 수 있도록 도와줍니다.<br>
         예시 1) 각인 서비스를 신청하는 분들은 <주문 요청 사항>에 원하는 문구를 입력해 주세요<br>
         예시 2) 원하는 색상 세 가지를 <주문 요청 사항>에 입력해 주세요.<br><br>
         3) 상품 이미지<br>
         노출 유형을 ‘이미지형’으로 선택했을 때 해당해요<br>
         2MB 이하의 JPEG, GIF, PNG 파일을 업로드할 수 있습니다<br>
         해상도 320X320 픽셀 이상으로 등록해 주세요. 너무 흐린 이미지는 깨져 보입니다<br>
         상품마다 한 장씩만 등록할 수 있어요.<br>
         이미지 비율은 1:1 정방형으로 골라 보세요. 상품이 이미지 중앙에 위치한 게 좋습니다.<br><br>
         4) 배송지 입력<br>
         실물의, 유형의 제품이 제공된다면 배송지 입력이 필요합니다<br>
         컨설팅이나 촬영권처럼 무형의 서비스가 제공된다면 배송지 입력이 필요하지 않아요<br><br>
         5) 노출 여부<br>
         노출 여부는 입점 후, 와디즈 스토어에서 판매 중일 때에도 실시간으로 변경할 수 있어요.<br>
         ‘노출’로 설정한 상품들만 서포터들에게 보입니다. 단, 최소한 1개 이상의 상품이 노출되어야 판매가 가능해요.<br><br>
         6) 옵션 설정<br>
         상품의 옵션을 ‘설정’으로 선택하면 옵션명과 옵션값을 입력할 수 있어요.<br>
         옵션 명은 최대 2개까지 설정할 수 있고, 옵션값은 쉼표(,)로 구분됩니다.<br>
         옵션 목록 적용↓’ 버튼을 누르면 옵션명과 옵션값을 조합해 가능한 모든 경우의 수가 옵션 목록에 노출됩니다.<br>
         옵션을 수정해 ‘옵션 목록 적용 ↓’을 다시 누르면 먼저 입력되었던 데이터는 모두 삭제되고, 새로운 옵션이 적용돼요.<br>
         상품의 옵션이 없다면 ‘설정 안 함’을 선택하면 됩니다.<br><br>
         7) 재고 수량<br><br>
         입점 후 판매 중일지라도 재고는 실시간으로 변동할 수 있어요.<br>
         재고 수량이 0으로 설정되면 자동으로 상품은 품절 처리되며, 최대 입력 가능한 수량은 99,999,999 개입니다.<br><br>
         8) 대표 상품 설정<br>
         노출 상태인 상품들 중 ‘대표 상품’을 설정하면 스토어 목록에 대표 상품으로 설정한 상품의 가격이 보여요.<br>
         메이커님의 상품들을 대표하는 가격처럼 보일 수 있으니 신중하게 골라 주세요.
         
         

         
         
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">3. 상품을 삭제하고 싶은가요?</div>
      <div class="contents2">
        상품을 삭제하면 등록해둔 내용 모두가 사라집니다. 주의해 주세요.
        
      </div>

    </li>
  
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>