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
  
    <!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
    
    
 
</head>
<body>
	<c:import url="/header.do"></c:import>
	<main>
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <c:set var="seller" value="${read.member_idx }"/> <!-- 판매자 -->
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
            <h3 class="card-title">${read.funding_title }</h3>
        </div>
    </div>
    <!-- -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
                <img src="../resources/image/funding_main/${read.funding_thumbnail }" class="mainIMG" alt="...">
            </div>
            <div class="col-md-4 col-sm-12 topContent">
            
            	<!-- 남은 날짜 계산 -->
                <c:set var="now" value="<%=new java.util.Date()%>"/>
                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
                <fmt:parseDate var="end" value="${read.funding_end_date }" pattern="yyyy-MM-dd"/>
                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
                <!-- 남은 날짜 계산 끝 -->
            
                <h3>${endDate - nowDate}일 남음</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${read.funding_current_price/read.funding_target_price*100}%" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h3>${Math.round(read.funding_current_price/read.funding_target_price*100)}<span class="smalltext"> %달성</span></h3>
                <h3><fmt:formatNumber value="${read.funding_current_price}" type="number" /><span class="smalltext"> 원 펀딩</span></h3>
                <h3>500<span class="smalltext"> 명의 서포터</span></h3>
                
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
                </c:if>
                <c:if test="${login ne null}">
	                <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/option.do'" class="btn btn-info FVbtn">펀딩하기</button>
	                <button type="button" class="FVbtn2">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
	                        viewBox="0 0 16 16">
	                        <path
	                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                    </svg>
	                    찜하기
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
                    aria-selected="true">프로젝트</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVnotice" role="tab" aria-controls="FVnotice"
                    aria-selected="false">공지</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVcommu" role="tab" aria-controls="FVcommu"
                    aria-selected="false">커뮤니티</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVQnA" role="tab" aria-controls="FVQnA"
                    aria-selected="false">Q&A</a>
            </li>
        </ul>
        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
        <div class="tab-content" id="myTabContent">
            <!--프로젝트-->
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
                PDF 파일 올라올 예정
            </div>
            <!--공지-->
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
                PDF 파일 올라올 예정
            </div>
            <!--커뮤니티-->
            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h4>응원 · 의견 · 체험리뷰</h4>
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
                    	<c:forEach items="${fundingCommunityCommentList }" var="commentList">
                    	
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
			                        	<c:when test="${commentList.memberVO.member_photo eq 'KakaoTalk_20220418_121005755.png'}">
			                        		<div class="profile_div">
			                        			<img src="../resources/image/KakaoTalk_20220418_121005755.png" alt="profile_img" class="profile_img">
			                        		</div>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<div class="profile_div">
												<img src="../resources/image/funding_main/${commentList.memberVO.member_photo }" alt="profile_img" class="profile_img">
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
            </div>
            
            <!--Q&A-->
            <div class="tab-pane fade" id="FVQnA" role="tabpanel" aria-labelledby="FVQnA-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h3 style="padding-top: 10px;">Q&A</h3>
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
                    	<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
                    	
                    		<!-- 댓글 작성 여부를 위해 사용 -->    	
                    		<input type="text" class="qnaIdx" value="${qnaList.funding_qna_idx}" style="display:none;"/>
                    		
                   		<!-- 펀딩 상태 -->
                    		<tr>
                    			<c:set var="qnaState" value="${qnaList.funding_qna_state }"></c:set>
                    			<c:set var="qnaSecret" value="${qnaList.funding_qna_secret }"></c:set>
                    			<c:if test="${qnaState eq 0}">
                    				<c:if test="${qnaList.depth eq 0}">
                    					<td style="width: 15%;">답변 대기</td>
                    				</c:if>
                    				<c:if test="${qnaList.depth eq 1}">
                    					<td style="width: 15%;">&nbsp;&nbsp;&nbsp;ㄴ<span class="reply">답변</span></td>
                    				</c:if>
                    				
                    			</c:if>
	                            <c:if test="${qnaState eq 1}">
                    				<td style="width: 15%;">답변 완료</td>
                    			</c:if>
                    			
                   			<!-- 펀딩 제목 -->		
                    			<!-- 비밀글 아니면 -->
                    			<c:if test="${qnaSecret eq 0}">
                    				<td style="width: 45%;">
                    					<!-- 작성자 본인이면 수정 아니면 뷰 -->
                    					<div style="max-width: 200px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
                    						<c:choose>
	                    						<c:when test="${qnaList.member_idx eq loginPerson}">
	                    							<a class="doModify" data-toggle = "modal" href="#qnaModifyModal" data-id="${qnaList.parent_id }" data-id2="${qnaList.funding_qna_idx }" data-id3 ="${loginPerson}"><span class="qnaContent">${qnaList.funding_qna_content }</span></a>
	                    						</c:when>
	                    						<c:otherwise>
	                    							<a href="#qnaViewModal" class="qnaViewModal2" data-toggle="modal" data-id="${qnaList.funding_qna_content }"><span class="qnaContent">${qnaList.funding_qna_content }</span></a>
	                    						</c:otherwise>
                    						</c:choose>
                    					</div>
                    				</td>
                    			</c:if>
                    			<!-- 비밀글이면 -->
	                            <c:if test="${qnaSecret eq 1}">
	                            	<td style="width: 45%;">
	                            		<div style="max-width: 300px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
		                            		<c:choose>
	                    						<c:when test="${qnaList.member_idx eq loginPerson || seller eq loginPerson || qnaList.funding_qna_writer_idx eq loginPerson}">
	                    							<c:choose>
		                    							<c:when test="${qnaList.member_idx eq loginPerson}">
		                    								<a class="doModify" data-toggle="modal" href="#qnaModifyModal" data-id="${qnaList.parent_id }" data-id2="${qnaList.funding_qna_idx }" data-id3 ="${loginPerson}">
		                    									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
								                                    viewBox="0 0 16 16">
								                                    <path
								                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
								                                </svg>
		                    									<span class="qnaContent">${qnaList.funding_qna_content }</span>
		                    								</a>
			                    						</c:when>
			                    						<c:otherwise>
			                    							<a href="#qnaViewModal" class="qnaViewModal2" data-toggle="modal" data-id="${qnaList.funding_qna_content }">
			                    								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
								                                    viewBox="0 0 16 16">
								                                    <path
								                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
								                                </svg>
			                    								<span class="qnaContent">${qnaList.funding_qna_content }</span>
			                    							</a>
			                    						</c:otherwise>
		                    						</c:choose>
	                    						</c:when>
	                    						<c:otherwise>
	                    							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
					                                    viewBox="0 0 16 16">
					                                    <path
					                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
					                                </svg>
			                    					비밀글입니다.
			                    					<%-- <span class="qnaContent" style="display:none;">${qnaList.funding_qna_content }</span>  --%>
	                    						</c:otherwise>
	                    					</c:choose>
                    					</div>
                    				</td>
                    			</c:if>
                   			<!-- 작성자 -->
                   				<c:if test="${qnaList.depth eq 0}">
                   					<td style="width: 20%;">${qnaList.memberVO.member_name}</td>
                   				</c:if>
	                            <c:if test="${qnaList.depth eq 1}">
                   					<td style="width: 20%;">${qnaList.memberVO.member_business_name}</td>
                   				</c:if>
	                            
                           	<!-- 등록일 -->
	                            <fmt:parseDate var="qnaRegDate" value="${qnaList.funding_qna_regdate }" pattern="yyyy-MM-dd"/>
	                            <fmt:formatDate var="qnaRegDate2" value="${qnaRegDate }" pattern="yyyy-MM-dd"/>
	                            
	                            <c:choose>
               						<c:when test="${qnaState eq 0 && seller eq loginPerson && qnaList.depth eq 0}">
               							<td style="width: 20%;">
               								${qnaRegDate2}
               								&nbsp;
               								<button class="doAnswer btn btn-outline-info" data-toggle="modal" data-target="#qnaAnswerModal" data-id="${qnaList.funding_qna_idx }" data-id2="${qnaList.member_idx }">답변</button>
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
	        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/member/login.do'" class="login_modalBtn btn btn-info btn-lg">로그인</button>
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
                        <h4>글 남기기</h4>
                        <p>응원∙의견∙체험리뷰를 남겨주세요.
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
                        <h4>수정하기</h4>
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
                        
                        <h4>펀딩 Q&A 작성하기</h4>
                        
                        
                    	<input type=number id="funding_qna_secret" name="funding_qna_secret" value="" style="display:none;" />
                        <input type=text id="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text id="member_idx" name="member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_content" id="funding_qna_content" cols="60" rows="7"
                            placeholder="펀딩에 대한 궁금증을 남겨주세요"></textarea>
                        
                        <input type="checkbox" id="cb1" class="cb">
                        <label for="cb1"></label>
                        <p class="cbp">비공개</p>
                        
                        <button type="button" id="qnaSubmitBtn" class="qnaBtn btn btn-outline-info">등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <!-- Q&A 뷰 모달 -->
    <div class="modal fade" id="qnaViewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    </div>
    
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
                    
                        <h4>답변하기</h4>
                        
                        <input type=number class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    	<input type=number class="qna_answer_secret" name="qna_answer_secret" value="" style="display:none;" />
                    	<input type=number class="funding_qna_writer_idx" name="funding_qna_writer_idx" value="" style="display:none;" />
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="answer_member_idx" name="answer_member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_answer_content" id="funding_qna_answer_content" cols="60" rows="7"
                            placeholder="답변을 작성해주세요"></textarea>
                        
                        <input type="checkbox" id="cb2" class="cb">
                        <label for="cb2"></label>
                        <p class="cbp">비공개</p>
                        
                        <button type="button" id="qnaAnswerBtn" class="qnaBtn btn btn-outline-info">답변</button>
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
                    
                        <h4>수정창</h4>
                        
                        <input type=number class="parent_id" name="parent_id" value="" style="display:none;" />
                    	<input type=number class="funding_qna_idx" name="funding_qna_idx" value="" style="display:none;" />
                    	<input type=number class="qna_answer_secret" name="funding_qna_secret" value="" style="display:none;" />
                    	<input type=number class="funding_qna_writer_idx" name="funding_qna_writer_idx" value="" style="display:none;" />
                        <input type=text class="funding_idx" name="funding_idx" value="${read.funding_idx}" style="display:none;" />
                        <input type=text class="answer_member_idx" name="answer_member_idx" value="${member.member_idx}" style="display:none;" />
                        <textarea name="funding_qna_content" id="funding_qna_modify" cols="60" rows="7"
                            placeholder="펀딩에 대한 궁금증을 남겨주세요"></textarea>
                        
                        <input type="checkbox" id="cb3" class="cb">
                        <label for="cb3"></label>
                        <p class="cbp">비공개</p>
                        
                        
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
    

    <c:import url="/footer.do"></c:import>
    
<script src="../resources/js/view.js"></script>
</body>
</html>