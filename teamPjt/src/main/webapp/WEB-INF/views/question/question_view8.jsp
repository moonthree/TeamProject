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
      
      <div class="contents1_bold">1. 동시 판매가 가능해요.</div>
      <div class="contents2">
        펫띵 스토어는 펀딩과는 달리 동시 판매가 가능해요.<br>
        펫띵 스토어에서 제품을 판매하는 공안, 타 커머스나 자사몰 등을 통해 제품을 판매할 수 있어요.<br>
		
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">2. 단, 펫띵 온리 상품은 동시 판매할 수 없어요.</div>
      <div class="contents2">
         펫띵 온리로 입점할 경우, 계약 기간 동안 자사몰이 아닌 다른 플랫폼에서 동시 판매할 수 없어요.<br>
      </div>

    </li>
    
    <li>
      
      <div class="contents1_bold">3. 자사몰이 무엇인가요?</div>
      <div class="contents2">
        메이커님께서 직접 운영하시는 온/오프라인 쇼핑몰이나, 자사몰처럼 운영 중인 네이버 스마트스토어가 해당됩니다.<br>
        
      </div>

    </li>
  
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>