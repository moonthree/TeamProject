<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/modal.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage.css">
    
<style>
	
  .embed-responsive {
    border-radius: 12px;
  }
  .card{
    border : none;
  }
  h2{
    color : burlywood;
    font-weight : bold;
  }
  .jb-wrap {
        padding: 20px 0px;
      }
</style>
<title>찜 목록</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <div class="container" style="background-color: white;">
        <div class="row" style="margin-top:10%">
            <!--펀딩&스토어&찜-->
            <div class="col-md-12 col-sm-12">
                <!--찜 목록-->
                <h2>
                	찜 목록
                    <input type=number id="totalPageCount" value="${totalPageCount}" style="display:none;"/>
                    <input type=number id="totalRow" value="${totalRow}" style="display:none;"/>
                </h2>
                <br>
                <div class="select_info">
	          		<c:if test="${countZzim eq 0}">
	          			<div class="no_list">찜 내역이 없습니다.</div>
	          		</c:if>
	          		<c:if test="${countZzim ne 0}">
		          		<div class="box_num">
		          			<span class="box_num_span">${countZzim}</span>건의 찜 내역이 있습니다.
		          		</div>
	          		</c:if>
	          	</div>
            	<c:if test="${totalRow > 0 }">
	          	<div class="zzim_cotainer">

						<c:forEach var="item" items="${searchList}">
							<!-- 펀딩 -->
							<c:if test="${ item.zzim_category eq 0 }">
					            <div class="zzim_inner">
					                <div class="zzim_card">
					                    <div class="zzim_image" style="background-image: url(../resources/upload/funding/${item.funding_thumbnail})">
					                        <div class="zzim_cate" style="background: #fa6462;">펀딩</div>
					                        <div class="zzim_cancel">
	                							<button type="button" id="zzimDelBtn" class="zzim_cancel_btn" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?funding_idx=${item.funding_idx}'">
					                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
												</svg>
												</button>
					                        </div>
					                    </div>
					                    <div class="zzim_text" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'">
					                        <div class="zzim_title">${item.funding_title}</div>
					                        <div class="progress">
				                                <div class="progress-bar bg-info progress-bar-striped" role="progressbar" style="width: ${Math.round(item.funding_current_price/item.funding_target_price*100)}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
				                            </div>
											<div class="zzim_about">
												<div class="fund_per">
													${Math.round(item.funding_current_price/item.funding_target_price*100)}%
													<span style="margin: 0px 6px; color: gray;">|</span>
													<fmt:formatNumber value="${item.funding_current_price}" type="number"/>원 달성
												</div>
												<div class="fund_result">
													<c:if test="${item.funding_current_state eq 0}">
														진행 중
													</c:if>
													<c:if test="${item.funding_current_state eq 1}">
														성공
													</c:if>
													<c:if test="${item.funding_current_state eq 2}">
														종료
													</c:if>
												</div>
											</div>
					                    </div>
					                </div>
					            </div>
							</c:if>
							<!-- 스토어 -->
							<c:if test="${ item.zzim_category eq 1 }">
					            <div class="zzim_inner">
					                <div class="zzim_card">
					                    <div class="zzim_image" style="background-image: url(../resources/upload/store/${item.store_thumbnail})">
					                        <div class="zzim_cate" style="background: #edc64f;">스토어</div>
					                        <div class="zzim_cancel">
	                							<button type="button" id="zzimDelBtn" class="zzim_cancel_btn" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}'">
					                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
												</svg>
												</button>
					                        </div>
					                    </div>
					                    <div class="zzim_text" onclick="location.href='../store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding }'">
					                        <div class="zzim_title">${item.store_title}</div>
											<div class="zzim_about2">
												<div class="zzim_price">
													<fmt:formatNumber value="${item.store_price}" type="number"/>원
												</div>
												<div></div>
											</div>
					                    </div>
					                </div>
					            </div>
							</c:if>
           							</c:forEach>
           							</div>
           						</c:if>
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
</script>
<%--                 <c:if test="${myZzimList.size()>0}"> --%>
<%-- 				<c:forEach var="item" items="${myZzimList}"> --%>
<!-- 					펀딩찜 -->
<%-- 					<c:if test="${ item.zzim_category eq 0 }">펀딩 --%>
<!-- 						<div class="row fundingRow"> -->
<!-- 			                  이미지 -->
<!-- 			                  <div class="col-md-4 col-sm-12 jb-wrap"> -->
<%-- 			                      <div class="card" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor : pointer"> --%>
<!-- 				                      이미지 -->
<!-- 				                      <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px"> -->
<%-- 				                          <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img"> --%>
<!-- 				                      </div> -->
<!-- 			                      </div> -->
<!-- 			                  </div> -->
<!-- 			                  내용 -->
<!-- 			                  <div class="col-md-8 col-sm-12"> -->
<!-- 			                    <table class="table"> -->
<!-- 			                      <thead class="table-light" style="border-bottom: 2px solid gray;"> -->
<!-- 			                        <tr> -->
<!-- 			                            <th colspan="2" style="text-align: center;"> -->
<%-- 			                              <h4 style="font-weight: bold; text-align: left;">${ item.funding_title }</h4> --%>
<!-- 			                            </th> -->
<!-- 			                        </tr> -->
<!-- 			                      </thead> -->
<!-- 			                      <tbody> -->
<!-- 			                        <tr> -->
<!-- 			                            <td style="border-top:none;" colspan="2"> -->
<!-- 			                              <div class="row"> -->
			                              
