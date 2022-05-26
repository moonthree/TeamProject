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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script type="text/javascript">
	// Accㄴㄴ
	$(document).on("click", ".menu div", function() {
	  var numberIndex = $(this).index();
	
	  if (!$(this).is("active")) {
	    $(".menu div").removeClass("active");
	    $(".nacc li").removeClass("active");
	
	    $(this).addClass("active");
	    $(".nacc").find("li:eq(" + numberIndex + ")").addClass("active");
	  }
	});
	$(document).ready(function() {
	    $(".dropdown-toggle").dropdown();
	});
	
</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage.css">

<style>
/* 프사 */
.profile_img{
	width:110px;
	height:110px;
	border-radius: 70px;
}
/* 버튼 */
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    background-color:transparent;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.02);
    cursor: pointer;
}
.w-btn-brown {
    border: 2px solid black;
}
.button-6{
	white-space: nowrap;
}

#messageModal {
  position: fixed;
  right: 15px;
  bottom: 15px;
  cursor : pointer;
}
@media screen and (min-width: 991px) { .smaller { width:575px; } }
@media screen and (max-width: 991px) { .smaller { width:415px; } }
@media screen and (max-width: 767px) { .smaller { width:455px; } }
</style>
<title>마이페이지</title>
</head>
<body>
<%-- <%@include file ="../header.jsp" %> --%>
<c:import url="/header.do"></c:import>
<c:import url="/message.do"></c:import>


<main>
	<div class="container">
		<div style="text-align:center;">
			<table style="border:1px solid black; text-align : center; font-size : 20px;">
				<thead>		
					<tr>
						<td style="width:20%"><a href="mypage2.do">마이페이지2</a></td>
						<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/approval.do">상품 승인 페이지(관리자)</a></td>
						<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/management_product.do">상품 관리 페이지(관리자)</a></td>
						<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/management_member.do?check=3">회원 관리 페이지(관리자)</a></td>
					</tr>
				</thead>
			</table>
		</div>
		<div class="mypage_background"></div>
            <div class="row">
            	<div class="col-md-12 mypage_header">
            		<c:if test="${member.member_level eq 1}">
	            		<div class="tabs">
		            		<a href="mypage.do" class="tab_check" style="text-decoration: none;">소비자</a>
		            		<a href="mypage2.do" class="tab" style="text-decoration: none;">판매자</a>
	            		</div>
            		</c:if>
            	</div>
                <div class="col-md-3 cols-sm-12">
                    <div class="my_top">
                        <c:choose>
                               <c:when test="${ empty member.member_photo }">
                                   <img src="../resources/image/111.png" alt="profile_img" class="profile_img">
                               </c:when>
                               <c:otherwise>
                                <img src="../resources/upload/${member.member_photo }" alt="profile_img" class="profile_img">
                               </c:otherwise>
                        </c:choose>
                        <p>${login.member_name}님</p>
                    </div>
                    <div class="my_middle">
                        <h5>쇼핑MY</h5>
                        <a href="info_funding.do">내가 펀딩한 상품<span>></span></a><br>
                        <a href="info_store.do">내가 구매한 상품<span>></span></a><br>
                        <a href="info_zzim.do">내가 찜한 상품<span>></span></a>
                    </div>
                    <div class="my_bottom">
                        <p>
                            <a href="my_info.do">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person"
                                    viewBox="0 0 16 20">
                                    <path
                                        d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                </svg>
                                &nbsp;<span>내 정보</span>
                            </a>
                        </p>
                        <p>
                            <a href="../notice/notice_list.do">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone"
                                    viewBox="0 0 16 20">
                                    <path
                                        d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z" />
                                </svg>
                                &nbsp;공지사항
                            </a>
                        </p>
                        <p>
                            <a href="../service/service_list.do">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-question-circle"
                                    viewBox="0 0 16 20">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
                                        d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
                                &nbsp;고객센터
                            </a>
                        </p>
                    </div>
                </div>
                <div class="col-md-9 cols-sm-12" >
                	<div class="right_container">
                		<ul id="myTab1" role="tablist" class="nav nav-tabs nav-pills with-arrow flex-column flex-sm-row text-center">
				            <li class="nav-item flex-sm-fill">
				             	<a id="funding-tab" data-toggle="tab" href="#funding" role="tab" aria-controls="funding" aria-selected="true" class="nav-link text-uppercase font-weight-bold mr-sm-3 border active">
				             		<div class="box_title">펀딩</div>
				             	</a>
				            </li>
				            <li class="nav-item flex-sm-fill">
								<a id="store-tab" data-toggle="tab" href="#store" role="tab" aria-controls="store" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 border">
									<div class="box_title">스토어</div>
								</a>
				            </li>
				            <li class="nav-item flex-sm-fill">
				              	<a id="zzim1-tab" data-toggle="tab" href="#zzim" role="tab" aria-controls="zzim" aria-selected="false" class="nav-link text-uppercase font-weight-bold border">
				              		<div class="box_title">찜</div>
				              	</a>
				            </li>
				        </ul>
				          
				          <div id="myTab1Content" class="tab-content">
				          	<!-- 펀딩 -->
				            <div id="funding" role="tabpanel" aria-labelledby="funding-tab" class="tab-pane fade show active three_list">
					          	<div class="select_info">
					          		<c:if test="${countFunding eq 0}">
					          			<div class="no_list">펀딩 내역이 없습니다.</div>
					          		</c:if>
					          		<c:if test="${countFunding ne 0}">
						          		<div class="box_num">
						          			<span class="box_num_span">${countFunding}</span>건의 펀딩 내역이 있습니다.
						          		</div>
				                        <div>
				                        	<button type="button" class="btn_info_detail" onclick="location.href='info_funding.do'">펀딩 내역 보기 ><i class="icon-effect ion-ios-arrow-round-forward"></i></button>
				                        </div>
					          		</c:if>
					          	</div>
					          	<!-- 펀딩 리스트 3개 출력 -->
				            	<div class="mydiv" id="mydiv">
			                        <c:if test="${select3Funding.size()>0}">
			                        <c:forEach var="item" items="${select3Funding}">
			                        	<!-- 1. 결제 예약 / 펀딩 진행 중 (funding_current_state : 0) -->
			                        	<c:if test="${item.funding_current_state eq 0}">
			                            <div class="card_container" onclick="location.href='info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" style="cursor:pointer;">
			                            	<div class="info_container1">
			                            		<div><span class="text_bold">펀딩 후원 번호</span>${item.funding_order_idx}</div>
			                            		<div><span class="text_bold">후원 날짜</span><fmt:formatDate value="${item.funding_order_date}" pattern="yyyy. MM. dd" /></div>
			                            	</div>
			                            	<div class="info_container2">
				                            	<!-- 이미지 출력 -->
				                            	<div class="image_container">
				                            		<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
				                            	</div>
				                            	<!-- 내용 출력 -->
				                            	<div class="text_container">
				                            		<div class="text_category">
				                            			<c:choose>
	                                                        <c:when test="${item.funding_category eq 0}">강아지 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 1}">고양이 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 2}">다른 동물 용품</c:when>
	                                                    </c:choose>
				                            		</div>
				                            		<div class="text_title">
				                            			<a class="text_title_a" href="info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }">${item.funding_title}</a>
				                            		</div>
				                            		<div class="text_comnper">
					                            		<div class="text_company">by. ${item.member_name}</div>
				                            			<div>
				                            				<fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
