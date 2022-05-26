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
      
      <div class="contents1_bold">1. 스토어 프로젝트를 개설해요.</div>
      <div class="contents2">
        펀딩 프로젝트가 성공적으로 종료되면 펀딩 메이커 스튜디오에서 [스토어 시작하기]<br>
        버튼이 나타날 거예요. 버튼을 눌러 스토어 프로젝트를 개설할 수 있습니다.
		
		
      </div>

    </li>
	
	<li>
      
      <div class="contents1_bold">2. 프로젝트를 작성하고 제출해요.</div>
      <div class="contents2">
        스토어 메이커 스튜디오에서 판매를 위한 정보를 작성해요. 이 떄, 필수 항목이 누락되거나 부적절한 내용이 없는지 점검해 주세요.<br>
        단, 펀딩 프로젝트의 정산이 종료되지 않았거나 만족도 조건이 충족되지 않으면 제출이 어려울 수 있습니다.<br>
      </div>
    </li>
    
    <li>
      <div class="contents1_bold">3. 입점 심사를 기다려 주세요.</div>
      <div class="contents2">
        제출한 프로젝트는 담당자의 검토를 거쳐 승인됩니다.<br>
        상품이나 사업자정보에 오류가 있는 경우, 메일로 수정이 필요한 부분을 안내드릴 거예요.<br>
        입점이 어렵다고 판단되는 프로젝트로 확인된다면 메일로 입점 불가 안내를 드릴수 있습니다.
      </div>
    </li>
    
     <li>
      <div class="contents1_bold">4. 입점 승인을 받아요.</div>
      <div class="contents2">
        프로젝트에 이상이 없는 경우 입점이 승인됩니다. 
         <br>승인된 프로젝트는 '판매대기' 상태로 변경돼요.
     
      </div>
    </li>
    
    <li>
      <div class="contents1_bold">5. 판매를 시작하세요.</div>
      <div class="contents2">
       이제 스토어 메이커 스튜디오에서 [판매 오픈하기]를 눌러 판매를 시작할 수 있어요.
     
      </div>
    </li>
    
    
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>