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
      
      <div class="contents1_bold">스토어 판매를 중단하거나 재개하고 싶다면 [스토어] 판매 중단/재개 요청서를 접수해 주세요.</div>
      <div class="contents2">
        접수 내역이 확인되면 3 영업일 내 처리를 도와드릴게요.<br>
        판매 종료 시 펫띵 사이트에서 검색 되지 않아요. 
        다만, 해당 프로젝트의 링크가 있다면 접속 가능하고 사이트에서는 [판매 종료] 상태로 노출됩니다.<br>
		메이커 스튜디오에서 직접 [판매 오픈하기] 버튼을 눌러야 최종 판매가 가능한 상태로 바뀌어요.
		<br><br>
		잠깐! 위 내용은 스토어 메이커님을 위한 가이드에요.<br>
		펀딩 프로젝트의 취소 및 중단을 원한다면 펀딩팀(help.store@petdding.com)로 문의 주세요.
		

      </div>

    </li>

   
    
    
  </ul>
</div>

	
		
 <c:import url="/footer.do"></c:import>
</body>
</html>