<%-- 				                            				<span class="text_bold">펀딩 마감일</span><fmt:formatDate value="${end}" pattern="yyyy. MM. dd" />  --%>
				                            			</div>
					                            		<div class="text_percent">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>
				                            		</div>
					                            	<div class="text_pay">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold">결제 예정일</span>
						                            		<fmt:parseDate type="both" value ="${item.funding_end_date}" var="var" pattern="yyyy-MM-dd" />
															<c:set var="pay_date" value="${var}" />
															<c:set target="${pay_date}" property="time" value="${pay_date.time + 86400000}" />
															<fmt:formatDate value="${pay_date}" pattern="yyyy. MM. dd" />
					                            		</div>
					                            		<div class="text_pay_amount"><span class="text_bold" style="margin-right: 0px;"><fmt:formatNumber value="${item.funding_order_total_price}" type="number"/>원 결제 예약</span></div>
					                            	</div>
				                            	</div>
			                            	</div>
			                            </div>
			                            </c:if>
			                            
			                            <!-- 2. 결제 성공 / 펀딩 성공 (funding_current_state : 1) -->
			                        	<c:if test="${item.funding_current_state eq 1}">
			                            <div class="card_container" onclick="location.href='info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" style="cursor:pointer;">
			                            	<div class="info_container1">
			                            		<div><span class="text_bold">펀딩 후원 번호</span>${item.funding_order_idx}</div>
			                            		<div><span class="text_bold">후원 날짜</span><fmt:formatDate value="${item.funding_order_date}" pattern="yyyy. MM. dd" /></div>
			                            	</div>
			                            	<div class="info_container2">
				                            	<!-- 이미지 출력 -->
				                            	<div class="image_container">
				                            		<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
				                            	</div>
				                            	<!-- 내용 출력 -->
				                            	<div class="text_container">
				                            		<div class="text_category">
				                            			<c:choose>
	                                                        <c:when test="${item.funding_category eq 0}">강아지 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 1}">고양이 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 2}">다른 동물 용품</c:when>
	                                                    </c:choose>
				                            		</div>
				                            		<div class="text_title">
				                            			<a class="text_title_a" href="info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }">${item.funding_title}</a>
				                            		</div>
				                            		<div class="text_comnper">
					                            		<div class="text_company">by. ${item.member_name}</div>
				                            			<div>
				                            				<fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
