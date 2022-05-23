<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="search_result_num">
    <div>스토어
        <span>${totalRowStoreSearch}</span>개
        <input type=number id="totalPageCountStoreSearch" value="${totalPageCountStoreSearch}" style="display:none;"/>
        <input type=number id="totalRowStoreSearch" value="${totalRowStoreSearch}" style="display:none;"/>
    </div>
</div>
<c:if test="${totalRowStoreSearch == 0 }">
<span>검색 결과가 없습니다.</span>
</c:if>
<c:if test="${totalRowStoreSearch > 0 }">
<section class="card-list-search-store">
	<div class="row storeRow">
		<c:forEach var="item" items="${searchStoreListSearch}" varStatus="status">
			<div class="col-md-3 col-sm-12">
	         <div class="card">
	             <div class="card-img">
	                 <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
	                     <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top img2" alt="...">
	                 </a>
	             </div>
	             <div class="card-body store_title">
	                 <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
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
	                         <progress id="rating-bg${status.index }" class="rating-bg" value="${item.avg_star }" max="5"></progress>
	                         <svg>
	                             <use xlink:href="#fivestars" />
	                         </svg>
	                     </div>
	                     <div class="starNum">
	                         <span class="starAverage">${item.avg_star }</span> 
	                     </div>
	                 </div>
	             </div>
	         </div>
	     </div>
		</c:forEach>
	</div>
</section>
</c:if>
<c:if test="${totalRowStoreSearch > 8 }">
	<div class="back-drop-search-store" style="text-align:center; color:gray; margin-top:30px;">
		<button type="button" class="btn btn-light btn-lg">
			더보기 <span id="currentContentNumSearchStore">8</span>/${totalRowStoreSearch }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
			</svg>
       	</button>
    </div>
    <div class="back-to-top-search-store" style="text-align:center; color:gray; margin-top:30px;">
		<button type="button" class="btn btn-light btn-lg">
			위로 ${totalRowStoreSearch }/${totalRowStoreSearch }
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
			</svg>
       	</button>
     </div>
</c:if>

<script>
var currentPageSearchStore=1;
var totalPageCountStoreSearch = document.getElementById('totalPageCountStoreSearch').value;
var totalRowStoreSearch = document.getElementById('totalRowStoreSearch').value;

$(document).ready(function(){
	$(".back-to-top-search-store").hide();
});

$(".back-to-top-search-store").click(function(){
	location.reload()
	window.scrollTo(0, 0);
})
$(".back-drop-search-store").click(function(){
    //요청할 페이지 번호를 1 증가시킨다.
    currentPageSearchStore++;
    //추가로 받아올 페이지를 서버에 ajax요청을 하고ssssssssssssssssss
    console.log("currentPageSearchStore = "+currentPageSearchStore)
    
    let currentContentNumSearchStore = 8*currentPageSearchStore;
    if(currentContentNumSearchStore > totalRowStoreSearch){
    	currentContentNumSearchStore = totalRowStoreSearch
    }
    $('#currentContentNumSearchStore').text(currentContentNumSearchStore);
   $.ajax({
        url: "ajax_page_store.do",
        method: "GET",
        //검색 기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야 하는데 다른 것들으 덧붙여져 나온다.
        data: "pageNumStore=" + currentPageSearchStore + "&keyword=${keyword}&conditionStore=${conditionStore}&categorySelect=${categorySelect}",
        async : false,
        success:function(data){
            $(".card-list-search-store").append(data);
            
            console.log("ajax");
        }
    });
   if(currentPageSearchStore == totalPageCountStoreSearch){
	$(".back-drop-search-store").hide();
   	$(".back-to-top-search-store").show();
   }
});
</script>