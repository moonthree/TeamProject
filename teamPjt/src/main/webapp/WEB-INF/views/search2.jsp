<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<title>펫딩 검색 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/funding_css/funding_main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/store_css/store_main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/filter_modal.css">
</head>
<body>
<c:import url="/header.do"></c:import>
<canvas id="canvas" width="700" height="700"></canvas>
    <script type="importmap">
    	{
          "imports": {
            "three": "https://unpkg.com/three@0.141.0/build/three.module.js",
            "GLTFLoader" : "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js",
            "OrbitControls" : "http://fenixrepo.fao.org/cdn/js/threejs/4.4/OrbitControls.js"
          }
        }
    </script>
    <script type="module">
        import { GLTFLoader } from 'GLTFLoader';
        import * as THREE from 'three';
        import { OrbitControls } from "https://threejs.org/examples/jsm/controls/OrbitControls.js";

        let scene = new THREE.Scene();
        let renderer = new THREE.WebGLRenderer({
            canvas: document.querySelector('#canvas'),
            antialias : true
        });
        renderer.outputEncoding = THREE.sRGBEncoding;

        let camera = new THREE.PerspectiveCamera(30, 1);
        camera.position.set(200, 200, 200);
        scene.background = new THREE.Color('white');

		scene.position.x = 0;
        scene.position.y = 0;
        scene.position.z = 0;
		let xstep = 0;
		let ystep = 0;
		let zstep = 0;
        let controls = new OrbitControls(camera, renderer.domElement);

        let loader = new GLTFLoader();
        loader.load('resources/shiba/scene.gltf', function (gltf) {
            scene.add(gltf.scene);
            renderer.render(scene, camera);
            function animate() {
				 xstep += 0.01;
                ystep += 0.1;
                zstep += 0.01;
                gltf.scene.position.x = (8 * Math.cos(xstep));
                gltf.scene.position.y = (1 * Math.abs(Math.sin(ystep)));
                gltf.scene.position.z = (8 * Math.sin(zstep));
                gltf.scene.rotation.y -= 0.01;
                requestAnimationFrame(animate)
                controls.update();
                renderer.render(scene, camera);
            }
            animate()
        });

    </script>
    <main>
        <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        	<!-- 검색 제목 -->
            <div class="search-box">
                <div class="search-title">
                    <span class="search_keyword" id="keywordInput">${keyword }</span>
                    검색결과
                </div>
                <button type="button" id="filterModalBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#filterModal">
		            필터
		        </button>
		        <span class="filter_span2">펀딩</span>
                <span class="filter_span2">스토어</span>

                <span class="filter_span2">전체</span>
                <span class="filter_span2">강아지</span>
                <span class="filter_span2">고양이</span>
                <span class="filter_span2">반려동물</span>

                <span class="filter_span2">최신순</span>
                <span class="filter_span2">인기순</span>
                <span class="filter_span2">펀딩액순</span>
                <span class="filter_span2">마감 임박순</span>

                <span class="filter_span2">최신순</span>
                <span class="filter_span2">인기순</span>
                <span class="filter_span2">평점순</span>
                <span class="filter_span2">높은 가격순</span>
                <span class="filter_span2">낮은 가격순</span>
            </div>
            <div id="searchPlace"></div>
            <!-- 펀딩 -->
            	<div id="fundPlace">
	            <div class="search_result_num">
	                <div>펀딩
	                    <span>${totalRow}</span>개
	                    <input type=number id="totalPageCount" value="${totalPageCount}" style="display:none;"/>
	                    <input type=number id="totalRow" value="${totalRow}" style="display:none;"/>
	                </div>
	            </div>
	            <c:if test="${totalRow == 0 }">
	        		검색 결과가 없습니다.
	        	</c:if>
	        	<c:if test="${totalRow > 0 }">
	        		<!-- 카드 섹션 -->
		            <section id="card-list" class="card-list2">
		                <div class="container">
		                    <div class="row fundingRow card-list-container thumbnails">
		                    	
		                    	<c:forEach var="item" items="${searchList}">
		                    		<div class="col-md-3 col-sm-12 item">
						        		<div class="card search_fund_card">
						                    <a href="funding/view.do?funding_idx=${item.funding_idx} ">
						                    	<img src="resources/upload/funding/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
						                    </a>
						                    <div class="card-body funding_title">
							                    <a href="funding/view.do?funding_idx=${item.funding_idx} ">
							                        <h5 class="card-title">${item.funding_title}</h5>
							                    </a>
						                        <p class="card-text">
						                        	<c:if test="${item.funding_category eq 0}">
						                        		강아지
						                        	</c:if>
						                        	<c:if test="${item.funding_category eq 1}">
						                        		고양이
						                        	</c:if>
						                        	<c:if test="${item.funding_category eq 2}">
						                        		기타
						                        	</c:if>
						                        	| ${item.memberVO.member_business_name }
						                        </p>
						                        <div class="progress">
						                            <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${item.funding_current_price/item.funding_target_price*100}%"
						                                aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						                        </div>
						                        <p class="card-text cardtext2">
						                            <span class="fundingProgress">${Math.round(item.funding_current_price/item.funding_target_price*100)}%</span>
						                            <span> <fmt:formatNumber value="${item.funding_current_price}" type="number" />원</span>
						                            
						                            
						                            <!-- 남은 날짜 계산 -->
						                            <c:set var="now" value="<%=new java.util.Date()%>"/>
						                            <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
				
						                            <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
						                            <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
						                            <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
						                            <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
						                            <!-- 남은 날짜 계산 끝 -->
						                            <span class="remainDay">${endDate - nowDate}일 남음</span>
						                        </p>
						                    </div>
						                </div>
						            </div>
		                    	</c:forEach>
		                    </div>
		                </div>
		            </section>
	        	</c:if>
	        	<c:if test="${totalRow > 8 }">
	        		<div class="back-drop" style="text-align:center; color:gray; margin-top:30px;">
		            	<button type="button" class="btn btn-light btn-lg">
		            		더보기 <span id="currentContentNum">8</span>/${totalRow }
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
							</svg>
		            	</button>
		            </div>
		            <div class="back-to-top" style="text-align:center; color:gray; margin-top:30px;">
		            	<button type="button" class="btn btn-light btn-lg">
		            		위로 ${totalRow }/${totalRow }
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
							</svg>
		            	</button>
		            </div>
	        	</c:if>
            </div>
            
            <div id="storePlace">
	            <div class="search_result_num">
	                <div class="search_result_z">스토어
	                    <span>${totalRowStore}</span>개
	                    <input type=number id="totalPageCountStore" value="${totalPageCountStore}" style="display:none;"/>
	                    <input type=number id="totalRowStore" value="${totalRowStore}" style="display:none;"/>
	                </div>
	            </div>
	            <div class="storeSection01">
	            	<c:if test="${totalRowStore == 0 }">
			        		검색 결과가 없습니다.
			        	</c:if>
			        	<c:if test="${totalRowStore > 0 }">
			        		<div class="row storeRow">
				        		<c:forEach var="item" items="${searchStoreList}" varStatus="status">
				        			<div class="col-md-3 col-sm-12">
						                <div class="card">
						                    <div class="card-img">
						                        <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
						                            <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top img2" alt="...">
						                        </a>
						                        <%-- <button id="zzimBtn" class="card-zzim-btn doZzim" type="button" style="background-color: white;" data-id="${login.member_idx }" data-id2="${item.store_idx }" data-id3="${item.funding_idx }">>
						                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="bi bi-heart"
						                                viewBox="0 0 16 16">
						                                <path
						                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
						                            </svg>
						                        </button> --%>
						                    </div>
						                    <div class="card-body store_title">
						                        <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
						                            <div class="card-title">${item.store_title}</div>
						                        </a>
						                        <p class="card-price"><fmt:formatNumber value="${item.store_price }" type="number" />원</p>
						                        <input type="number" id="idx${status.index}" value="${item.store_idx}" style="display:none;">
						                        <!--별점-->
						                        <div>
						                            <svg style="display:none;">
						                                <defs>
						                                    <symbol id="fivestars">
						                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
						                                            viewBox="0 0 24 27">
						                                            <path
						                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
						                                                fill="white" fill-rule="evenodd" />
						                                        </svg>
						                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
						                                            viewBox="0 0 24 27">
						                                            <path
						                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
						                                                fill="white" fill-rule="evenodd"/>
						                                        </svg>
						                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
						                                            viewBox="0 0 24 27">
						                                            <path
						                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
						                                                fill="white" fill-rule="evenodd"/>
						                                        </svg>
						                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
						                                            viewBox="0 0 24 27">
						                                            <path
						                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
						                                                fill="white" fill-rule="evenodd"/>
						                                        </svg>
						                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
						                                            viewBox="0 0 24 27">
						                                            <path
						                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
						                                                fill="white" fill-rule="evenodd"/>
						                                        </svg>
						                                    </symbol>
						                                </defs>
						                            </svg>
						                            <div class="rating">
						                                <progress id="rating-bg${status.index }" class="rating-bg" value="${item.avg_star }" max="5"></progress>
						                                <svg>
						                                    <use xlink:href="#fivestars" />
						                                </svg>
						                            </div>
						                            <div class="starNumSearch">
						                            	<c:if test="${item.avg_star > 0}">
						                            		<span class="starAverage">${item.avg_star }</span>
						                            	</c:if>
						                                <c:if test="${item.avg_star eq null}">
						                            		<span class="starAverage">0</span>
						                            	</c:if>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </div>
				        		</c:forEach>
				        	</div>
			        	</c:if>
	            </div>
	            <c:if test="${totalRowStore > 8 }">
		            <div class="back-drop-store" style="text-align:center; color:gray; margin-top:30px;">
		            	<button type="button" class="btn btn-light btn-lg">
		            		더보기 <span id="currentStoreNum">8</span>/${totalRowStore }
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
							</svg>
		            	</button>
		            </div>
		            <div class="back-to-top-store" style="text-align:center; color:gray; margin-top:30px;">
		            	<button type="button" class="btn btn-light btn-lg">
		            		위로 ${totalRowStore }/${totalRowStore }
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
							</svg>
		            	</button>
		            </div>
	            </c:if>
            </div>
        </div>
    </main>
    
    
