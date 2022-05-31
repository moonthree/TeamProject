<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<html>
<head>
	<title>펫딩 홈페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    
<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
	
	<link rel="stylesheet" type="text/css" href="resources/css/home.css">
</head>

<body>
<c:import url="/header.do"></c:import>


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
               	   <a href="event/event_view.do?member_idx=1">
                   <img src="resources/image/home/event1.png" class="d-block w-100" alt="...">
                   </a>
                   <div class="carousel-caption d-none d-md-block">
                       <h3 class="main_image_h3"></h3>
                       <p class="main_image_p"></p>
                   </div>
               </div>
               <div class="carousel-item">
               	   <a href="event/event_view.do?member_idx=2">
                   <img src="resources/image/home/cattower.png" class="d-block w-100" alt="...">
                   </a>
                   <div class="carousel-caption d-none d-md-block">
                       <h3 class="main_image"></h3>
                       <p></p>
                   </div>
               </div>
               <div class="carousel-item">
               	   <a href="event/event_view.do?member_idx=7">
                   <img src="resources/image/event/01_main.png" class="d-block w-100" alt="...">
                   </a>
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
                       	   <c:if test="${login eq null}">
                       	   		<c:forEach var="item" items="${fundHomeAll}">
                       	   			<div class="col-sm-4">
		                               <div class="card section01_card hover_card">
		                               	   <a href="funding/view.do?funding_idx=${item.funding_idx}">
		                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
		                                   </a>
		                                   <div class="card-body">
		                                       <p class="card-text section01_title">
		                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
		                                           		${item.funding_title}
		                                           </a>
		                                       </p>
		                                       <p class="card_text02">
		                                           ${Math.round(item.funding_current_price/item.funding_target_price*100)}%
		                                           <span>| 
			                                           <c:if test="${item.funding_category eq 0}">
							                        		강아지
							                        	</c:if>
							                        	<c:if test="${item.funding_category eq 1}">
							                        		고양이
							                        	</c:if>
							                        	<c:if test="${item.funding_category eq 2}">
							                        		반려동물
							                        	</c:if>
		                                           </span>
		                                       </p>
		                                   </div>
		                               </div>
		                           </div>
                       	   		</c:forEach>
                       	   </c:if>
                       	   <c:if test="${login ne null}">
                       	   		<c:choose>
                       	   			<c:when test="${login.member_pet eq 0}">
                       	   				<c:forEach var="item" items="${fundHomeDog}">
		                       	   			<div class="col-sm-4">
				                               <div class="card section01_card hover_card">
				                               	   <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
				                                   </a>
				                                   <div class="card-body">
				                                       <p class="card-text section01_title">
				                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                           		${item.funding_title}
				                                           </a>
				                                       </p>
				                                       <p class="card_text02">
				                                           ${Math.round(item.funding_current_price/item.funding_target_price*100)}%
				                                           <span>| 
					                                           <c:if test="${item.funding_category eq 0}">
									                        		강아지
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 1}">
									                        		고양이
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 2}">
									                        		반려동물
									                        	</c:if>
				                                           </span>
				                                       </p>
				                                   </div>
				                               </div>
				                           </div>
		                       	   		</c:forEach>
                       	   			</c:when>
                       	   			<c:when test="${login.member_pet eq 1}">
                       	   				<c:forEach var="item" items="${fundHomeCat}">
		                       	   			<div class="col-sm-4">
				                               <div class="card section01_card hover_card">
				                               	   <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
				                                   </a>
				                                   <div class="card-body">
				                                       <p class="card-text section01_title">
				                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                           		${item.funding_title}
				                                           </a>
				                                       </p>
				                                       <p class="card_text02">
				                                           ${Math.round(item.funding_current_price/item.funding_target_price*100)}%
				                                           <span>| 
					                                           <c:if test="${item.funding_category eq 0}">
									                        		강아지
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 1}">
									                        		고양이
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 2}">
									                        		반려동물
									                        	</c:if>
				                                           </span>
				                                       </p>
				                                   </div>
				                               </div>
				                           </div>
		                       	   		</c:forEach>
                       	   			</c:when>
                       	   			<c:when test="${login.member_pet eq 2}">
                       	   				<c:forEach var="item" items="${fundHomeOther}">
		                       	   			<div class="col-sm-4">
				                               <div class="card section01_card hover_card">
				                               	   <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
				                                   </a>
				                                   <div class="card-body">
				                                       <p class="card-text section01_title">
				                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                           		${item.funding_title}
				                                           </a>
				                                       </p>
				                                       <p class="card_text02">
				                                           ${Math.round(item.funding_current_price/item.funding_target_price*100)}%
				                                           <span>| 
					                                           <c:if test="${item.funding_category eq 0}">
									                        		강아지
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 1}">
									                        		고양이
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 2}">
									                        		반려동물
									                        	</c:if>
				                                           </span>
				                                       </p>
				                                   </div>
				                               </div>
				                           </div>
		                       	   		</c:forEach>
                       	   			</c:when>
                       	   			<c:otherwise>
                       	   				<c:forEach var="item" items="${fundHomeDog}">
		                       	   			<div class="col-sm-4">
				                               <div class="card section01_card hover_card">
				                               	   <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
				                                   </a>
				                                   <div class="card-body">
				                                       <p class="card-text section01_title">
				                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                           		${item.funding_title}
				                                           </a>
				                                       </p>
				                                       <p class="card_text02">
				                                           ${Math.round(item.funding_current_price/item.funding_target_price*100)}%
				                                           <span>| 
					                                           <c:if test="${item.funding_category eq 0}">
									                        		강아지
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 1}">
									                        		고양이
									                        	</c:if>
									                        	<c:if test="${item.funding_category eq 2}">
									                        		반려동물
									                        	</c:if>
				                                           </span>
				                                       </p>
				                                   </div>
				                               </div>
				                           </div>
		                       	   		</c:forEach>
                       	   			</c:otherwise>
                       	   		</c:choose>
                       	   </c:if>
                       </div>
                   </div>
                   <!-- 실시간 랭킹 -->
                   <div class="col-lg-4 col-sm-12 section01_rank">
                       <h3 class="section01_h3">실시간 랭킹</h3>
                       <span data-toggle="tooltip" data-placement="right" title="조회수를 기준으로 랭킹을 산정하여 노출되요" style="float:right;">
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
                           		<c:forEach var="item" items="${fundHomeView}" varStatus="status">
                           			<div class="card mb-3 section01_rank_card">
	                                   <div class="row no-gutters">
	                                       <div class="col-1 card_rank_num">
	                                           ${status.index+1 }
	                                       </div>
	                                       <div class="col-7">
	                                           <div class="card-body">
	                                               <p class="card-text section02_title">
	                                               		<a href="funding/view.do?funding_idx=${item.funding_idx}">
				                                   			${item.funding_title }
				                                   		</a>
	                                               </p>
	                                               <p class="card_rank_text02">
	                                                   ${Math.round(item.funding_current_price/item.funding_target_price*100)}% 
	                                                   <span>|</span> 
	                                                   <span>
	                                                   		<c:if test="${item.funding_category eq 0}">
								                        		강아지
								                        	</c:if>
								                        	<c:if test="${item.funding_category eq 1}">
								                        		고양이
								                        	</c:if>
								                        	<c:if test="${item.funding_category eq 2}">
								                        		반려동물
								                        	</c:if>
	                                                   </span>
	                                               </p>
	                                           </div>
	                                       </div>
	                                       <div class="col-4 section01_rank_img section01_rank_img01">
	                                           <a href="funding/view.do?funding_idx=${item.funding_idx}">
		                                   		   <img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="...">
		                                   	   </a>
	                                       </div>
	                                   </div>
	                               </div>	
                           		</c:forEach>
                           </div>
                           <!--스토어 랭킹-->
                           <div class="tab-pane fade" id="pills-store" role="tabpanel" aria-labelledby="pills-store-tab">
                           		<c:forEach var="item" items="${storeHomeView}" varStatus="status">
                           			<div class="card mb-3 section01_rank_card">
	                                   <div class="row no-gutters">
	                                       <div class="col-1 card_rank_num">
	                                           ${status.index+1}
	                                       </div>
	                                       <div class="col-7">
	                                           <div class="card-body">
	                                               <p class="card-text section02_title">
	                                               		<a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
					                               			${item.store_title }
					                               		</a>
	                                               </p>
	                                               <p class="card_rank_text02">
	                                                   <fmt:formatNumber value="${item.store_price }" type="number" /><span class="won">원</span>&nbsp;<span>|</span>&nbsp;
	                                                   <span>
	                                                   		<c:if test="${item.store_category eq 0}">
								                        		강아지
								                        	</c:if>
								                        	<c:if test="${item.store_category eq 1}">
								                        		고양이
								                        	</c:if>
								                        	<c:if test="${item.store_category eq 2}">
								                        		반려동물
								                        	</c:if>
	                                                   </span>
	                                               </p>
	                                           </div>
	                                       </div>
	                                       <div class="col-4 section01_rank_img01">
	                                           <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
						                            <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top" alt="...">
						                       </a>
	                                       </div>
	                                   </div>
	                               </div>
                           		</c:forEach>
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
               </p>
               <div class="row section03_carttop">
               	   <c:forEach var="item" items="${storeHomeFund}">
	                   <div class="col-lg-2 col-sm-4 col-6">
	                       <div class="card section03_card hover_card">
	                           <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
		                            <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top" alt="...">
		                       </a>
	                           <div class="card-body">
	                               <p class="card-text section03_title">
	                               		<a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
	                               			${item.store_title }
	                               		</a>
	                               </p>
	                               <p class="card_store_text02">
	                                   <fmt:formatNumber value="${item.store_price }" type="number" /><span class="won">원</span>
	                                   &nbsp;<span>|</span>&nbsp;
	                                   <span>
	                                   		<c:if test="${item.store_category eq 0}">
				                        		강아지
				                        	</c:if>
				                        	<c:if test="${item.store_category eq 1}">
				                        		고양이
				                        	</c:if>
				                        	<c:if test="${item.store_category eq 2}">
				                        		반려동물
				                        	</c:if>
	                                   </span>
	                               </p>
	                           </div>
	                       </div>
	                   </div>
               	   </c:forEach>
               </div>
           </div>
       </section>
       <!--section03 끝-->

       <!--section04 신규 펀딩-->
       <c:set var="now" value="<%=new java.util.Date()%>"/>
       <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd " /></c:set>
       <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/> 
       <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
       <section>
           <div class="container section04">
               <h3 class="section04_h3">주목하세요! 새로 오픈한 프로젝트</h3>
               <p class="section04_p">반려동물을 위한 새로운 아이디어</p>
               <div class="row section04_row01">
               	   <c:forEach var="item" items="${fundHomeNew}">
               	   		<div class="col-lg-4">
	                       <div class="row no-gutters section04_card hover_card">
	                           <div class="col-6">
	                               <a href="funding/view.do?funding_idx=${item.funding_idx}">
                                   		<img src="resources/upload/funding/${item.funding_thumbnail}" class="section04_img card-img-top" alt="...">
                                   </a>
	                           </div>
	                           <div class="col-6">
	                               <div class="card-body section04_card_text">
	                                   <p class="card-text section04_title">
	                                   		<a href="funding/view.do?funding_idx=${item.funding_idx}">
	                                   			${item.funding_title }
	                                   		</a>
	                                   </p>
	                                   <p class="section04_funding">
	                                   		${Math.round(item.funding_current_price/item.funding_target_price*100)}% 
	                                   		<span>펀딩</span>
	                                   </p>
	                                   <p class="card-title">
	                                   		<fmt:parseDate var="start" value="${item.funding_start_date }" pattern="yyyy-MM-dd"/>
	                                   		<fmt:parseNumber var="startDate" value="${start.time / (1000*60*60*24)}" integerOnly="true" />
	                                   		<c:if test="${nowDate - startDate le 1}">
	                                   			오늘 오픈!
	                                   		</c:if>
	                                   		<c:if test="${nowDate - startDate gt 1}">
	                                   			${nowDate - startDate}일 전
	                                   		</c:if>
	                                   </p>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
               	   </c:forEach>
               </div>
               <!-- <div class="row section04_row01">
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
                   </div> -->
                   <!--row 끝-->
               <!-- </div> -->
           </div>
       </section>
   </main>

<c:import url="/footer.do"></c:import>

<script>
    $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
</script>
</body>


</html>