<!-- 			                              남은 날짜 계산 -->
<%-- 							                <c:set var="now" value="<%=new java.util.Date()%>"/> --%>
<%-- 							                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  --%>
							
<%-- 							                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/> --%>
<%-- 							                <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/> --%>
<%-- 							                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" /> --%>
<%-- 							                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" /> --%>
<!-- 							              남은 날짜 계산 끝 -->
			                              
<%-- 			                                <div class="col-md-6"><h5>${endDate - nowDate} 일 남음</h5></div> --%>
<%-- 			                                <div class="col-md-6" style="text-align: right; color:red;"><h5>${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</h5></div> --%>
<!-- 			                              </div> -->
<!-- 			                              <div class="progress" style="height: 10px;"> -->
<%-- 			                                <div class="progress-bar bg-info" role="progressbar" style="width: ${Math.round(item.funding_current_price/item.funding_target_price*100)}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div> --%>
<!-- 			                              </div> -->
<!-- 			                            </td> -->
<!-- 			                        </tr> -->
<!-- 			                        <tr> -->
<!-- 			                            <th style="border-top:none;" colspan="2"> -->
<%-- 			                              <h4>${ item.funding_current_price } 원 펀딩</h4> --%>
<!-- 			                            </th> -->
<!-- 			                        </tr> -->
<!-- 			                        <tr> -->
<!-- 			                          <th style="border-top:none;" colspan="2"> -->
<%-- 			                            <h4>${Math.round(item.funding_current_price/item.funding_target_price*100)} 명의 서포터</h4> --%>
<!-- 			                          </th> -->
<!-- 			                        </tr> -->
<!-- 			                        <tr> -->
<!-- 			                          <th style="border-top:none;" colspan="2"> -->
<!-- 			                            <div style="text-align: right; position: absolute; bottom: 0px; right:25px;"> -->
<%-- 							                <button type="button" id="zzimDelBtn" class="FVbtn2 notZzim" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?funding_idx=${item.funding_idx}'"> --%>
<!-- 							                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"> -->
<!-- 													  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> -->
<!-- 													</svg> -->
<!-- 							                    	찜취소 -->
<!-- 							                </button> -->
<!-- 			                            </div> -->
<!-- 			                          </th> -->
<!-- 			                      </tr> -->
<!-- 			                      </tbody> -->
<!-- 			                    </table> -->
<!-- 			                  </div>          -->
<!-- 			                </div> -->
<!-- 			                <br> -->
<!-- 			                <hr> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${ item.zzim_category eq 1 }">스토어 --%>
<!-- 						<div class="row fundingRow"> -->
<!-- 			                  이미지 -->
<!-- 			                  <div class="col-md-4 col-sm-12 jb-wrap"> -->
<%-- 			                      <div class="card" onclick="location.href='../store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding }'" style="cursor : pointer"> --%>
<!-- 				                      이미지 -->
<!-- 				                      <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px"> -->
<%-- 				                          <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img"> --%>
<!-- 				                      </div> -->
<!-- 			                      </div> -->
<!-- 			                  </div> -->
<!-- 			                  내용 -->
<!-- 			                  <div class="col-md-8 col-sm-12"> -->
<!-- 			                    <table class="table"> -->
<!-- 			                      <thead class="table-light" style="border-bottom: 2px solid gray;"> -->
<!-- 			                        <tr> -->
			                        	
<!-- 			                            <th colspan="2" style="text-align: center;"> -->
<%-- 			                              <h4 style="font-weight: bold; text-align: left;">${ item.store_title }</h4> --%>
<!-- 			                            </th> -->
<!-- 			                        </tr> -->
<!-- 			                      </thead> -->
<!-- 			                      <tbody> -->
<!-- 			                  		<tr> -->
<!-- 			                            <th style="border-top:none;" colspan="2"> -->
<%-- 			                              <h4>${ item.store_price } 원</h4> --%>
<!-- 			                            </th> -->
<!-- 			                        </tr> -->
<!-- 			                        <tr> -->
			                        	
<!-- 			                          <th style="border-top:none;" colspan="2"> -->
<!-- 			                          별점 가져오기 -->
<!-- 			                            <div style="text-align: right; position: absolute; bottom: 0px; right:25px;"> -->
<%-- 							                <button type="button" class="FVbtn2 notZzim" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}'"> --%>
<!-- 							                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16"> -->
<!-- 													  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> -->
<!-- 													</svg> -->
<!-- 							                    	찜취소 -->
<!-- 							                </button> -->
<!-- 			                            </div> -->
<!-- 			                          </th> -->
<!-- 			                      </tr> -->
<!-- 			                      </tbody> -->
<!-- 			                    </table> -->
<!-- 			                  </div>          -->
<!-- 			                </div> -->
<!-- 			                <br> -->
<!-- 			                <hr> -->
<%-- 					</c:if> --%>
                
<%--                 </c:forEach> --%>
<%--                 </c:if> --%>
                
        	</div>
    	</div>
	</div>
</main>

<c:import url="/footer.do"></c:import>
    
</body>
</html>