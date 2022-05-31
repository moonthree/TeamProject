<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" type="text/css" href="../resources/css/user_css/user.css">
<title>수정페이지</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	
	 <section class="main">
  
    <div class="container">
     <h2>수정</h2>
    <form class="was-validated border" action="service_modify.do" method="post">
    <input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
        <div class="form-row">
            <div class="col-md-6 mb-3">
              <label for="validationServer03">제목</label>
              <input name="sboard_title" value="${vo.sboard_title}" type="text" class="form-control is-invalid" id="validationServer03" aria-describedby="validationServer03Feedback" required>
              
            </div>
        
        </div>
        <label for="validationServer03"></label>
        <textarea id= "summernote" name="sboard_content"></textarea>
        <script>
	      $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 500
	      });
    </script> 
        <div id="my_modal">
            수정하시겠습니까?<br><br>
            <input type="submit" class="btn btn-primary" value="네">
            <!-- <a class="modal_close_btn"><input type="button" class="btn btn-primary" value="아니요"></a> -->
            <a href="service_view.do?sboard_idx=${vo.sboard_idx}"><input type="button" class="btn btn-primary" value="아니요"></a>
            <a class="modal_close_btn" style="cursor:pointer;">X</a>
        </div>
        
    </form>
    <div class="float-md-right">
			<button class="btn btn-primary" id="popup_open_btn">수정하기</button>
		</div>
    </div>
    </section>
			
			
			
	<script src="../resources/js/user/user.js"></script>
</body>
</html>