<%-- 				                            				<span class="text_bold">펀딩 마감일</span><fmt:formatDate value="${end}" pattern="yyyy. MM. dd" />  --%>
				                            			</div>
					                            		<div class="text_percent">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>
				                            		</div>
					                            	<div class="text_pay">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold">펀딩 성공</span>
					                            		</div>
					                            		<div class="text_pay_amount"><span class="text_bold" style="margin-right: 0px;"><fmt:formatNumber value="${item.funding_order_total_price}" type="number"/>원 결제 완료</span></div>
					                            	</div>
				                            	</div>
			                            	</div>
			                            </div>
			                            </c:if>
			                            
			                            
			                            <!-- 3. 펀딩 실패 (funding_current_state : 2) -->
			                        	<c:if test="${item.funding_current_state eq 2}">
			                            <div class="card_container" style="background-color: #f3f4f7;" onclick="location.href='info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" style="cursor:pointer;">
			                            	<div class="info_container1">
			                            		<div><span class="text_bold">펀딩 후원 번호</span>${item.funding_order_idx}</div>
			                            		<div><span class="text_bold">후원 날짜</span><fmt:formatDate value="${item.funding_order_date}" pattern="yyyy. MM. dd" /></div>
			                            	</div>
			                            	<div class="info_container2">
				                            	<!-- 이미지 출력 -->
				                            	<div class="image_container">
				                            		<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
				                            	</div>
				                            	<!-- 내용 출력 -->
				                            	<div class="text_container">
				                            		<div class="text_category">
				                            			<c:choose>
	                                                        <c:when test="${item.funding_category eq 0}">강아지 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 1}">고양이 용품</c:when>
	                                                        <c:when test="${item.funding_category eq 2}">다른 동물 용품</c:when>
	                                                    </c:choose>
				                            		</div>
				                            		<div class="text_title">
				                            			<a class="text_title_a" style="color: gray;" href="info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }">${item.funding_title}</a>
				                            		</div>
				                            		<div class="text_comnper">
					                            		<div class="text_company">by. ${item.member_name}</div>
				                            			<div>
				                            				<fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
