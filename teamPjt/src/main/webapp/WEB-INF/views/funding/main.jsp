<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        
     
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_main.css">
    <!-- <script src="../resources/js/funding_js/infiniteScroll.js"></script> -->
    
 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<main>
	<div class="container infinite">
		<form action="main.do" method="get" id="abcde">
	        <div class="row" id="category">
	            <div class="col-md-4 col-sm-12" id="dogCategory" style="cursor:pointer;">
	                <img src="../resources/image/funding_main/dog123.png" alt="photo" class="rounded-circle" width="300" height="300" />
	                <br>
	                강아지
	            </div>
	            <div class="col-md-4 col-sm-12" id="catCategory" style="cursor:pointer;">
		            <img src="../resources/image/funding_main/cat123.png" alt="photo" class="rounded-circle" width="300" height="300" />
		            <br>
		            고양이
	            </div>
	            <div class="col-md-4 col-sm-12" id="otherCategory" style="cursor:pointer;">
		            <img src="../resources/image/funding_main//other123.png" alt="photo" class="rounded-circle" width="300" height="300" />
		            <br>
		            반려동물
	            </div>
	        </div>
	
	        <div class="row">
	            <div class="col-6" id="chosenCategory">
	            	
	            </div>
	            <input type="number" id="totalPageCount" style="display : none;" value="${totalPageCount}"/>
		          <select id="categorySelect" name="categorySelect" class="category form-select" style="display : none;">
		               <option value="dog" ${categorySelect eq 'dog' ? 'selected' : ''}>강아지</option>
		               <option value="cat" ${categorySelect eq 'cat' ? 'selected' : ''}>고양이</option>
		               <option value="other" ${categorySelect eq 'other' ? 'selected' : ''}>반려동물</option>
		          </select>
		          <div class="col-6" style="text-align: right">
		          	<select id="condition" name="condition" class="condition form-select">
		                  <option value="sortNew" ${condition eq 'sortNew' ? 'selected' : ''}>최신순</option>
		                  <option value="sortView" ${condition eq 'sortView' ? 'selected' : ''}>인기순</option>
		                  <option value="sortPrice" ${condition eq 'sortPrice' ? 'selected' : ''}>펀딩액순</option>
		              </select>
		          </div>
	            
	        </div>
        </form>
        <div>
            <hr>
        </div>
      
        
        <c:if test="${listMain.size() == 0 }">
        	등록된 게시글이 없습니다.
        </c:if>
        <c:if test="${listMain.size() > 0 }">
        	<div id="container" class="row fundingRow card-list-container">
		        <c:forEach var="item" items="${listMain}">
		        	<div class="col-md-4 col-sm-12 item">
		        		<div class="card">
		                    <a href="view.do?funding_idx=${item.funding_idx}">
		                    	<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
		                    </a>
		                    <div class="card-body">
			                    <a href="view.do?funding_idx=${item.funding_idx}">
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
		                        		반려동물
		                        	</c:if>
		                        	| ${item.memberVO.member_business_name }
		                        </p>
		                        <p>${item.funding_idx}(idx 테스트) | ${item.funding_views }(조회수 테스트) </p>
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
        </c:if>
        <div>
        	<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <c:if test="${prev }">
				    	<li class="page-item"><a class="page-link prev" href="main.do?pageNum=${startPage-1}&categorySelect=${categorySelect}&condition=${condition}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${startPage}" end="${endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="main.do?pageNum=${idx}&categorySelect=${categorySelect}&condition=${condition}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${next}">
				    	<li class="page-item"><a class="page-link next" href="main.do?pageNum=${endPage+1}&categorySelect=${categorySelect}&condition=${condition}">다음</a></li>
				    </c:if> 
				  </ul>
			 </nav>
		</div>
		
      
      
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
    
	<script src="../resources/js/funding_main.js"></script>
</body>
</html>