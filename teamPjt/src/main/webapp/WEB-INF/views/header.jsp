<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</script>
</head>
<body>
	<div class="container">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #CCFF90;">
  <div class="container-fluid">
  <!-- Ttile 변경 - Logo 변경 -->
  <!--   <a class="navbar-brand" href="#">Petdding</a> -->
  <img width="100px" height="100px"   src="resources/image/111.png"/>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        <!-- 펀딩 페이지 이동 -->
          <a class="nav-link active" aria-current="page" href="#">펀딩</a>
        </li>
        <li class="nav-item">
         <!-- 스토어 페이지 이동 -->
          <a class="nav-link" href="#">스토어</a>
        </li>
        <!-- 메뉴 바 구성요소 변경 가능 -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            더보기
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">공지사항</a></li>
            <li><a class="dropdown-item" href="#">소개</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">고객센터</a></li>
          </ul>
        </li>
        <li class="nav-item">
        </li>
      </ul>
      <!--  검색창과 로그인 회원가입 버튼 등록 -->
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button style="margin-right: 100px"  class="btn btn-outline-success" type="submit">Search</button>
		 
      </form>
     <nav aria-label="breadcrumb">
  	<ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="login.do">로그인</a></li>
	    <li class="breadcrumb-item"><a href="#">회원가입</a></li>
       </ol>
       </nav>
    </div>
  </div>
  
</nav>
</div>
</body>
</html>