<!-- 필터 모달 -->
     <div class="modal" id="filterModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        필터
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    
                </div>
                <div class="modal-body">
	                    <div class="filter">
	                        <span class="filter_span project_fund">펀딩</span>
	                        <span class="filter_span project_store">스토어</span>
	
	                        <span class="filter_span filter_span_category fs_categoryAll">전체</span>
	                        <span class="filter_span filter_span_category fs_categoryDog">강아지</span>
	                        <span class="filter_span filter_span_category fs_categoryCat">고양이</span>
	                        <span class="filter_span filter_span_category fs_categoryPet">반려동물</span>
	
	                        <span class="filter_span filter_span_fund fs_sort_fund_new">최신순</span>
	                        <span class="filter_span filter_span_fund fs_sort_fund_view">인기순</span>
	                        <span class="filter_span filter_span_fund fs_sort_fund_price">펀딩액순</span>
	                        <span class="filter_span filter_span_fund fs_sort_fund_deadline">마감 임박순</span>
	
	                        <span class="filter_span filter_span_store fs_sort_store_new">최신순</span>
	                        <span class="filter_span filter_span_store fs_sort_store_view">인기순</span>
	                        <span class="filter_span filter_span_store fs_sort_store_star">평점순</span>
	                        <span class="filter_span filter_span_store fs_sort_store_highprice">높은 가격순</span>
	                        <span class="filter_span filter_span_store fs_sort_store_lowprice">낮은 가격순</span>
	                    </div>
	                    <div>
	                    	<form id="filterForm">
		                    	<input type="text" name="keyword" value="${keyword}" style="display:none;">
		                        <select id="categorySelect" name="categorySelect" class="category form-select" style="display:none;">
		                            <option value="all" ${categorySelect eq 'all' ? 'selected' : '' }>전체</option>
		                            <option value="dog" ${categorySelect eq 'dog' ? 'selected' : '' }>강아지</option>
		                            <option value="cat" ${categorySelect eq 'cat' ? 'selected' : '' }>고양이</option>
		                            <option value="pet" ${categorySelect eq 'other' ? 'selected' : '' }>반려동물</option>
		                        </select>
		                        <select id="condition" name="condition" class="condition form-select" style="display:none;">
		                            <option value="sortNew" ${condition eq 'sortNew' ? 'selected' : '' }>최신순</option>
		                            <option value="sortView" ${condition eq 'sortView' ? 'selected' : '' }>인기순</option>
		                            <option value="sortStar" ${condition eq 'sortStar' ? 'selected' : '' }>평점순</option>
		                            <option value="sortdeadline" ${condition eq 'sortHighPrice' ? 'selected' : '' }>마감 임박순</option>
		                        </select>
		                        <select id="conditionStore" name="conditionStore" class="conditionStore form-select" style="display:none;">
		                            <option value="sortNewStore" ${condition eq 'sortNew' ? 'selected' : '' }>최신순</option>
		                            <option value="sortViewStore" ${condition eq 'sortView' ? 'selected' : '' }>인기순</option>
		                            <option value="sortStarStore" ${condition eq 'sortStar' ? 'selected' : '' }>평점순</option>
		                            <option value="sortHighPriceStore" ${condition eq 'sortHighPrice' ? 'selected' : '' }>높은 가격순</option>
		                            <option value="sortLowPriceStore" ${condition eq 'sortLowPrice' ? 'selected' : '' }>낮은 가격순</option>
		                        </select>
	                        </form>
	                    </div>
	                    <div class="project">
	                        <span class="bold">프로젝트</span><br>
	                        <button type="button" id="fundingPjtBtn" class="modalBodyBtn pjtBtn">펀딩</button>
	                        <button type="button" id="storePjtBtn" class="modalBodyBtn pjtBtn">스토어</button>
	                    </div>
	                    <div class="categoryDiv modalBodyDiv">
	                        <span class="bold">카테고리</span><br>
	                        <button type="button" value="all" id="categoryAll" class="modalBodyBtn categoryBtn">전체</button>
	                        <button type="button" value="dog" id="categoryDog" class="modalBodyBtn categoryBtn">강아지</button>
	                        <button type="button" value="cat" id="categoryCat" class="modalBodyBtn categoryBtn">고양이</button>
	                        <button type="button" value="pet" id="categoryPet" class="modalBodyBtn categoryBtn">반려동물</button>
	                    </div>
	                    <div class="sortFunding modalBodyDiv">
	                        <span class="bold">펀딩 정렬</span><br>
	                        <button type="button" value="sortNew" id="sort_fund_new" class="modalBodyBtn sortFundingBtn">최신순</button>
	                        <button type="button" value="sortView" id="sort_fund_view" class="modalBodyBtn sortFundingBtn">인기순</button>
	                        <button type="button" value="sortStar" id="sort_fund_price" class="modalBodyBtn sortFundingBtn">펀딩액순</button>
	                        <button type="button" value="sortdeadline" id="sort_fund_deadline" class="modalBodyBtn sortFundingBtn">마감 임박순</button>
	                    </div>
	                    <div class="sortStore modalBodyDiv">
	                        <span class="bold">스토어 정렬</span><br>
	                        <button type="button" value="sortNewStore" id="sort_store_new" class="modalBodyBtn sortStoreBtn">최신순</button>
	                        <button type="button" value="sortViewStore" id="sort_store_view" class="modalBodyBtn sortStoreBtn">인기순</button>
	                        <button type="button" value="sortStarStore" id="sort_store_star" class="modalBodyBtn sortStoreBtn">평점순</button>
	                        <button type="button" value="sortHighPriceStore" id="sort_store_highprcie" class="modalBodyBtn sortStoreBtn">높은 가격순</button>
	                        <button type="button" value="sortLowPriceStore" id="sort_store_lowprice" class="modalBodyBtn sortStoreBtn">낮은 가격순</button>
	                    </div>
	                </div>
	                <div class="footer">
	                    <button type="button" class="btn btn-outline-info" id="filterResetBtn">초기화</button>
	                    <button type="button" class="btn btn-info" id="filterDoBtn">적용 하기</button>
	                </div>
            </div>
        </div>
    </div>