<%-- 				                            				<span class="text_bold">펀딩 마감일</span><fmt:formatDate value="${end}" pattern="yyyy. MM. dd" />  --%>
				                            			</div>
					                            		<div class="text_percent" style="color: gray;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>
				                            		</div>
					                            	<div class="text_pay">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold" style="color: gray;">펀딩 실패</span>
					                            		</div>
					                            	</div>
				                            	</div>
			                            	</div>
			                            </div>
			                            </c:if>
			                        </c:forEach>
			                        </c:if>
			                    </div>
				            </div>
				            
				            <!-- 스토어 -->
				            <div id="store" role="tabpanel" aria-labelledby="store-tab" class="tab-pane fade three_list">
				            	<div class="select_info">
					          		<c:if test="${countStore eq 0}">
					          			<div class="no_list">스토어 주문 내역이 없습니다.</div>
					          		</c:if>
					          		<c:if test="${countStore ne 0}">
						          		<div class="box_num">
						          			<span class="box_num_span">${countStore}</span>건의 스토어 주문 내역이 있습니다.
						          		</div>
				                        <div>
				                        	<button type="button" class="btn_info_detail" onclick="location.href='info_store.do'">스토어 내역 보기 ><i class="icon-effect ion-ios-arrow-round-forward"></i></button>
				                        </div>
					          		</c:if>
					          	</div>
				            	<div class="mydiv" id="mydiv">
								<c:if test="${select3Store.size()>0}">
									<c:forEach var="item" items="${select3Store}">
			                            <div class="card_container" onclick="location.href='info_store_detail.do?store_idx=${item.store_idx}&store_order_idx=${ item.store_order_idx}'" style="cursor:pointer;">
			                            	<div class="info_container1">
			                            		<div><span class="text_bold">스토어 주문 번호</span>${item.store_order_idx}</div>
			                            		<div><span class="text_bold">주문 날짜</span><fmt:formatDate value="${item.store_order_date}" pattern="yyyy. MM. dd" /></div>
			                            	</div>
			                            	<div class="info_container2">
				                            	<!-- 이미지 출력 -->
				                            	<div class="image_container">
				                            		<img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
				                            	</div>
				                            	<!-- 내용 출력 -->
				                            	<div class="text_container">
				                            		<div class="text_category">
				                            			<c:choose>
						                            		<c:when test="${item.store_category eq 0}">강아지 용품</c:when>
						                            		<c:when test="${item.store_category eq 1}">고양이 용품</c:when>
						                            		<c:when test="${item.store_category eq 2}">다른 동물 용품</c:when>
						                            	</c:choose>
				                            		</div>
				                            		<div class="text_title">
				                            			<a class="text_title_a" href="info_store_detail.do?store_idx=${item.store_idx}&store_order_idx=${ item.store_order_idx}">${item.store_title}</a>
				                            		</div>
				                            		<div class="text_comnper">
					                            		<div class="text_company">by. ${item.member_name}</div>
				                            		</div>
					                            	<div class="text_pay">
					                            		<!-- 1. 주문 확인 중 / 결제 성공  (store_express_state : 0) -->
			                        					<c:if test="${item.store_express_state eq 0}">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold">주문 확인 중</span>
					                            		</div>
					                            		<div class="text_pay_amount"><span class="text_bold" style="margin-right: 0px;"><fmt:formatNumber value="${item.store_order_total_price}" type="number"/>원 결제</span></div>
			                        					</c:if>
					                            		<!-- 2. 배송 중 / 판매자 확인 (store_express_state : 1) -->
			                        					<c:if test="${item.store_express_state eq 1}">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold">배송 중</span>
					                            		</div>
					                            		<div class="text_pay_amount"><span class="text_bold" style="margin-right: 0px;"><fmt:formatNumber value="${item.store_order_total_price}" type="number"/>원 결제</span></div>
			                        					</c:if>
					                            		<!-- 3. 주문 취소 / 결제 환불 (store_express_state : 2) -->
			                        					<c:if test="${item.store_express_state eq 2}">
					                            		<div class="text_pay_date">
					                            			<span class="text_bold">주문 취소</span>
					                            		</div>
					                            		<div class="text_pay_amount"><span class="text_bold" style="margin-right: 0px;">결제가 취소되었습니다.</span></div>
			                        					</c:if>
					                            	</div>
				                            	</div>
			                            	</div>
			                            </div>
			                    </c:forEach>
			                    </c:if>
			            	</div>
				            </div>
				            <!-- 찜 -->
				            <div id="zzim" role="tabpanel" aria-labelledby="zzim-tab" class="tab-pane fade three_list">
				            	<div class="select_info">
					          		<c:if test="${countZzim eq 0}">
					          			<div class="no_list">찜 내역이 없습니다.</div>
					          		</c:if>
					          		<c:if test="${countZzim ne 0}">
						          		<div class="box_num">
						          			<span class="box_num_span">${countZzim}</span>건의 찜 내역이 있습니다.
						          		</div>
				                        <div>
				                        	<button type="button" class="btn_info_detail" onclick="location.href='info_zzim.do'">찜 내역 보기 ><i class="icon-effect ion-ios-arrow-round-forward"></i></button>
				                        </div>
					          		</c:if>
					          	</div>
				            	<div class="mydiv" id="mydiv">
								<c:if test="${select3Zzim.size()>0}">
									<c:forEach var="item" items="${select3Zzim}">
			                    <div class="card mb-3"  onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
			                      <div class="row g-0">
			                        <div class="col-lg-5 col-md-6">
			                          <!--이미지-->
				                      <div class="card img-container">
			                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
			                              <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
			                            </div>
				                      </div>
			                        </div>
			                        <div class="col-lg-7 col-md-6">
			                          <div class="card-body" style="margin-left: -20px;">
			                            <div class="row">
				                          	<div class="col-md-6">
				                          		<c:choose>
				                            		<c:when test="${ item.funding_category eq 0 }">강아지 용품</c:when>
				                            		<c:when test="${ item.funding_category eq 1 }">고양이 용품</c:when>
				                            		<c:when test="${ item.funding_category eq 2 }">다른 동물 용품</c:when>
				                            	</c:choose>
				                          	</div>
				                          	
				                          </div>
			                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5>
			                            
			                          </div>
			                        </div> 
			                      </div>
			                    </div>
			                    </c:forEach>
			                    </c:if>
			            	</div>
				            </div>
				         </div>
                	</div>
                </div>
            </div>
        </div>
<!--메세지 모탈 팝업 버튼 -->
    <div id="messageModal" data-toggle="modal" data-target="#sidebar-right"><img src="../resources/image/message/message.png" width="70px"/></div>     
</main>
<c:import url="/footer.do"></c:import>
<script>

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>