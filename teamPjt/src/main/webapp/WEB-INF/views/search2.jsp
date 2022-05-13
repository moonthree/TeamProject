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

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/funding_css/funding_main.css">


</head>
<body>
<c:import url="/header.do"></c:import>

    <main>
        <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        	<!-- 검색 제목 -->
            <div class="search-box">
                <div class="search-title">
                    <span class="search_keyword" id="keywordInput">${keyword }</span>
                    검색결과
                </div>
            </div>
            <!-- 펀딩 -->
            <div class="search_result_num">
                <div>펀딩
                    <span>${totalRow}</span>개
                    <input type=number id="totalPageCount" value="${totalPageCount}" style="display:none;"/>
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
	                    		<div class="col-md-4 col-sm-12 item">
					        		<div class="card">
					                    <a href="funding/view.do?funding_idx=${item.funding_idx} ">
					                    	<img src="resources/image/funding_main/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
					                    </a>
					                    <div class="card-body">
						                    <a href="view.do?funding_idx=${item.funding_idx} ">
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
            

            

            <div class="back-drop" style="text-align:center; color:gray; margin-top:30px;">
            	<button type="button" class="btn btn-light btn-lg">
            		더보기
            		<br>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
					</svg>
            	</button>
            </div>
            <div class="back-to-top" style="text-align:center; color:gray; margin-top:30px;">
            	<button type="button" class="btn btn-light btn-lg">
            		위로
            		<br>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
					</svg>
            	</button>
            </div>
            
            <div class="search_result_num">
                <div>스토어
                    <span>0</span>개
                    
                </div>
            </div>
        </div> 
    </main>
    
<script>
//스크롤 처리 이벤트
    //페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
    let currentPage=1;
    //현재 페이지가 로딩중인지 여부를 저장할 변수이다.
    let isLoading = false;
    
    let totalPageCount = document.getElementById('totalPageCount').value
    console.log(totalPageCount);
	$(document).ready(function(){
		$(".back-drop").hide();
		$(".back-to-top").hide();
		
		
	});
    
    //웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
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
    });
    $(".back-to-top").click(function(){
    	location.reload()
    	window.scrollTo(0, 0);
    })
    
    $(".back-drop").click(function(){
        //요청할 페이지 번호를 1 증가시킨다.
        currentPage++;
        //추가로 받아올 페이지를 서버에 ajax요청을 하고sssssssssssss
        console.log("currentPage = "+currentPage)
        
        
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
                //로딩바를 숨긴다.
                $(".back-drop").hide();
                
                //로딩중이 아니라고 표시힌다.sssssssssss
                isLoading=false;
                console.log("ajax");
            }
        });
       if(currentPage == totalPageCount){
       	$(".card-list").last().addClass("none");
       	$(".card-list").last().removeClass("card-list");
       	document.getElementsByClassName("none")[0].style.display = "none";
       	$(".back-to-top").show();
       	var a = $(".card-list").length;
       	var b = a-1
       	
       	$(".card-list").last().find('div:eq(1)').append('<div class="col-md-4 col-sm-12"></div>')
       	$(".card-list").last().find('div:eq(1)').append('<div class="col-md-4 col-sm-12"></div>')
       	$(".card-list").last().css("width","100%")
       }
	});
</script>

</body>
</html>