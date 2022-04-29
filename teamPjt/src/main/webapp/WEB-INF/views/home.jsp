<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    
<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
	
	<link rel="stylesheet" type="text/css" href="resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css">
</head>

<body>

<c:import url="/header.do"></c:import>
<!-- 헤더 끝 -->

<!-- 메인 시작 
section01 : 취향 맞춤 프로젝트
section02 : 실시간 랭킹
section03 : 스토어 추천 제품
section04 : 새로 오픈한 프로젝트
 -->
<main>
       <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators">
               <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
               <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
               <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
           </ol>
           <div class="carousel-inner">
               <div class="carousel-item active">
                   <img src="resources/image/home/dogbob.png" class="d-block w-100" alt="...">
                   <div class="carousel-caption d-none d-md-block">
                       <h3 class="main_image_h3"></h3>
                       <p class="main_image_p"></p>
                   </div>
               </div>
               <div class="carousel-item">
                   <img src="resources/image/home/cattower.png" class="d-block w-100" alt="...">
                   <div class="carousel-caption d-none d-md-block">
                       <h3 class="main_image"></h3>
                       <p></p>
                   </div>
               </div>
               <div class="carousel-item">
                   <img src="resources/image/home/dogbob2.png" class="d-block w-100" alt="...">
                   <div class="carousel-caption d-none d-md-block">
                       <h3 class="main_image"></h3>
                       <p></p>
                   </div>
               </div>
           </div>
           <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
           </button>
           <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"> </span>
               <span class="sr-only">Next</span>
           </button>   
       </div>
       
       <section id="section01">
           <div class="container">
               <div class="row">
                   <!-- 취향 맞춤 펀딩 프로젝트 -->               
                   <div class="col-lg-8 col-sm-12 section01_taste">
                       <h3 class="section01_h3">취향 맞춤 펀딩 프로젝트</h3>
                       <p class="section01_p">지금 함께 만드는 성공                   
                           <span data-toggle="tooltip" data-placement="right" title="선택하신 선호동물을 반영하여 맞춤 프로젝트를 추천해요" style="float:right;">
                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-question-circle"
                                   viewBox="0 0 16 18">
                                   <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                   <path
                                       d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                               </svg>
                           </span>
                       </p>
                       <div class="row">
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                           <div class="col-sm">
                               <div class="card section01_card">
                                   <img src="resources/image/funding_main/doghome.png" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <p class="card-text">
                                           <!-- 글자 수 제한하기 -->
                                           밀리옹 베이글백 아이보리 브릭 강아지...
                                       </p>
                                       <p class="card_text02">
                                           2,000% <span>| 강아지</span>
                                       </p>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                   <!-- 실시간 랭킹 -->
                   <div class="col-lg-4 col-sm-12 section01_rank">
                       <h3 class="section01_h3">실시간 랭킹</h3>
                       <span data-toggle="tooltip" data-placement="right" title="조회수를 기준으로 참여자가 많은 순으로 노출되요" style="float:right;">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle"
                               viewBox="0 0 16 18">
                               <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                               <path
                                   d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                           </svg>
                       </span>
                       <ul class="nav nav mb-3" id="pills-tab" role="tablist">
                           <li class="nav-item section01_nav" role="presentation">
                               <a class="nav-link active" id="pills-funding-tab" data-toggle="pill" href="#pills-funding" role="tab"
                                   aria-controls="pills-funding" aria-selected="true">펀딩</a>
                           </li>
                           <li class="nav-item section01_nav" role="presentation">
                               <a class="nav-link" id="pills-store-tab" data-toggle="pill" href="#pills-store" role="tab"
                                   aria-controls="pills-store" aria-selected="false">스토어</a>
                           </li>
                           
                       </ul>
                       <div class="tab-content" id="pills-tabContent">
                           <!--펀딩 랭킹-->
                           <div class="tab-pane fade show active" id="pills-funding" role="tabpanel" aria-labelledby="pills-funding-tab">
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text section01_rank_text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   2,000% <span>|</span> <span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text section01_rank_text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   2,000% <span>|</span> <span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text section01_rank_text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   2,000% <span>|</span> <span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text section01_rank_text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   2,000% <span>|</span> <span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text section01_rank_text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   2,000% <span>|</span> <span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               
                               
                           </div>
                           <!--스토어 랭킹-->
                           <div class="tab-pane fade" id="pills-store" role="tabpanel" aria-labelledby="pills-store-tab">
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                               <div class="card mb-3 section01_rank_card">
                                   <div class="row no-gutters">
                                       <div class="col-1 card_rank_num">
                                           1
                                       </div>
                                       <div class="col-7">
                                           <div class="card-body">
                                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                                               <p class="card_rank_text02">
                                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                                               </p>
                                           </div>
                                       </div>
                                       <div class="col-4 section01_rank_img01">
                                           <img src="resources/image/home/catsand.png" class="section01_rank_img" alt="...">
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               <hr style="margin-top: 0px;">
           </div>
       </section>
       <!-- section01 끝-->

       <!-- section02 (스토어 추천 제품)-->
       <section>
           <div class="container section03">
               <h3 class="section03_h3">스토어 추천 제품</h3>
               <p class="section03_p">팬들이 인정한 성공 펀딩 집합샵
                   <span class="tooltip" data-toggle="tooltip" data-placement="right" title="선택하신 선호동물을 반영하여 맞춤 프로젝트를 추천해요" style="float:right;">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle"
                           viewBox="0 0 16 18">
                           <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                           <path
                               d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                       </svg>
                   </span>
               </p>
               <div class="row section03_carttop">
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-4 col-6">
                       <div class="card section03_card">
                           <img src="resources/image/home/catsand.png" class="card-img-top" alt="...">
                           <div class="card-body">
                               <p class="card-text">집사공감 먼지없는 벤토나이트 고양이 모래 6.35kg...</p>
                               <p class="card_store_text02">
                                   25,000<span class="won">원</span>&nbsp;<span>|</span>&nbsp;<span>고양이</span>
                               </p>
                           </div>
                       </div>
                   </div>
                   
               <!--row 끝-->
               </div>
           </div>
       </section>
       <!--section03 끝-->

       <!--section04 신규 펀딩-->
       <section>
           <div class="container section04">
               <h3 class="section04_h3">주목하세요! 새로 오픈한 프로젝트</h3>
               <p class="section04_p">반려동물을 위한 새로운 아이디어</p>
               <div class="row section04_row01">
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/cattoilet.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">[고양이를 키우는] CEO 집사가 만든 다프스 고양이 통돌이 화장실</p>
                                
                                   <p class="section04_funding">70% <span>펀딩</span></p>
                                   <p class="card-title">오늘 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/dogseat.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">사르르 녹아 스르륵 잠드는 굽개눕개 강아지 팬케이크 방석</p>
                                   <p class="section04_funding">110% <span>펀딩</span></p>
                                   <p class="card-title">3일전 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/cattoilet.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">[고양이를 키우는] CEO 집사가 만든 다프스 고양이 통돌이 화장실</p>
                   
                                   <p class="section04_funding">70% <span>펀딩</span></p>
                                   <p class="card-title">5일전 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
               <!--row 끝-->
               </div>
               <div class="row section04_row01">
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/dogseat.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">사르르 녹아 스르륵 잠드는 굽개눕개 강아지 팬케이크 방석</p>
                                   <p class="section04_funding">110% <span>펀딩</span></p>
                                   <p class="card-title">3일전 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/dogseat.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">사르르 녹아 스르륵 잠드는 굽개눕개 강아지 팬케이크 방석</p>
                                   <p class="section04_funding">110% <span>펀딩</span></p>
                                   <p class="card-title">3일전 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-4">
                       <div class="row no-gutters section04_card">
                           <div class="col-6">
                               <img src="resources/image/home/cattoilet.png" class="section04_img" alt="...">
                           </div>
                           <div class="col-6">
                               <div class="card-body section04_card_text">
                                   <p class="card-text">[고양이를 키우는] CEO 집사가 만든 다프스 고양이 통돌이 화장실</p>
               
                                   <p class="section04_funding">70% <span>펀딩</span></p>
                                   <p class="card-title">5일전 오픈!</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <!--row 끝-->
               </div>
           </div>
       </section>
   </main>

