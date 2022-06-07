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
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    
    <!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
 <!-- //git 넘기기용 -->
</head>
<body>
	
	<c:import url="/header.do"></c:import>
	<main>
	<!-- 썸네일 -->
	
    <div class="card bg-dark text-white topcard">
        <img src="../resources/image/funding_main/doghome.png" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">
            	<c:if test="${funding.funding_category == '0'}">
            		강아지
            	</c:if>
            	<c:if test="${funding.funding_category == '1'}">
            		고양이
            	</c:if>
            	<c:if test="${funding.funding_category == '2'}">
            		기타 동물
            	</c:if>
            		용품</h5>
            <br>
            <h3 class="card-title">${funding.funding_title}</h3>
        </div>
    </div>
    <!-- -->
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
               <!--  <img src="../resources/image/funding_main/doghome.png" class="mainIMG" alt="..."> -->
                  <img src="../resources/upload/funding/${funding.funding_thumbnail}" class="mainIMG" alt="...">
            </div>
            <div class="col-md-4 col-sm-12 topContent">
                <h3>${difftime}일 남음</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%" aria-valuenow="0"
                        aria-valuemin="0" aria-valuemax="100"></div>
                        
                </div>
                <h3>0<span class="smalltext"> %달성</span></h3>
                <h3>0<span class="smalltext"> 원 펀딩</span></h3>
                <h3>500<span class="smalltext"> 명의 서포터</span></h3>
                <button type="button" class="btn btn-info FVbtn">펀딩하기</button>
                <button type="button" class="FVbtn2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="22" fill="currentColor" class="bi bi-heart"
                        viewBox="0 0 16 22">
                        <path
                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                    </svg>
                    찜하기
                </button>
                <button type="button" class="FVbtn2">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="22" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 22">
					  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
					</svg>
                    판매자 문의
                </button>
                <fmt:formatNumber var="price"  value="${funding.funding_target_price }" pattern="#,###" />


                <div class="fundingGoal">
                
                    목표금액 : ${funding.funding_target_price}원<br>
                    펀딩기간 : ${funding.funding_start_date}&nbsp;~&nbsp;${funding.funding_end_date}<br>
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
                    aria-selected="false">QnA</a>
            </li>
        </ul>
        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
        <div class="tab-content" id="myTabContent">
            <!--프로젝트-->
            <c:choose>
            	<c:when test="${flag eq 0 }">
            
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">	
            	 <%-- <iframe class="iframe" src="../resources/upload/funding/${file_name}#toolbar=0" style="width:100%; height:150vh;"></iframe>  --%>
            	  <img src="../resources/upload/funding/${file_name}" style="width:100%;" alt="...">
            </div>
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" class="mainIMG"  aria-labelledby="FVnotice-tab">
            	<h4>판매자 공지</h4>
               <img src="../resources/upload/funding/${funding.funding_notice}" style="width:100%;" alt="...">
               <h4>펀딩 취소 및 리워드 옵션 변경, 배송지 변경 안내</h4>
                <div class="notice">
                	펀딩 결제는 예약 상태로 유지되다가, 펀딩이 성공할 시 펀딩 마감일(<span class="bold">${read.funding_end_date }</span>) 다음 영업일에 모두 함께 진행되며, 펀딩 실패시 결제는 진행되지 않습니다.
                	결제 정보 변경은 결제가 진행되기 전까지 언제나 가능합니다. 참여한 펀딩 정보 변경은 <span class="bold">펀딩내역</span>의 <span class="bold">펀딩 상세 내역</span>에서 진행해주세요.
                	마감일 이후에는 펀딩에 대한 리워드 제작 및 배송이 시작되어, 취소와 더불어 배송지 및 리워드 옵션 변경은 펀딩 마감일(<span class="bold">${read.funding_end_date }</span>) 이후로는 불가합니다.
                	그 외 여타 문의는 '판매자 문의'로 신청해 주세요.
                </div>
                <h4>교환 및 환불 안내</h4>
                <div class="notice">
					<ul class="hyphen">
						<li>소비자 단순 변심에 의한 교환/반품은 상품 수령 후 7일 이내에 신청할 수 있습니다.(반품 배송비 소비자 부담)</li>
						<li>상품의 내용이 표시∙광고 내용과 다르거나 계약내용과 다르게 이행된 경우에는 해당 상품 등을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 교환/반품을 신청할 수 있습니다.(반품 배송비 판매자 부담)</li>
						<li>다음의 경우에는 교환/반품을 신청할 수 없습니다.
							<ul  class="hyphen">
								<li>소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(다만, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외함)</li>
								<li>소비자의 사용 또는 일부 소비로 인하여 상품 등의 가치가 현저히 감소한 경우</li>
								<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
								<li>복제 가능한 상품 등의 포장을 훼손한 경우</li>
								<li>용역 또는 “문화산업진흥 기본법” 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우(다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 제외함)</li>
								<li>주문에 따라 개별적으로 생산되는 상품 등 그에 대하여 청약철회 등을 인정할 경우 판매자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서, 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 소비자의 서면(전자문서를 포함)에 의한 동의를 받은 경우</li>
								<li>그 밖에 관련 법령에 따른 반품 제한 사유에 해당되는 경우</li>
							</ul>
						</li>
					</ul>
                </div>
            </div>
            </c:when>
            <c:otherwise>
            <!--공지-->
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">	
            	 <%-- <iframe class="iframe" src="../resources/upload/funding/${funding.funding_content}#toolbar=0" style="width:100%; height:150vh;"></iframe>  --%>
            	 <img src="../resources/upload/funding/${funding.funding_content}"  alt="...">
            </div>
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
               <img src="../resources/upload/funding/${file_name}" class="img2" alt="...">
            </div>
            </c:otherwise>
            </c:choose>
            <!--커뮤니티-->
            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h4>응원 · 의견 · 체험리뷰</h4>
                        <span style="opacity: 0.7;">펀딩 종료전에 남긴 글입니다.</span>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                        <button type="button" class="btn btn-outline-info btn-lg commubtn">글 남기기</button>
                    </div>
                </div>

                <table class="table commutable">
                    <tbody>
                        <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>    
                            <th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>
                            </th>
                        </tr>
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
                        <button type="button" class="btn btn-outline-info btn-lg commubtn">상품 Q&A 작성하기</button>
                    </div>
                </div>

                <table class="table QnAtable">
                    <thead>
                        <tr>
                            <th scope="col">답변상태</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 15%;">답변대기</td>
                            <td style="width: 55%;">비밀글입니다.
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
                                    viewBox="0 0 16 16">
                                    <path
                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
                                </svg>
                            </td>
                            <td style="width: 15%;">abcd*******</td>
                            <td style="width: 15%;">2022.04.25</td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">답변완료</td>
                            <td style="width: 55%;">배송 언제 시작하나요?</td>
                            <td style="width: 15%;">ewrwe****</td>
                            <td style="width: 15%;">2022.04.24</td>
                        </tr>
                    </tbody>
                </table>
             </div>
        </div>
     
     <br>
     <input type="button" onclick="Fnclose()" class="btn btn-primary btn-lg btn-block" value="확인"/>   
    </div>
    
    
    <!-- 여기는 펀딩 등록 페이지로 보내기 -->
   
    
    <script type="text/javascript">
   function Fnclose(){
	  self.close();
   }
    </script>
	</main>
    
    <c:import url="/footer.do"></c:import>
</body>
</html>