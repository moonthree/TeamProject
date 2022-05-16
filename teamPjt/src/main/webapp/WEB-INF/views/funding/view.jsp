<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  
</head>
<body>
	<c:import url="/header.do"></c:import>
	<main>
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <c:set var="seller" value="${read.member_idx }"/> <!-- 판매자 -->
    <input type="number" id="member_idx" name="member_idx" value="${login.member_idx}" style="display:none;"/>
    
    <!-- 글 번호 -->
    <form id="read_funding_form">
    	<input type="number" id="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;"/> 
    </form>
	<!-- 썸네일 -->
    <div class="card bg-dark text-white topcard">
        <img src="../resources/image/funding_main/${read.funding_thumbnail }" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            
            <h5 class="card-category">
	           	<c:if test="${read.funding_category == 0 }">
	           		강아지 용품
	           	</c:if>
	           	<c:if test="${read.funding_category == 1 }">
	           		고양이 용품
	           	</c:if>
	           	<c:if test="${read.funding_category == 2 }">
	           		반려동물 용품
	           	</c:if>
            </h5>
            <br>
            <h3 class="card-title">${zzim.size()}${read.funding_title }</h3>
        </div>
    </div>
    <!-- -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
               <img src="../resources/upload/funding/${read.funding_thumbnail}" class="card-img-top" alt="...">
            </div>
            <div class="col-md-4 col-sm-12 topContent">
            
            	<!-- 남은 날짜 계산 -->
                <c:set var="now" value="<%=new java.util.Date()%>"/>
                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd " /></c:set> 
                
                <c:set var="now5"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 
                <fmt:parseDate var="nowHour" value="${now5 }" pattern="yyyy-MM-dd HH"/>

                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
                <fmt:parseDate var="end" value="${read.funding_end_date }" pattern="yyyy-MM-dd"/>
                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
                <!-- 남은 날짜 계산 끝 -->
                <fmt:parseNumber var="endDate2" value="${end.time / (1000*60*60)}" integerOnly="true" />
                <fmt:parseNumber var="nowHour2" value="${nowHour.time / (1000*60*60)}" integerOnly="true" />
            	
            	<c:if test="${endDate - nowDate le 1}">
            		<h3>마감 ${endDate2 - nowHour2 - 1}시간 전!!!</h3>
            	</c:if>
            	<c:if test="${endDate - nowDate gt 1}">
                	<h3>${endDate - nowDate}일 남음</h3>
            	</c:if>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${read.funding_current_price/read.funding_target_price*100}%" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h3>${Math.round(read.funding_current_price/read.funding_target_price*100)}<span class="smalltext"> %달성</span></h3>
                <h3><fmt:formatNumber value="${read.funding_current_price}" type="number" /><span class="smalltext"> 원 펀딩</span></h3>
                <h3><span id="supportNum"></span><span class="smalltext"> 명의 서포터</span></h3>
                
				<!-- 로그인 처리 -->
                <c:if test="${login eq null}">
				<!-- Button trigger modal -->
					<button type="button" class="btn btn-info FVbtn" data-toggle="modal" data-target="#loginModal">
					  펀딩하기
					</button>
					<button type="button" class="FVbtn2" data-toggle="modal" data-target="#loginModal">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
	                        viewBox="0 0 16 16">
	                        <path
	                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                    </svg>
	                    	찜하기
	                </button>
	                <button type="button" class="FVbtn2 notZzim" data-id="${loginPerson }" data-id2="${read.funding_idx }">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart"
		                        viewBox="0 0 16 16">
		                        <path
		                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                    </svg>
		                   	 찜 취소하기
		             </button> 
                </c:if>
                <c:if test="${login ne null}">

                	<!-- funding_idx 값 포함해서 option 페이지로 이동 -->
	                <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/option.do?funding_idx=${read.funding_idx}'" class="btn btn-info FVbtn">펀딩하기</button>
	        
                		<button type="button" id="zzimBtn" class="FVbtn2 doZzim" data-id="${loginPerson }" data-id2="${read.funding_idx }">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
		                        viewBox="0 0 16 16">
		                        <path
		                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                    </svg>
		                    	찜하기
		                </button>
		                
		                <button type="button" id="zzimDelBtn" class="FVbtn2 notZzim" data-id="${loginPerson }" data-id2="${read.funding_idx }">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
		                </button> 
	                          
                </c:if>
                <!-- 로그인 처리 끝 -->
                <div class="fundingGoal">
                    목표금액 : <fmt:formatNumber value="${read.funding_target_price}" type="number" />원<br>
                    펀딩기간 : ${read.funding_start_date }~${read.funding_end_date }<br>
                    <span class="fundingGoalText">*100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</span>
                </div>
            </div>
        </div>



        <!-- 프로젝트/스토어/커뮤니티/Q&A탭 -->
        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link active" data-toggle="tab" href="#FVproject" role="tab" aria-controls="FVproject"
                    aria-selected="true"><span>프로젝트</span></a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVnotice" role="tab" aria-controls="FVnotice"
                    aria-selected="false"><span>공지</span></a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVcommu" role="tab" aria-controls="FVcommu"
                    aria-selected="false"><span>커뮤니티</span></a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVQnA" role="tab" aria-controls="FVQnA"
                    aria-selected="false"><span>Q&A</span></a>
            </li>
        </ul>
        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
        <div class="tab-content" id="myTabContent">
            <!--프로젝트-->
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
                PDF 파일 올라올 예정
          <%--      <iframe class="iframe" src="../resources/upload/funding/${read.funding_content}#toolbar=1" style="width:100%; height:150vh;"></iframe>  --%>
          
               <iframe class="iframe" src="../resources/upload/funding/${read.funding_content}#toolbar=0" style="width:100%; height:150vh;"></iframe> 
            <%--    <embed src="../resources/upload/funding/${read.funding_content}#toolbar=0" type="application/pdf" width="100%" height="1000px">  --%>
            </div>
            <!--공지-->
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
                공지 사항 사진 파일 올라올 예정
                 <img src="../resources/upload/funding/${read.funding_notice}" class="card-img-top img2" alt="...">
                 
                 
            </div>
            <!--커뮤니티-->
            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
            	<div class="row">
                    <div class="commuDiv1 col-md-7 col-sm-12">
                        <p class="commuP1">
                            서포터님!<br>처음 <span class="bold">메이커의 열정과 가치에 공감</span>해주셨듯, 마지막까지 <span class="bold">메이커를 응원</span>해주세요!
                        </p>
                    </div>
                    <div class="commuDiv2 col-md-5 col-sm-12">
                        <p class="commuP3">
                            리워드, 배송 등 펀딩에 대해 궁금한 사항이 있다면?<br>
                            <span class="commuP3Span"><span class="bold">Q&A 탭</span>을 통해 메이커에게 문의할 수 있어요!</span>
                            <br>
                            <div>
                            	<div style= "width: 50px; height: 40px; border-radius: 70%; display:inline-block;">
	                            <c:choose>
		                        	<c:when test="${read.memberVO.member_photo eq 'http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg,'}">
		                        		<div class="profile_div">
		                        			<img src="../resources/image/KakaoTalk_20220418_121005755.png" alt="profile_img" class="profile_img">
		                        		</div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="profile_div">
											<img src="../resources/upload/${read.memberVO.member_photo }" alt="profile_img" class="profile_img">
										</div>
		                        	</c:otherwise>
		                        </c:choose>
		                        </div>
		                       	<span class="commuP3Span2">${read.memberVO.member_business_name }  /////메세지 되면 버튼/////</span>
	                        </div> 
                        </p>
                    </div>
                    <br>
                    <hr>
                    <div class="commuDiv3 col-sm-12">
                        <p class="commuP2">
                            펫딩에서 펀딩하는 방법이 궁금하다면?<br>
                            <span class="commuP2Span">FAQ</span>
                        </p>
                        <div class="commuP2Faq commuFaq01">펀딩 했어요. 결제는 언제, 어떻게 진행되나요? <span class="commuP2FaqSpan">∨</span></div>
	                        <div class="commuP2FaqDetail commuFaq01D">
	                        	펀딩기간 중에는 결제 예약 상태이며, 프로젝트 종료 후 다음 1영업일 5시에 결제가 진행됩니다. 이때, 결제 실패된 건에 한하여 종료일+4영업일동안 매일 5시에
	                            결제가 진행됩니다. (펀딩 종료일+4영업일 오후 5시
	                            4차 최종 결제 진행
	                        </div>
                        <div class="commuP2Faq commuFaq02 commuP2FaqMid">결제가 진행된 후,다른 결제 정보로 변경할 수 있나요? <span class="commuP2FaqSpan">∨</span></div>
                        	<div class="commuP2FaqDetail commuFaq02D">
	                        	결제 예약으로 진행되는 크라우드 펀딩 특성상 이미 종료된 프로젝트는 취소 후 재펀딩이 불가능하니, 결제 전 등록한 결제정보가 맞는지 확인해주세요.
	                        </div>
                        <div id="commuFaqMore"><button class="moreFoldBtn">더보기∨</button></div>
                        <div id="commuFaqHide">
	                        <div class="commuP2Faq commuFaq03">리워드 배송은 언제되나요? 해외 배송도 가능한가요? <span class="commuP2FaqSpan">∨</span></div>
	                        	<div class="commuP2FaqDetail commuFaq03D">
		                        	프로젝트 진행 중에는 [나의 리워드] - [펀딩내역]에서 직접 변경이 가능합니다.
									펀딩이 종료된 이후에는 직접 변경이 불가능하니, [QnA탭]을 통해 문의해주세요.
		                        </div>
	                        <div class="commuP2Faq commuFaq04">교환/환불/AS는 어디로 문의해야하나요? <span class="commuP2FaqSpan">∨</span></div>
	                        	<div class="commuP2FaqDetail commuFaq04D">
		                        	해당 프로젝트의 교환/환불/AS 기준은 상단 [공지]탭을 확인해주세요.
		                        </div>
	                        <div class="commuP2Faq commuFaq05">펀딩 취소는 어떻게 하나요? 부분 취소도 가능한가요? <span class="commuP2FaqSpan">∨</span></div>
	                        	<div class="commuP2FaqDetail commuFaq05D">
		                        	프로젝트 종료 후에는 메이커가 서포터를 위해 리워드 제작을 시작한 상태입니다. 따라서 프로젝트 종료 이후에는 펀딩 취소가 불가하니, 종료 이전에 취소해주세요.
									프로젝트가 종료되기 이전에는 [나의 리워드]에서 펀딩 취소가 가능합니다.
									부분 취소는 여러 개의 리워드를 결제 예약한 경우 불가능합니다. 전체 취소 후 재펀딩해주세요.
		                        </div>
	                        <p class="commuP2Faq commuP2FaqLast">
	                            <span class="commuP2FaqLastSpan">펀딩 서비스에 대한 더 궁금한 사항이 있다면?</span>
	                            <br> 
	                            펫딩이 안내드리겠습니다.
	                            <span class="commuP2Btn">
	                                <button class="btn btn-secondary commuP2Btn2" id="guideBtn">이용가이드</button>
	                                <button class="btn btn-outline-secondary commuP2Btn2" id="csBtn">펫딩에 문의하기</button>
	                            </span>
	                        </p>
                        </div>
                        <div id="commuFaqFold"><button class="moreFoldBtn">접기∧</button></div>
                    </div>
                </div>
                <br>
                <hr>
                <br>
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h4 class="commuH4">응원 · 의견 · 체험리뷰&nbsp;<span class="commuTotalNum">${listCommu.size() }</span></h4>
                        <span style="opacity: 0.7;">펀딩 종료전에 남긴 글입니다.</span>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                    	<c:if test="${login eq null}">
                    		<button type="button" class="btn btn-outline-info btn-lg commubtn" id="writeModalButton" data-toggle="modal" data-target="#loginModal">글 남기기</button>
                    	</c:if>
                    	<c:if test="${login ne null}">
                    		<button type="button" id="commuWriteBtn" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#writeModal">글 남기기</button>
                    		<button type="button" id="commuModifyBtn" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#modifyModal" style= "display:none;">수정하기</button>                    		
                    	</c:if>
                    </div>
                </div>
                <!-- 현재 시간 계산 -->
                <c:set var="commuNow"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>				
                <fmt:parseDate var="commuNow2" value="${commuNow }" pattern="yyyy-MM-dd HH:mm:ss"/>     
				<fmt:parseNumber var="commuNowHour" value="${commuNow2.time / (1000*60*60)}" integerOnly="true" />
				<fmt:parseNumber var="commuNowMinute" value="${commuNow2.time / (1000*60)}" integerOnly="true" />
				<!-- 현재 시간 계산 끝 -->
				
				<!-- 댓글 작성 여부를 위해 사용 -->
				<input type="text" id="loginMember" value="${login.member_idx}" style="display:none;"/>
				
				<!-- 댓글 테이블 시작 -->
                <table class="table commutable">
                    <tbody>             	
                    	<c:forEach items="${listCommu }" var="commentList">
                    	
                		<!-- 댓글 작성 여부를 위해 사용 -->    	
                    	<input type="text" class="writeMember" value="${commentList.member_idx}" style="display:none;"/>
                    	
                    	
                    	<!-- 등록 날짜 계산 -->    				
		                <fmt:parseDate var="commuRegDate" value="${commentList.funding_detail_community_regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		                <fmt:parseNumber var="commuRegHour" value="${commuRegDate.time / (1000*60*60)}" integerOnly="true" />
		                <fmt:parseNumber var="commuRegMinute" value="${commuRegDate.time / (1000*60)}" integerOnly="true" />
		                <!-- 등록 날짜 계산 끝 -->
						
						
                    		<tr>
                    			<th scope="row" style= "width: 10%; border-radius: 70%">
                    				<c:choose>
			                        	<c:when test="${commentList.memberVO.member_photo eq 'http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg,'}">
			                        		<div class="profile_div">
			                        			<img src="../resources/image/KakaoTalk_20220418_121005755.png" alt="profile_img" class="profile_img">
			                        		</div>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<div class="profile_div">
												<img src="../resources/upload/${commentList.memberVO.member_photo }" alt="profile_img" class="profile_img">
											</div>
			                        	</c:otherwise>
			                        </c:choose>
                    			</th>
                    				
	                            <th scope="row" style= "width: 90%;">
	                                <span class="commuName">${commentList.memberVO.member_name }</span>
	                                &nbsp;
	                                <%-- <span class="state">펀딩 참여자${commentList.member_idx}</span>
	                                &nbsp; --%>
	                                
	                                
	                                <fmt:parseDate var="commuregdate1" value="${commentList.funding_detail_community_regdate }" pattern="yyyy-MM-dd"/>
	                                <fmt:formatDate var="commuregdate2" value="${commuregdate1 }" pattern="yy.MM.dd"/>
	                                <span class="minute">
	                                <c:if test = "${commentList.funding_detail_community_category eq 0}">
	                                	응원
	                                </c:if>
	                                <c:if test = "${commentList.funding_detail_community_category eq 1}">
	                                	의견
	                                </c:if>
	                                <c:if test = "${commentList.funding_detail_community_category eq 2}">
	                                	체험
	                                </c:if>
	                                &nbsp;
	                                <c:if test = "${commuNowHour - commuRegHour < 1}">
	                                	방금 전
	                                </c:if>
	                                <c:if test = "${commuNowHour - commuRegHour >= 1 && commuNowHour - commuRegHour <= 24}">
	                                	${commuNowHour - commuRegHour}시간 전
	                                </c:if>
	                                <c:if test = "${commuNowHour - commuRegHour > 24}">
	                                	${commuregdate2}
	                                </c:if>
	                                </span>
	                                <c:if test="${login.member_level eq 2}">
               								&nbsp;
               								<button id="adminDoDel" class="btn btn-outline-danger" data-toggle="modal" data-target="#commuAdminModal" data-id="${commentList.member_idx }">삭제</button>
               						</c:if>   
	                                <br>
	                                <br>
	                                <span class="commuContent">
	                                    ${commentList.funding_detail_community_content }
	                                </span>
	                                 
	                            <th>
	                        </tr>
                    	</c:forEach>

                    </tbody>
                </table>
                <div>
		        	<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <c:if test="${prev }">
						    	<li class="page-item"><a class="page-link prev" href="view.do?pageNum=${startPage-1}&funding_idx=${read.funding_idx}#FVcommu">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${startPage}" end="${endPage}" var="idx">
						    	<li class="page-item"><a class="page-link" href="view.do?pageNum=${idx}&funding_idx=${read.funding_idx}#FVcommu">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${next}">
						    	<li class="page-item"><a class="page-link next" href="view.do?pageNum=${endPage+1}&funding_idx=${read.funding_idx}#FVcommu">다음</a></li>
						    </c:if> 
						  </ul>
					 </nav>
				</div>
            </div>
            
            <!--Q&A-->
            <div class="tab-pane fade" id="FVQnA" role="tabpanel" aria-labelledby="FVQnA-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h3 style="padding-top: 10px;">Q&A<span style="font-size: 12px;"> | 참여하려는 펀딩에 대해 궁금한 점이 있으신 경우 문의해주세요.</span></h3>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                        <c:if test="${login eq null}">
                    		<button type="button" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#loginModal">상품 Q&A 작성하기</button>
                    	</c:if>
                    	<c:if test="${login ne null}">
                    		<c:choose>
        						<c:when test="${seller eq loginPerson}">
                    				&nbsp;
        						</c:when>
        						<c:otherwise>
                    				<button type="button" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#qnaModal">상품 Q&A 작성하기</button>
        						</c:otherwise>
       						</c:choose>
                    	</c:if>
                    </div>
                </div>
               <%--  질문 크기 : ${listQna.size() }
                답변 크기 : ${qnaAnswer.size() }
                <br>
                <c:forEach items="${listQna}" var="qnaList" varStatus="status">
                 	qnaList : ${qnaList.funding_qna_idx } <br>
               		<c:forEach items="${qnaAnswer}" var="qnaAnswer" end="0">
               			<c:choose>
               				<c:when test="${qnaList.funding_qna_idx eq qnaAnswer.parent_id }">
               					답변 있음<br>
               				</c:when>
               				<c:otherwise>
               					답변 없음<br>
               				</c:otherwise>
               			</c:choose>
					</c:forEach>
                </c:forEach> --%>
                <table class="table QnAtable">
                    <thead>
                        <tr>
                            <th scope="col">답변 상태</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:forEach items="${listQna}" var="qnaList" varStatus="status">
                    		
                   		<!-- 펀딩 상태 -->
                    		<tr class="tr${qnaList.funding_qna_idx}">
                    			<c:set var="qnaState" value="${qnaList.funding_qna_state }"></c:set>
                    			<c:set var="qnaSecret" value="${qnaList.funding_qna_secret }"></c:set>
                    			<c:if test="${qnaState eq 0}">
                    				<%-- <c:if test="${qnaList.depth eq 0}"> --%>
                    					<td style="width: 15%;">답변 대기</td>
                    					<div class="answer" style="display:none;"></div>
                    				<%-- </c:if> --%>
                    				<%-- <c:if test="${qnaList.depth eq 1}">
                    					<td style="width: 15%;">&nbsp;&nbsp;&nbsp;ㄴ<span class="reply">답변</span></td>
                    				</c:if> --%>
                    				
                    			</c:if>
	                            <c:if test="${qnaState eq 1}">
                    				<td style="width: 15%;">답변 완료</td>
                    				<div class="answer" style="display:none;"></div>
                    			</c:if>
                    			
                   			<!-- 펀딩 제목 -->		
                    			<!-- 비밀글 아니면 -->
                    			<c:if test="${qnaSecret eq 0}">
                    				<td style="width: 45%;">
                    					<div style="max-width: 200px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
                    						<!-- 답변 완료면 -->
                    						<c:if test="${qnaState eq 1}">
	                    						<a class="showQna" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.funding_qna_content}" data-id3="${read.funding_idx }">
		                    						<span class="qnaContent">
		                    							${qnaList.funding_qna_content }
		                    							<input type="text" name="funding_qna_idx" class="funding_qna_idx" value="" style="display:none;"/>
		                    							<input type="text" name="funding_idx" class="funding_idx" value="" style="display:none;"/>
		                    						</span>
	                    						</a>
                    						</c:if>
                    						<!-- 답변 대기면 -->
                    						<c:if test="${qnaState eq 0}">
	                    						<a class="noshowQna" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.funding_qna_content}">
		                    						<span class="qnaContent">
		                    							${qnaList.funding_qna_content }
		                    							<input type="text" name="funding_qna_idx" class="funding_qna_idx" value="" style="display:none;"/>
		                    						</span>
	                    						</a>
                    						</c:if>
                    					</div>
                    				</td>
                    			</c:if>
                    			<!-- 비밀글이면 -->
	                            <c:if test="${qnaSecret eq 1}">
	                            	<td style="width: 45%;">
	                            		<div style="max-width: 300px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
	                            			<!-- 본인, 판매자, 관리자면 클릭 가능 아니면 불가능-->
	                            			<!-- 답변완료면 -->
	                            			<c:if test="${qnaState eq 1}">
	                            				<c:choose>
		                    						<c:when test="${qnaList.member_idx eq loginPerson || seller eq loginPerson || qnaList.funding_qna_writer_idx eq loginPerson || login.member_level eq 2}">
		                    								<a class="showQna" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.funding_qna_content}" data-id3="${read.funding_idx }">
		                    									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
								                                    viewBox="0 0 16 16">
								                                    <path
								                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
								                                </svg>
		                    									<span class="qnaContent">${qnaList.funding_qna_content }</span>
		                    									<input type="text" name="funding_qna_idx" class="funding_qna_idx" value="" style="display:none;"/>
		                    									<input type="text" name="funding_idx" class="funding_idx" value="" style="display:none;"/>
		                    								</a>
		                    						</c:when>
		                    						<c:otherwise>
		                    							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
						                                    viewBox="0 0 16 16">
						                                    <path
						                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
						                                </svg>
				                    					비밀글입니다.
				                    					<span class="qnaContent" style="display:none;">${qnaList.funding_qna_content }</span> 
		                    						</c:otherwise>
		                    					</c:choose>
	                            			</c:if>
	                            			<!-- 답변대기면 -->
	                            			<c:if test="${qnaState eq 0}">
	                            				<c:choose>
		                    						<c:when test="${qnaList.member_idx eq loginPerson || seller eq loginPerson || qnaList.funding_qna_writer_idx eq loginPerson || login.member_level eq 2}">
		                    							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
						                                    viewBox="0 0 16 16">
						                                    <path
						                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
						                                </svg>
				                    					<c:if test="${qnaState eq 0}">
				                    						<a class="noshowQna" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.funding_qna_content}">
					                    						<span class="qnaContent">
					                    							${qnaList.funding_qna_content }
					                    							<input type="text" name="funding_qna_idx" class="funding_qna_idx" value="" style="display:none;"/>
					                    						</span>
				                    						</a>
			                    						</c:if>
		                    						</c:when>
		                    						<c:otherwise>
		                    							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
						                                    viewBox="0 0 16 16">
						                                    <path
						                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
						                                </svg>
				                    					비밀글입니다.
				                    					<span class="qnaContent" style="display:none;">${qnaList.funding_qna_content }</span> 
		                    						</c:otherwise>
		                    					</c:choose>
	                            			</c:if>
                    					</div>
                    				</td>
                    			</c:if>
                   			<!-- 작성자 -->
          						<td style="width: 20%;">${qnaList.memberVO.member_name}</td>
	                            
                           	<!-- 등록일 -->
	                            <fmt:parseDate var="qnaRegDate" value="${qnaList.funding_qna_regdate }" pattern="yyyy-MM-dd"/>
	                            <fmt:formatDate var="qnaRegDate2" value="${qnaRegDate }" pattern="yyyy-MM-dd"/>
	                            
	                            <c:choose>
	                            	<c:when test="${qnaState eq 0 && qnaList.member_idx eq loginPerson && qnaList.depth eq 0}">
               							<td style="width: 20%;"> <!-- 질문 수정 -->
               								${qnaRegDate2} 
               								&nbsp;
               								<button class="doModify btn btn-outline-info" data-toggle="modal" data-target="#qnaModifyModal" data-id="${qnaList.parent_id }" data-id2="${qnaList.funding_qna_idx }" data-id3="${qnaList.member_idx}">수정</button>
               							</td>
               						</c:when>
               						<c:when test="${qnaState eq 0 && seller eq loginPerson && qnaList.depth eq 0}">
               							<td style="width: 20%;"> <!-- 답변 -->
               								${qnaRegDate2}
               								&nbsp;
               								<button class="doAnswer btn btn-warning" data-toggle="modal" data-target="#qnaAnswerModal" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.member_idx }">답변 하기</button>
               							</td>
               						</c:when>
               						<c:when test="${qnaState eq 1 && seller eq loginPerson && qnaList.depth eq 0}">
               							<td style="width: 20%;"> <!-- 답변 수정 -->
               								${qnaRegDate2}
               								&nbsp;
               								<button class="doQnaAnswerModify btn btn-outline-success" data-toggle="modal" data-target="#qnaAnswerModifyModal" data-id="${qnaList.parent_id }" data-id2="${qnaList.funding_qna_idx }" data-id3="${qnaList.member_idx}">답변 수정</button>
               							</td>
               						</c:when>
               						<c:when test="${login.member_level eq 2 && qnaList.depth eq 0}">
               							<td style="width: 20%;"> <!--관리자 삭제 -->
               								${qnaRegDate2}
               								&nbsp;
               								<button class="qnaAdminDoDel btn btn-outline-danger" data-toggle="modal" data-target="#qnaAdminModal" data-id="${qnaList.funding_qna_idx }">삭제</button>
               							</td>
               						</c:when>
               						<c:otherwise>
               							<td style="width: 20%;">${qnaRegDate2}</td>
               						</c:otherwise>
            					</c:choose>
	                            
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
		        	<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <c:if test="${prevQna }">
						    	<li class="page-item"><a class="page-link prev" href="view.do?pageNumQna=${startPageQna-1}&funding_idx=${read.funding_idx}#FVQnA">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${startPageQna}" end="${endPageQna}" var="idx">
						    	<li class="page-item"><a class="page-link" href="view.do?pageNumQna=${idx}&funding_idx=${read.funding_idx}#FVQnA">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${nextQna}">
						    	<li class="page-item"><a class="page-link next" href="view.do?pageNumQna=${endPageQna+1}&funding_idx=${read.funding_idx}#FVQnA">다음</a></li>
						    </c:if> 
						  </ul>
					 </nav>
				</div>
            </div>
        </div>
    </div>
	</main>
	
	<!-- Modal -->
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content login_modal_content">
	      <div class="modal-header login_modal_header">
	        <button type="button" class="login_modal_close close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body login_modal_body">
	      	<h4>로그인이 필요합니다.</h4>
	      </div>
	      <div class="modal-footer login_modal_footer">
	        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/member/join_select.do'" class="login_modalBtn btn btn-outline-info btn-lg">회원가입</button>
	        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/option.do?funding_idx=${read.funding_idx}'" class="login_modalBtn btn btn-info btn-lg">로그인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 <!-- 커뮤니티 글 남기기 모달 -->
    <div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="commuform" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                        <h4 class="writeModalH4">글 남기기</h4>
                        <p>응원∙의견∙체험리뷰를 남겨주세요.<br>
                            판매자의 답변이 필요한 문의 글은 ‘Q&A’를 이용해야 답변을 받을 수 있습니다</p>
                            
                        <button type="button" name="" class="div2 btn btn-outline-info" value=0>
                            응원
                        </button>
                        
                        <button type="button" name="" class="div2 btn btn-outline-info" value=1>
                            의견
                        </button>

                        <button type="button" name="" class="div2 btn btn-outline-info" value=2>
                            체험
                        </button>
						<input type=text name="funding_detail_community_category" value="" style="display:none;"/>
						<input type=text name="funding_idx" value="${read.funding_idx}" style="display:none;"/>
						<input type=text name="member_idx" value="${member.member_idx}" style="display:none;"/>

                        <textarea name="funding_detail_community_content" id="funding_detail_community_content" cols="60" rows="10" placeholder="판매자에게 응원 의견 체험 리뷰를 남겨주세요"></textarea>
                         
                        <p class="commuWriteWarning">
                            최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을
                            유의하여 주시기 바랍니다.
                        </p>

                        <h4 class="bold">글 남기기 유의사항</h4>
                        <p class="commuWriteNotice">
                            1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다. 
                            <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                            <br>3.3. 리워드 관련 문의 및 배송 문의는 'Q&A탭'을 통해 정확한 답변을 받을 수 있습니다.
                            <br>4.4. 서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.
                            <br>5.5. 체험 리뷰는 반드시 펀딩을 위해 진행된 오프라인 전시(체험)에 참여한 후 작성하세요.
                        </p>
                    </div>
                    <div class="modal-footer write_modal_footer">
                        <button type="button" id="SubmitBtn" class="write_modalBtn btn btn-outline-info">등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
	<!-- 커뮤니티 수정하기 모달 -->
    <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="modifyform" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                        <h4 class="writeModalH4">글 수정하기</h4>
                        <p>
                            회원님이 작성한 글을 수정하거나 삭제할 수 있어요
                            <br>판매자의 답변이 필요한 문의 글은 ‘Q&A’를 이용해야 답변을 받을 수 있어요.
                        </p>
    
                        <button type="button" name="" class="div2 btn btn-outline-info" value=0>
                            응원
                        </button>
                        
                        <button type="button" name="" class="div2 btn btn-outline-info" value=1>
                            의견
                        </button>
    
                        <button type="button" name="" class="div2 btn btn-outline-info" value=2>
                            체험
                        </button>
                        <input type=number name="funding_detail_community_category" value="" style="display:none;" />
                        <input type=text name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text name="member_idx" value="${member.member_idx}" style="display:none;" />
    
                        <textarea name="funding_detail_community_content" id="modifyText" cols="60" rows="10"></textarea>
                        
                        <p class="commuWriteWarning">
                            최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을
                            유의하여 주시기 바랍니다.
                        </p>

                        <h4 class="bold">글 남기기 유의사항</h4>
                        <p class="commuWriteNotice">
                            1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다. 
                            <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                            <br>3.3. 리워드 관련 문의 및 배송 문의는 'Q&A탭'을 통해 정확한 답변을 받을 수 있습니다.
                            <br>4.4. 서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.
                            <br>5.5. 체험 리뷰는 반드시 펀딩을 위해 진행된 오프라인 전시(체험)에 참여한 후 작성하세요.
                        </p>
                    </div>
                    
                    <div class="modal-footer write_modal_footer">
                        <button type="button" id="commuModifyButton" class="write_modalBtn btn btn-outline-info">수정</button>
                        <button type="button" id="commuDeleteButton" class="write_modalBtn btn btn-outline-danger">삭제</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <!-- Q&A 등록 모달 -->
    <div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="qnaSubmitForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                        
                        <h4 class="bold">Q&A 작성하기</h4>
                        
                        <p>
                        	판매자의 답변이 필요한 문의 글을 남겨주세요.
                        	<br>펀딩에 대한 응원∙의견∙체험리뷰는 커뮤니티에 작성해주세요.
                        </p>
                        
                        
                    	<input type=number id="funding_qna_secret" name="funding_qna_secret" value="" style="display:none;" />
                        <input type=text id="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text id="member_idx" name="member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_content" id="funding_qna_content" cols="60" rows="10"
                            placeholder="펀딩에 대한 궁금증을 남겨주세요"></textarea>
                        
                        <input type="checkbox" id="cb1" class="cb">
                        <label for="cb1"></label>
                        <p class="cbp">비공개</p>
                        
                        <p class="qnaWriteWarning">
                            최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을
                            유의하여 주시기 바랍니다.
                        </p>

                        <h4 class="bold">Q&A 작성 유의사항</h4>
                        <p class="commuWriteNotice">
                            1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다. 
                            <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                            <br>3.3. 전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의해 주시기 바랍니다.
                            <br>4.4. 응원 및 체험 리뷰는 커뮤니티에 남겨 주세요.
                        </p>
                        
                    
                    </div>
                    <div class="modal-footer write_modal_footer">
                        <button type="button" id="qnaSubmitBtn" class="qnaBtn btn btn-outline-info">등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- Q&A 수정 모달 -->
    <div class="modal fade" id="qnaModifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="qnaModifyForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                    
                        <h4 class="bold">Q&A 수정하기</h4>
                        
                        <input type=number class="parent_id" name="parent_id" value="" style="display:none;" />
                    	<input type=number class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    	<input type=number class="qna_answer_secret" name="funding_qna_secret" value="" style="display:none;" />
                    	<input type=number class="funding_qna_writer_idx" name="funding_qna_writer_idx" value="" style="display:none;" />
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="answer_member_idx" name="answer_member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_content" id="funding_qna_modify" cols="60" rows="10"
                            placeholder="작성하신 글을 수정할 수 있습니다. 답변이 달린 후에는 수정할 수 없으니 주의해주세요."></textarea>
                        
                        <input type="checkbox" id="cb3" class="cb">
                        <label for="cb3"></label>
                        <p class="cbp">비공개</p>
                        
                        <p class="qnaWriteWarning">
                            최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을
                            유의하여 주시기 바랍니다.
                        </p>

                        <h4 class="bold">Q&A 작성 유의사항</h4>
                        <p class="commuWriteNotice">
                            1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다. 
                            <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                            <br>3.3. 전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의해 주시기 바랍니다.
                            <br>4.4. 응원 및 체험 리뷰는 커뮤니티에 남겨 주세요.
                        </p>
                    </div>
                    <div class="modal-footer write_modal_footer">
                    	<c:choose>
	                        <c:when test ="${loginPerson eq seller }">
	                        	<button type="button" id="qnaModifyBtn" class="qnaBtn2 btn btn-outline-info">수정</button>
	                        </c:when>
	                        <c:otherwise>
	                        	<button type="button" id="qnaModifyBtn" class="qnaBtn2 btn btn-outline-info">수정</button>
	                        	<button type="button" id="qnaDeleteBtn" class="qnaBtn3 btn btn-outline-danger">삭제</button>
	                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <!-- Q&A 뷰 모달 -->
    <%-- <div class="modal fade" id="qnaViewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content write_modal_content">
                  <div class="modal-header write_modal_header">
                      <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                  </div>
                  <div class="modal-body write_modal_body">
                  
                      <h4>뷰창</h4>
                      
                      
                  	  <input type=number id="funding_qna_secret" name="funding_qna_secret" value="" style="display:none;" />
                      <input type=text id="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                      <input type=text id="member_idx" name="member_idx" value="${member.member_idx}" style="display:none;" />
                      <!-- <div id="qnaViewDiv" style="max-width: 200px; white-space:normal;">
                      </div> -->
                      <textarea id="qnaViewDiv" cols="60" rows="7" readonly="readonly"></textarea>
                  </div>
              </div>
          </div>
    </div> --%>
    
    <!-- Q&A 답변 모달 -->
    <div class="modal fade" id="qnaAnswerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="qnaAnswerForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                    
                        <h4 class="bold">답변하기</h4>
                        
                        <input type=number class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    	<input type=number class="funding_qna_secret" name="funding_qna_secret" value="" style="display:none;" />
                    	<input type=number class="funding_qna_writer_idx" name="funding_qna_writer_idx" value="" style="display:none;" />
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="answer_member_idx" name="answer_member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_answer_content" id="funding_qna_answer_content" cols="60" rows="7"
                            placeholder="답변을 작성해주세요."></textarea>
                        
                        <!-- <input type="checkbox" id="cb2" class="cb">
                        <label for="cb2"></label>
                        <p class="cbp">비공개</p> -->
                        
                    </div>
                    <div class="modal-footer write_modal_footer">
                    	<button type="button" id="qnaAnswerBtn" class="qnaBtn btn btn-outline-info">답변</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
     <!-- Q&A 답변 수정 모달 -->
    <div class="modal fade" id="qnaAnswerModifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="qnaAnswerModifyForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                    
                        <h4 class="bold">답변 수정</h4>
                        
                        <input type=number class="parent_id" name="parent_id" value="" style="display:none;" />
                    	<input type=number class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    	<input type=number class="qna_answer_secret" name="funding_qna_secret" value="" style="display:none;" />
                    	<input type=number class="funding_qna_writer_idx" name="funding_qna_writer_idx" value="" style="display:none;" />
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="answer_member_idx" name="answer_member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_content" cols="60" rows="7"
                            placeholder="작성한 답변을 수정할 수 있습니다."></textarea>
                        
                        <!-- <input type="checkbox" id="cb3" class="cb">
                        <label for="cb3"></label>
                        <p class="cbp">비공개</p> -->
                    </div>
                    <div class="modal-footer write_modal_footer">
                    	<button type="button" id="qnaAnswerModifyBtn" class="btn btn-outline-info">수정</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    
    
     <!-- 관리자 - 커뮤니티 삭제 모달 -->
    <div class="modal fade" id="commuAdminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="commuAdminForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                    
                        <h4 class="bold">-관리자-<br><br>정말 삭제 하시겠습니까?</h4>
                        
                        <input type=text id="adminDel2" name="member_idx" value="" style="display:none;"/>
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                    </div>
                    <div class="modal-footer write_modal_footer">
                    	<button type="button" id="commuAdminBtn" class="qnaDeleteBtn qnaBtn btn btn-outline-danger">예</button>
                        <button type="button" id="commuAdminNo" class="qnaBtn btn btn-outline-success">아니오</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <!-- 관리자 - Q&A 삭제 모달 -->
    <div class="modal fade" id="qnaAdminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="qnaAdminForm" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                    
                        <h4 class="bold">-관리자-<br><br>정말 삭제 하시겠습니까?</h4>
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    </div>
                    <div class="modal-footer write_modal_footer">
                        <button type="button" id="qnaAdminBtn" class="qnaDeleteBtn qnaBtn btn btn-outline-danger">예</button>
                        <button type="button" id="qnaAdminNo" class="qnaBtn btn btn-outline-success">아니오</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    

    <c:import url="/footer.do"></c:import>
    
<script src="../resources/js/view.js"></script>
</body>
</html>