<script>
//스크롤 처리 이벤트
    //페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
    let currentPage=1;
    //현재 페이지가 로딩중인지 여부를 저장할 변수이다.
    let isLoading = false;
    
    let totalPageCount = document.getElementById('totalPageCount').value
    let totalRow = document.getElementById('totalRow').value
    console.log(totalPageCount);
	$(document).ready(function(){
		$(".back-to-top").hide();
		$(".back-to-top-store").hide();
	});
    /* //웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
    $(window).on("scroll", function(){
        //위로 스크롤된 길이
        let scrollTop=$(window).scrollTop();
        //웹 브라우저 창의 높이
        let windowHeight = $(window).height();
        //문서 전체의 높이
        let documentHeight=$(document).height();
        //바닥까지 스크롤 되었는 지 여부를 알아낸다.
        let isBottom = scrollTop+windowHeight + 10 >= documentHeight;
        if(isBottom){
            //만일 현재 마지막 페이지라면
            if(currentPage == isLoading){
                return; //함수를 여기서 끝낸다.sssssssssss
            }else if(currentPage == totalPageCount){
            	return;
            }
            //현재 로딩 중이라고 표시한다.
            isLoading = true;
            //로딩바를 띄우고
            $(".back-drop").show();
    	}
    }); */
    $(".back-to-top").click(function(){
    	location.reload()
    	window.scrollTo(0, 0);
    })
    $(".back-to-top-store").click(function(){
    	location.reload()
    	window.scrollTo(0, 0);
    })
    
    $(".back-drop").click(function(){
        //요청할 페이지 번호를 1 증가시킨다.
        currentPage++;
        //추가로 받아올 페이지를 서버에 ajax요청을 하고ssssssssssssssssss
        console.log("currentPage = "+currentPage)
        
        let currentContentNum = 8*currentPage;
        if(currentContentNum > totalRow){
        	currentContentNum = totalRow
        }
        $('#currentContentNum').text(currentContentNum);
        
       /*  GetList(currentPage); */
       $.ajax({
            url: "ajax_page.do",
            method: "GET",
            //검색 기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야 하는데 다른 것들으 덧붙여져 나온다.
            data: "pageNum=" + currentPage + "&keyword=${keyword}",
            async : false,
            //ajax_page.jsp의 내용이 data로 들어온다.
            success:function(data){
                //console.log(data);
                //응답된 문자열은 html 형식이다.(/ajax_page.jsp에 응답내용이 있다.)
                //해당 문자열을 class.card-list-container div에 html로 해석하라고 추가한다.
                $(".card-list2").append(data);
                
                /* $(".back-drop").hide(); */
                
                //로딩중이 아니라고 표시힌다.sssssssssss
                isLoading=false;
                console.log("ajax");
            }
        });
       if(currentPage == totalPageCount){
    	$(".back-drop").hide();
       	$(".back-to-top").show();
       	/* var a = $(".card-list").length;
       	var b = a-1
       	
       	$(".card-list").last().find('div:eq(1)').append('<div class="col-md-4 col-sm-12"></div>')
       	$(".card-list").last().find('div:eq(1)').append('<div class="col-md-4 col-sm-12"></div>')
       	$(".card-list").last().css("width","100%") */
       }
	});
    
    //스토어 스토어
    
    let currentPageStore=1;
    let totalPageCountStore = document.getElementById('totalPageCountStore').value
    
    $(".back-drop-store").click(function(){
        //요청할 페이지 번호를 1 증가시킨다.
        currentPageStore++;
        //추가로 받아올 페이지를 서버에 ajax요청을 하고sssssssssssss
        console.log("currentPageStore = "+currentPageStore)
        
        let currentStoreNum = 8*currentPageStore;
        if(currentStoreNum > totalRowStore){
        	currentStoreNum = totalRowStore
        }
        $('#currentStoreNum').text(currentStoreNum);
       /*  GetList(currentPage); */
       $.ajax({
            url: "ajax_page_store.do",
            method: "GET",
            //검색 기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야 하는데 다른 것들으 덧붙여져 나온다.
            data: "pageNumStore=" + currentPageStore + "&keyword=${keyword}",
            async : false,
            //ajax_page.jsp의 내용이 data로 들어온다.
            success:function(data){
                //console.log(data);
                //응답된 문자열은 html 형식이다.(/ajax_page.jsp에 응답내용이 있다.)
                //해당 문자열을 class.card-list-container div에 html로 해석하라고 추가한다.
                $(".storeSection01").append(data);
                
                /* $(".back-drop").hide(); */
                
                //로딩중이 아니라고 표시힌다.sssssssssss
                isLoading=false;
                console.log("ajax");
            }
        });
       if(currentPageStore == totalPageCountStore){
          	/* $(".card-list").last().addClass("none");
          	$(".card-list").last().removeClass("card-list");
          	document.getElementsByClassName("none")[0].style.display = "none"; */
          	$(".back-drop-store").hide();
          	$(".back-to-top-store").show();
       }
    });
</script>
<script src="resources/js/searchFilter.js"></script>
</body>
</html>