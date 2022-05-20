<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫딩 스토어 메인페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        
     
    <link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_main.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<div class="container">
		<form action="store_main.do" method="get" id="abcde">
	        <div class="row" id="category">
	            <div class="col-sm-3 col-6" id="fundCategory" style="cursor:pointer;">
	                <a href="#">
	                    <img src="../resources/image/img/paws.png" alt="photo" class="rounded-circle"/>
	                    <br>
	                    펀딩 성공 상품
	                </a>
	            </div>
	            <div class="col-sm-3 col-6" id="dogCategory" style="cursor:pointer;">
	                <a href="#">
	                    <img src="../resources/image/img/dog7.png" alt="photo" class="rounded-circle"/>
	                    <br>
	                    강아지
	                </a>
	            </div>
	            <div class="col-sm-3 col-6" id="catCategory" style="cursor:pointer;">
	                <a href="#">
	                    <img src="../resources/image/img/cat.png" alt="photo" class="rounded-circle"/>
	                    <br>
	                    고양이
	                </a>
	            </div>
	            <div class="col-sm-3 col-6" id="otherCategory" style="cursor:pointer;">
	                <a href="#">
	                    <img src="../resources/image/img/other.png" alt="photo" class="rounded-circle"/>
	                    <br>
	                    반려 동물
	                </a>
	            </div>
	        </div>
			
			<div class="row selectRow">
	            <div class="col-6" id="chosenCategory">
	            </div>
	            <input type="number" id="totalPageCount" style="display : none;" value="${totalPageCount}"/>
		          <select id="categorySelect" name="categorySelect" class="category form-select" style="display : none;">
		          	   <option value="fund" ${categorySelect eq 'fund' ? 'selected' : ''}>펀딩 성공 상품</option>
		               <option value="dog" ${categorySelect eq 'dog' ? 'selected' : ''}>강아지</option>
		               <option value="cat" ${categorySelect eq 'cat' ? 'selected' : ''}>고양이</option>
		               <option value="other" ${categorySelect eq 'other' ? 'selected' : ''}>반려동물</option>
		          </select>
		          <div class="col-6" style="text-align: right">
		          	  <select id="condition" name="condition" class="condition form-select">
		                  <option value="sortNew" ${condition eq 'sortNew' ? 'selected' : ''}>최신순</option>
		                  <option value="sortView" ${condition eq 'sortView' ? 'selected' : ''}>인기순</option>
		                  <option value="sortStar" ${condition eq 'sortStar' ? 'selected' : ''}>평점순</option>
		              </select>
		          </div>
	        </div>
	    </form>
	    <input type="number" id="listMainSize" value="${listMain.size() }" style="display:none;">
        <c:if test="${listMain.size() == 0 }">
        	등록된 상품이 없습니다.
        </c:if>
        <c:if test="${listMain.size() > 0 }">
        	<div class="row storeRow">
        		<c:forEach var="item" items="${listMain}" varStatus="status">
        			<div class="col-md-3 col-sm-12">
		                <div class="card">
		                    <div class="card-img">
		                        <a href="store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
		                            <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top img2" alt="...">
		                        </a>
		                        <%-- <button id="zzimBtn" class="card-zzim-btn doZzim" type="button" style="background-color: white;" data-id="${login.member_idx }" data-id2="${item.store_idx }" data-id3="${item.funding_idx }">>
		                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="bi bi-heart"
		                                viewBox="0 0 16 16">
		                                <path
		                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                            </svg>
		                        </button> --%>
		                    </div>
		                    <div class="card-body">
		                        <a href="store_view.do?store_idx=${item.store_idx}">
		                            <div class="card-title">${item.store_title}</div>
		                        </a>
		                        <p class="card-price"><fmt:formatNumber value="${item.store_price }" type="number" />원</p><span>idxtest : ${item.store_idx}   viewTest : ${item.store_views}</span>
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
		                                <progress id="rating-bg${status.index }" class="rating-bg" value="0" max="5"></progress>
		                                <svg>
		                                    <use xlink:href="#fivestars" />
		                                </svg>
		                            </div>
		                            <div class="starNum">
		                                <span id="starAverage${status.index}" class="starAverage"></span> 
		                                <span class="starTotal">|&nbsp;(<span id="starTotal${status.index }">423</span>)</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
        		</c:forEach>
        	</div>
        </c:if>
        
        <div>
        	<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <c:if test="${prev }">
				    	<li class="page-item"><a class="page-link prev" href="store_main.do?pageNum=${startPage-1}&categorySelect=${categorySelect}&condition=${condition}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${startPage}" end="${endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="store_main.do?pageNum=${idx}&categorySelect=${categorySelect}&condition=${condition}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${next}">
				    	<li class="page-item"><a class="page-link next" href="store_main.do?pageNum=${endPage+1}&categorySelect=${categorySelect}&condition=${condition}">다음</a></li>
				    </c:if> 
				  </ul>
			 </nav>
		</div>
   </div>
	<c:import url="/footer.do"></c:import>
	<script src="../resources/js/store/store_main.js"></script>
</body>
</html>