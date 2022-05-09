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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        
     
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_main.css">
    <!-- <script src="../resources/js/funding_js/infiniteScroll.js"></script> -->
    
<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
 
 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<main>
	<div class="container infinite">
        <div class="row" id="category">
            <div class="col-md-4 col-sm-12">
                <a href="main.do">
                    <img src="../resources/image/funding_main/dog123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    강아지
                </a>
            </div>
            <div class="col-md-4 col-sm-12">
                <a href="main_cat.do">
                    <img src="../resources/image/funding_main/cat123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    고양이
                </a>
            </div>
            <div class="col-md-4 col-sm-12">
                <a href="main_other.do">
                    <img src="../resources/image/funding_main//other123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    기타
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-sm" id="chosenCategory">
                강아지
            </div>
            <div class="col-sm" style="text-align: right">
                <div class="dropdown">
                    <button class="btn btn-outline-info btn-lg dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                        aria-expanded="false">
                        최신순
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="dropdown">
                        <a class="dropdown-item" href="#">최신순</a>
                        <a class="dropdown-item" href="#">인기순</a>
                        <a class="dropdown-item" href="#">펀딩액순</a>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <hr>
        </div>
      
        
        <c:if test="${listDog.size() == 0 }">
        	등록된 게시글이 없습니다.
        </c:if>
        <c:if test="${listDog.size() > 0 }">
        	<div id="container" class="row fundingRow">
		        <c:forEach var="item" items="${listDog}">
		        	<div class="col-md-4 col-sm-12 item">
		        		<div class="card">
		                    <a href="view.do?funding_idx=${item.funding_idx}">
		                    	<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
		                    </a>
		                    <div class="card-body">
			                    <a href="view.do?funding_idx=${item.funding_idx}">
			                        <h5 class="card-title">${item.funding_title}</h5>
			                    </a>
		                        <p class="card-text">${item.funding_idx}(idx) 강아지 | ${item.funding_views }(조회수) ${item.memberVO.member_business_name }</p>
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
				    <c:if test="${pageMaker.prev}">
				    	<li class="page-item"><a class="page-link prev" href="main.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="main.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li class="page-item"><a class="page-link next" href="main.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
			 </nav>
		</div>
		
      
    </div>
    </main>
    <%-- <c:import url="/footer.do"></c:import> --%>
    

</body>
</html>