<footer>
        <div style="border: 1px solid lightgray;">
            <div class="container">
                <div class="row" style="align-items: center; line-height: 3;">
                    <div class="col-lg-2 col-sm-6" >
                        <div>
                            <a href="#">
                                공지사항
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="12" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z" />
                                    <path fill-rule="evenodd"
                                        d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z" />
                                </svg>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-6">
                        <div>
                            <ul class="nav-item dropdown" style="padding-left: 0px; margin: 0 auto;">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                                    SNS
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                    <li>
                                        <a href="https://www.youtube.com/">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-youtube"
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                                            </svg>
                                            유튜브
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.instagram.com/">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram"
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                                            </svg>
                                            인스타그램
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://twitter.com/">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter"
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                                            </svg>
                                            트위터
                                        </a>
                                    </li>
                                </ul>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                    <div class="col-lg-2 col-sm-6">
                        <ul class="nav-item dropdown" style="padding-left: 0px; margin: 0 auto;">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown"
                                aria-expanded="false">
                                제휴문의
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li>
                                    <div style="font-weight: bold;">광고 서비스 문의</div>
                                    <div style="font-size: 11pt;">pdAD@petdding.kr</div>
                                </li>
                                <li>
                                    <div style="font-weight: bold;">파트너 제휴 문의</div>
                                    <div style="font-size: 11pt;">pdPartnership@petdding.kr</div>
                                </li>
                                <li>
                                    <div style="font-weight: bold;">IP 제휴 문의</div>
                                    <div style="font-size: 11pt;">pdIP@petdding.kr</div>
                                </li>
                            </ul>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-sm-6">
                        <a href="#">정책 · 약관
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z" />
                                <path fill-rule="evenodd"
                                    d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z" />
                            </svg>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-6">
                        <a href="#">개인정보처리방침
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z" />
                                <path fill-rule="evenodd"
                                    d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <div style="margin: 20px 0px; padding-bottom: 50px;">
        <div class="container">
            <div class="row" style="line-height: 2;">
                <div class="col-lg-6 col-sm-12">
                    <div>
                        <div style="display: inline-block; padding-right: 20px; text-align: center; font-weight: bold;">소비자 고객센터<br>1111-1111</div>
                        <div style="display: inline-block; padding-left: 20px; border-left: 2px solid lightgray; text-align: center; font-weight: bold;">사업자 고객센터<br>2222-2222</div>
                    </div>
                    <div style="font-size: small; margin: 10px 0px; color: gray;">
                        	상담 가능 시간 : 평일 오전 9시 ~ 오후 6시 (주말, 공휴일 제외)
                    </div>
                <br>
                <div style="margin-bottom: 20px;">
                    <div style="font-weight: bold;">이메일(24시간 접수 가능)</div>
			                    펀딩 : help.funding@petdding@.kr<br>
			                    스토어 : help.store@petdding@.kr<br>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
		                펫딩㈜ <span class="verticalbar">|</span> 대표이사 펫딩딩 <span class="verticalbar">|</span> 사업자등록번호 000-00-00000<br>
		                전라북도 전주시 덕진구 백제대로 572 4층 407호<br>
                © petdding Co., Ltd.
            </div>
        </div>
    </div>
</footer>


<script>
    $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
</script>
</body>


</html>