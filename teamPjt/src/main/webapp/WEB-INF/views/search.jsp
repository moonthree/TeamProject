<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/funding_css/funding_main.css">

<style type="text/css">
	select {

    width: 200px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: url('이미지 경로') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}


</style>

</head>
<body>
<c:import url="/header.do"></c:import>

    <main>
        <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
            <!-- 검색 제목 -->
            <div class="search-box">
                <div class="search-title">
                    <span class="search_keyword" id="keywordInput">${scri.keyword }</span>
                    검색결과
                </div>
                <%-- <div>
                	<form>
		            <select name="searchType" id="searchBox" onchange="changeSelect()">
					      <option value="all"<c:out value="${scri.searchType eq 'all' ? 'selected' : ''}"/>>전체</option>
					      <option value="dog"<c:out value="${scri.searchType eq 'dog' ? 'selected' : ''}"/>>강아지</option>
					      <option value="cat"<c:out value="${scri.searchType eq 'cat' ? 'selected' : ''}"/>>고양이</option>
					      <option value="other"<c:out value="${scri.searchType eq 'dog' ? 'selected' : ''}"/>>기타</option>
					</select>
					<button id="searchBtn">등록</button>
					</form>
                </div> --%>
            </div>
            <!-- 검색 결과 -->
            <div class="search_result">
                <!-- 펀딩 -->
                <div class="search_result_num">
                    <div>펀딩
                        <span>${searchFundingCount}</span>개
                    </div>
                </div>
        <c:if test="${searchFundinglist.size() == 0 }">
        	검색 결과가 없습니다.
        </c:if>
        <c:if test="${searchFundinglist.size() > 0 }">
        	<div class="row fundingRow">
		        <c:forEach var="item" items="${searchFundinglist}">
		        	<div class="col-md-4 col-sm-12 item">
		        		<div class="card">
		                    <a href="funding/view.do?funding_idx=${item.funding_idx} ">
		                    	<img src="resources/image/funding_main/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
		                    </a>
		                    <div class="card-body">
			                    <a href="view.do?funding_idx=${item.funding_idx} ">
			                        <h5 class="card-title">${item.funding_title}</h5>
			                    </a>
		                        <p class="card-text">${item.funding_idx}(idx) 강아지 | ${item.funding_views }(조회수)(주)강아지용품회사</p>
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
       	</div>
       	<div>
        	<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <c:if test="${pageMaker.prev}">
				    	<li class="page-item"><a class="page-link" href="search.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="search.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li class="page-item"><a class="page-link" href="search.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
			 </nav>
		</div>
       	</div>
    </main>
<c:import url="/footer.do"></c:import>

</body>
</html>