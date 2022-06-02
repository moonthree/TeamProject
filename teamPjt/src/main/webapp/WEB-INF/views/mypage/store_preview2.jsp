<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫딩 스토어 뷰페이지</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_view.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	<!-- 스토어 등록 미리보기 페이지 -->
	<main>
	    <!-- 상단 썸네일 -->
	    <div class="card bg-dark text-white topcard">
	        <img src="../resources/upload/store/${store.store_thumbnail}" class="card-img FVtitleImg" alt="...">
	        <div class="card-img-overlay">
	            <br>
	            <h5 class="card-category">
					<c:if test="${store.store_category == '0'}">
            			강아지
	            	</c:if>
	            	<c:if test="${store.store_category == '1'}">
	            		고양이
	            	</c:if>
	            	<c:if test="${store.store_category == '2'}">
	            		기타 동물
	            	</c:if>
            		용품</h5>
	            <br>
	            <h3 class="card-title">${ store.store_title }</h3>
	        </div>
	    </div>
	    <!-- -->
	    <div class="container">
	        <div class="row">
	            <div class="col-md-7 col-sm-12">
	                <img src="../resources/upload/store/${store.store_thumbnail}" class="mainIMG" alt="...">
	            </div>
	            <div class="col-md-5 col-sm-12 topContent">
	                <div class="viewBusinessName">${login.member_business_name }</div>
	                <div class="viewTitle">${stroe.store_title}</div>
	                <!--별점-->
	                <div class="viewStar">
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
	                                        fill="white" fill-rule="evenodd" />
	                                </svg>
	                                <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
	                                    viewBox="0 0 24 27">
	                                    <path
	                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                        fill="white" fill-rule="evenodd" />
	                                </svg>
	                                <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
	                                    viewBox="0 0 24 27">
	                                    <path
	                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                        fill="white" fill-rule="evenodd" />
	                                </svg>
	                                <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
	                                    viewBox="0 0 24 27">
	                                    <path
	                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                        fill="white" fill-rule="evenodd" />
	                                </svg>
	                            </symbol>
	                        </defs>
	                    </svg>
	                    <div class="rating">
	                        <progress class="rating-bg" value="4.5" max="5"></progress>
	                        <svg>
	                            <use xlink:href="#fivestars" />
	                        </svg>
	                    </div>
	                    <div class="starNum">
	                        <span class="starAverage">4.5</span>
	                        <span class="middleBar">|</span>
	                        <span class="starTotal">ooo개 상품평</span>
	                    </div>
	                </div>
	                <!--별점 끝-->
					<c:if test="${optionList ne null}">
					
	                <div class="viewPrice">${optionList[0].store_option_name}</div>
	                <div class="viewExpress">
	                    택배배송
	                    <span class="middleBar">&nbsp;|&nbsp;</span>
	                    <span class="viewExpressPrice">${optionList[0].store_option_price}</span>원
	                    <br>
	                    <span class="viewDate">00/00 <span class="viewDateText">도착 예정</span></span>
	                </div>
	                </c:if>
	                <!-- 셀렉트 시작 -->
	                <!-- 셀렉트 시작 -->
	                <!-- 셀렉트 시작 -->
	                
	                 <c:set var="One" value="${optionList[0].store_option_price}"></c:set>
	                
	                
	              <div class="viewOptionSelect">
	                  <select id="storeOptionSelect">
		                <option  value="default" selected="selected">상품명</option>
	                <c:forEach var="option" items="${optionList}" varStatus="status">
		                        <option>${option.store_option_name}
		                        	<c:choose>
		                        		<c:when test="${option.store_option_price > One}">
		                        			 <span>+${option.store_option_price - One}원</span>
		                        		</c:when>
		                        		<c:when test="${option.store_option_price < One}">
		                        			<span style="background:yellow;">-${One - option.store_option_price}원</span>	
		                        		</c:when>
		                        	</c:choose>
		                        </option> 
					</c:forEach>
					</select>
					

	                 <div class="viewOptionBox">
	                  <c:forEach var="option" items="${optionList}" varStatus="status">
	                        <div class="storeOptionBox box${status.index}">
	                            <div class="storeOptionBox1">
	                                <span class="storeOptionText">${option.store_option_detail}</span>
	                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                <span style="display:right; color: gray;">${option.store_option_stock}개</span>
	                            </div>
	                            <div class="">
	                                <input type="number"/>
	                                <span class="storeOptionBoxPrice"><span class="bold">${option.store_option_price}</span>원</span>
	                            </div>
	                        </div>
	                      </c:forEach>
	                 </div>
					
					
	                    <div class="viewTotalPriceDiv row">
	                        <div class="col-lg-4 viewTotalPriceText">
	                            총 상품 금액
	                        </div>
	                        <div class="col-lg-8 viewTotalPriceText2">
	                            <span class="viewTotalNum">
	                                총 수량이 표시됩니다.
	                                <span class="middleBar">&nbsp;|&nbsp;</span>
	                            </span>
	                            <span class="viewTotalPrice">총 금액이 표시됩니다.</span>
	                        </div>
	                    </div>
	                </div>
	                <!-- 셀렉트 끝 -->
	                <!-- 셀렉트 끝 -->
	                <!-- 셀렉트 끝 -->
	                <div class="viewBtn">
	                    <button type="button" class="viewPurchaseBtn">구매하기</button>
	                    <button type="button" class="viewZzimBtn">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="22" fill="currentColor" class="bi bi-heart"
	                            viewBox="0 0 16 22">
	                            <path
	                                d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                        </svg>
	                        찜하기
	                    </button>
	                    <button type="button" class="viewZzimBtn">
		                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="22" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 22">
							  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
							  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
							</svg>
		                    판매자 문의
		                </button>
	                </div>
	            </div>
	        </div>
			<!-- 상단 끝 -->
			<!-- 상단 끝 -->
			<!-- 상단 끝 -->
			<!-- 상단 끝 -->
			<!-- 상단 끝 -->
	
	
	        <!-- 프로젝트/스토어/커뮤니티/Q&A탭 -->
	        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
	            <li class="nav-item nav-pills viewtab" role="presentation">
	                <a class="nav-link active storeViewTab" data-toggle="tab" href="#FVproject" role="tab" aria-controls="FVproject"
	                    aria-selected="true"><span>프로젝트</span></a>
	            </li>
	            <li class="nav-item nav-pills viewtab" role="presentation">
	                <a class="nav-link storeViewTab" data-toggle="tab" href="#FVnotice" role="tab" aria-controls="FVnotice"
	                    aria-selected="false"><span>공지</span></a>
	            </li>
	            <li class="nav-item nav-pills viewtab" role="presentation">
	                <a class="nav-link storeViewTab" data-toggle="tab" href="#FVcommu" role="tab" aria-controls="FVcommu"
	                    aria-selected="false"><span>상품평</span></a>
	            </li>
	            <li class="nav-item nav-pills viewtab" role="presentation">
	                <a class="nav-link storeViewTab" data-toggle="tab" href="#FVQnA" role="tab" aria-controls="FVQnA"
	                    aria-selected="false"><span>Q&A</span></a>
	            </li>
	        </ul>
	        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
	        <div class="tab-content" id="myTabContent">
	            <!--프로젝트-->
	            <c:choose>
            	<c:when test="${flag eq 0 }">
		            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
		                <%-- <iframe class="iframe" src="../resources/upload/store/${file_name}#toolbar=0" style="width:100%; height:150vh;"></iframe> --%>
		           		 <img src="../resources/upload/store/${file_name}" style="width:100%;" alt="...">
		            </div>
		            <!--공지-->
		            <div class="tab-pane fade" id="FVnotice" role="tabpanel"  aria-labelledby="FVnotice-tab">
		            	<h4>판매자 공지</h4>
		              	<img src="../resources/upload/store/${store.store_notice}"  class="mainIMG" style="width:100%;" alt="...">
		              	<h4>교환 및 환불 안내</h4>
		                <div class="notice">교환 및 환불 문의는 '판매자 문의'로 신청해 주세요.</div>
		                <h4>반품 보내실 주소</h4>
		                <div class="notice">회원가입시 입력한 주소(회원 정보 수정 페이지에서 수정 가능)</div>
		                <h4>교환/환불 정책</h4>
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
	            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
	                <%-- <iframe class="iframe" src="../resources/upload/store/${store.store_content}#toolbar=0" style="width:100%; height:150vh;"></iframe> --%>
	           			<img src="../resources/upload/store/${store.store_content}" style="width:100%;" alt="...">
	            </div>
	            <!--공지-->
	            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
	            	 <h4>판매자 공지</h4>
	              	 <img src="../resources/upload/store/${file_name}" style="width:100%;"  class="mainIMG" alt="...">
	              	 <h4>교환 및 환불 안내</h4>
	                <div class="notice">교환 및 환불 문의는 '판매자 문의'로 신청해 주세요.</div>
	                <h4>반품 보내실 주소</h4>
	                <div class="notice">회원가입시 입력한 주소(회원 정보 수정 페이지에서 수정 가능)</div>
	                <h4>교환/환불 정책</h4>
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
	            
	            </c:otherwise>
	            </c:choose>
	            
	            <!--리뷰 시작-->
	            <!--리뷰 시작-->
	            <!--리뷰 시작-->
	            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
	                <div class="reviewTop">
	                    상품리뷰
	                    <button class="btn btn-outline-info btn-lg writeReview">리뷰 작성</button>
	                    <br><span>상품을 구매하신 분들이 작성하신 리뷰입니다.</span>
	                </div>
	                <div class="reviewMiddle row">
	                    <div class="col-md-4">
	                        <p>사용자 총 평점</p>
	                        <!--별점-->
	                        <div class="viewStar2">
	                            <svg style="display:none;">
	                                <defs>
	                                    <symbol id="fivestars2">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 40 40">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="40" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 40 40">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="132" height="40" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 40 40">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="178" height="40" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 40 40">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="224" height="40" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 40 40">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                    </symbol>
	                                </defs>
	                            </svg>
	                            <div class="rating2">
	                                <progress class="rating2-bg" value="4.5" max="5"></progress>
	                                <svg>
	                                    <use xlink:href="#fivestars2" />
	                                </svg>
	                            </div>
	                        </div>
	                        <div class="starNum2">4.5&nbsp;<span>/5</span></div>
	                        <!--별점 끝-->
	                    </div>
	                    <div class="col-md-4">
	                        <p>전체 리뷰수</p>
	                        <div>
	                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-square-dots"
	                                viewBox="0 0 16 16">
	                                <path
	                                    d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
	                                <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
	                            </svg>
	                        </div>
	                        <div class="reviewNum">300</div>
	                    </div>
	                    <div class="col-md-4">
	                        <p class="progressPerP">평점 비율</p>
	                        <div id="progress">
	                            <div class="progress progress-bar-vertical">
	                                <span>5</span>
	                                <div class="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
	                                    style="height: 70%;">
	                                </div>
	                            </div>
	                            <div class="progress progress-bar-vertical">
	                                <span>4</span>
	                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
	                                    style="height: 10%;">
	                                </div>
	                            </div>
	                            <div class="progress progress-bar-vertical">
	                                <span>3</span>
	                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
	                                    style="height: 5%;">
	                                </div>
	                            </div>
	                            <div class="progress progress-bar-vertical">
	                                <span>2</span>
	                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
	                                    style="height: 5%;">
	                                </div>
	                            </div>
	                            <div class="progress progress-bar-vertical">
	                                <span>1</span>
	                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
	                                    style="height: 10%;">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="progressPer">
	                            <span>70%</span>
	                            <span>10%</span>
	                            <span>5%</span>
	                            <span>5%</span>
	                            <span>10%</span>
	                        </div>
	                    </div>
	                </div>
	            <div class="reviewMiddlePhoto">
	                <p>포토 & 동영상 100건</p>
	               
	            </div>
	            <div class="reviewBottom">
	                <div class="reviewBottomTop">
	                    <div>리뷰 예시 입니다.</div>
	                    <select name="reviewSort">
	                        <option value="">추천순</option>
	                        <option value="">최신순</option>
	                        <option value="">평점 높은순</option>
	                        <option value="">평점 낮은순</option>
	                    </select>
	                </div>
	                
	                <table class="table storetable">
	                    <thead>
	                        <tr>
	                            <td style="width:10%" class="tdImg">
	                                <img src="../resources/image/KakaoTalk_20220418_121005755.png" alt="">
	                            </td>
	                            <td style="width:90%" scope="row">
	                                <!--별점-->
	                                <div class="viewStar">
	                                    <svg style="display:none;">
	                                        <defs>
	                                            <symbol id="fivestars3">
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
	                                                        fill="white" fill-rule="evenodd" />
	                                                </svg>
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
	                                                    viewBox="0 0 24 27">
	                                                    <path
	                                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                        fill="white" fill-rule="evenodd" />
	                                                </svg>
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
	                                                    viewBox="0 0 24 27">
	                                                    <path
	                                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                        fill="white" fill-rule="evenodd" />
	                                                </svg>
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
	                                                    viewBox="0 0 24 27">
	                                                    <path
	                                                        d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                        fill="white" fill-rule="evenodd" />
	                                                </svg>
	                                            </symbol>
	                                        </defs>
	                                    </svg>
	                                    <div class="rating">
	                                        <progress class="rating-bg" value="4.2" max="5"></progress>
	                                        <svg>
	                                            <use xlink:href="#fivestars3" />
	                                        </svg>
	                                    </div>
	                                </div>
	                                <!--별점 끝-->
	                                <span class="reviewName">이름</span>
	                                <span class="middleBar">|</span>
	                                <span class="reviewReg">2022.05.16</span>
	                                <button class="reviewLike">
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="30" fill="red" class="bi bi-hand-thumbs-up"
	                                        viewBox="0 0 16 20">
	                                        <path
	                                            d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
	                                    </svg>
	                                    0
	                                </button>
	                                <br>
	                                <span class="reviewOption">리뷰 테스트 입니다.</span>
	                            <td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td colspan="2">
	                                
	                                <br>
	                               	리뷰 테스트 내용 입니다.
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            </div>
	            <!--리뷰 끝-->
	            <!--리뷰 끝-->
	            <!--리뷰 끝-->
	            <!--Q&A-->
	            <div class="tab-pane fade" id="FVQnA" role="tabpanel" aria-labelledby="FVQnA-tab">
	                	Q&A테스트 내용이 출력됩니다.
	            </div>
	        </div>
	         <br>
	         <br>
		<input type="button" onclick="Fnclose()" class="btn btn-primary btn-lg btn-block" value="확인"/> 
	    </div>
	</main>
	<c:import url="/footer.do"></c:import>
<!-- <script src="../resources/js/store/store_view_load.js"></script> -->
</body>
<script type="text/javascript">
function Fnclose(){
	  self.close();}
 </script>
</html>