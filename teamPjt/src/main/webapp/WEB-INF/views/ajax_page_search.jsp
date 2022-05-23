<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="search_result_num">
    <div>펀딩
        <span>${totalRowSearch}</span>개
        <input type=number id="totalPageCountSearch" value="${totalPageCountSearch}" style="display:none;"/>
        <input type=number id="totalRowSearch" value="${totalRowSearch}" style="display:none;"/>
    </div>
</div>
<c:if test="${totalRowSearch == 0 }">
<span>검색 결과가 없습니다.</span>
</c:if>
<c:if test="${totalRowSearch > 0 }">
 <section class="card-list-search">
   <div class="container">
       <div class="row fundingRow card-list-container thumbnails">
       	<c:forEach var="item" items="${searchListSearch}">
       		<div class="col-md-3 col-sm-12 item">
				<div class="card">
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
    </div>
</section>
</c:if>
<c:if test="${totalRowSearch > 8 }">
	<div class="back-drop-search" style="text-align:center; color:gray; margin-top:30px;">
		<button type="button" class="btn btn-light btn-lg">
			더보기 <span id="currentContentNumSearch">8</span>/${totalRowSearch }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
			</svg>
       	</button>
    </div>
    <div class="back-to-top-search" style="text-align:center; color:gray; margin-top:30px;">
		<button type="button" class="btn btn-light btn-lg">
			위로 ${totalRowSearch }/${totalRowSearch }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
			</svg>
       	</button>
     </div>
</c:if>


<script>
var currentPageSearch=1;
var totalPageCountSearch = document.getElementById('totalPageCountSearch').value;
var totalRowSearch = document.getElementById('totalRowSearch').value;

$(document).ready(function(){
	$(".back-to-top-search").hide();
});

$(".back-to-top-search").click(function(){
	location.reload()
	window.scrollTo(0, 0);
})
$(".back-drop-search").click(function(){
    //요청할 페이지 번호를 1 증가시킨다.
    currentPageSearch++;
    //추가로 받아올 페이지를 서버에 ajax요청을 하고ssssssssssssssssss
    console.log("currentPageSearch = "+currentPageSearch)
    
    let currentContentNumSearch = 8*currentPageSearch;
    if(currentContentNumSearch > totalRowSearch){
    	currentContentNumSearch = totalRowSearch
    }
    $('#currentContentNumSearch').text(currentContentNumSearch);
   $.ajax({
        url: "ajax_page.do",
        method: "GET",
        //검색 기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야 하는데 다른 것들으 덧붙여져 나온다.
        data: "pageNum=" + currentPageSearch + "&keyword=${keyword}&condition=${condition}&categorySelect=${categorySelect}",
        async : false,
        success:function(data){
            $(".card-list-search").append(data);
            
            console.log("ajax");
        }
    });
   if(currentPageSearch == totalPageCountSearch){
	$(".back-drop-search").hide();
   	$(".back-to-top-search").show();
   }
});
</script>