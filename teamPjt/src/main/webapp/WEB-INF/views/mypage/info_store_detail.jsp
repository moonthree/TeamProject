<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/info_store_detail.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_modal.css">
    <!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>스토어 상세 내역</title>
<script>
var message = ${msg};
if(message != null){alert(message);}
</script>
</head>
<body>
<!-- 
0010 = 상단
0020 = 배송상태
0030 = 배송지
0040 = 모달시작
0041 = 리뷰등록모달
0042 = 리뷰수정모달
 -->

<main id="wrapper">
<c:import url="/header.do"></c:import>

<div class="mypage_background"></div>
   <div class="container wrapper">
        <div class="row">
            <div class="col-3">
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
                        <a href="mypage.do">
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
            <fmt:formatDate var="order_date" value="${detail.store_order_date}" pattern="yyyy-MM-dd" />
            <div class="col-9 order_detail_place">
                <div class="order_detail_top">
                    <h5>주문 상세정보</h5>
                    <div class="order_detail_num">
                        <span>주문일자</span>
                        <span class="color">${order_date }</span>
                        <span class="middlebar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                        <span>주문번호</span>
                        <span class="color">${detail.store_order_idx }</span>
                    </div>
                    <div class="order_datail_product">
                        <table class="odp_table" style="width: 100%;">
                            <tr class="odp_tr1">
                                <td style="width: 10%; font-weight: bold;">상품주문번호</td>
                                <td style="width: 50%;">상품정보</td>
                                <td class="odp_td" style="width: 15%;">배송비/판매자</td>
                                <td class="odp_td odp_td_top" style="width: 25%;" colspan="2">진행상태</td>
                            </tr>
                            <tr class="odp_tr2">
                                <td>1</td>
                                <td>
                                    <div class="row">
                                        <div class="col-3">
                                            <a href="../store/store_view.do?store_idx=${detail.store_idx }&store_funding=${detail.store_funding}" class="odp_table_a">
                                           
                                                <img src="../resources/upload/store/${detail.store_thumbnail}">
                                            </a>
                                        </div>
                                        <div class="col-9 odp_title" style="text-align: left;">
                                            <c:forEach var="item" items="${ option }">
                                            	<span>${ item.store_option_name }</span>
                                            	<span>|</span>
                                            	<span><fmt:formatNumber value="${ item.store_option_price }" type="number" />원 (${ item.store_order_option_select_count }개)</span>
                                            	
                                            	<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </td>
                                <td class="odp_td">
                                    <span><fmt:formatNumber value="${detail.store_express_fee }" type="number" />원</span><br>
                                    <span class="odp_sub">${detail.member_name }</span><br>
                                    <span class="odp_sub">(${detail.member_phone })</span>
                                    <button type="button" class="" onclick="window.open('note.do?seller=${detail.member_idx}&consumer=${member.member_idx}&store_idx=${detail.store_idx }','PopupWin', 'width=500,height=700');" >판매자 문의</button>
                                </td>
<!-- 0020 배송상태 -->
                                <td class="odp_td" style="width: 10%">
                                	<c:choose>
                                		<c:when test="${ detail.store_order_pay_state eq 0 }">
                                			<c:if test="${ express.store_express_state eq 0 }">
												배송준비중
						       				</c:if>
						       				<c:if test="${ express.store_express_state eq 1 }">
												배송완료
							        		</c:if>
                                		</c:when>
                                		<c:when test="${ detail.store_order_pay_state eq 1 }">
											주문취소
						        		</c:when>
                                	</c:choose>
                                </td>
                                <td class="odp_td odp_td_bot">
                                	<c:choose>
                                		<c:when test="${ detail.store_order_pay_state eq 0 }">
		                                	<c:if test="${ express.store_express_state eq 0 }">
												<button type="button" class="btn" onclick="storeWithdrawal()">주문 취소</button>
						       				</c:if>
						       				<c:if test="${ express.store_express_state eq 1 }">
						       					<c:if test="${review eq null}">
						       						<button class="writeReview" data-toggle="modal" data-target="#reviewWriteModal">리뷰 작성</button>
						       					</c:if>
												<c:if test="${review ne null}">
													<button class="modifyReview" data-toggle="modal" data-target="#reviewModifyModal">리뷰 수정</button>
													<button class="deleteReview" data-toggle="modal" data-target="#reviewDeleteModal">리뷰 삭제</button>
												</c:if>
							        		</c:if>
							        	</c:when>
							        	<c:when test="${ detail.store_order_pay_state eq 1 }">
											취소완료
						        		</c:when>
							        </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="order_detail_middle">
                    <h5>주문/결제 금액 정보</h5>
                    <div class="odm_talbe_div">
                        <table class="odm_table" style="width: 100%;">
                            <tr>
                                <td class="odm_td" style="width: 33%;">
                                    <span class="bold">최초주문금액</span>
                                    <div class="odm_td_div">
                                        상품금액 <span><fmt:formatNumber value="${ detail.store_order_total_price - detail.store_express_fee}" type="number" />원</span>
                                        <br>
                                        배송비 <span>+<fmt:formatNumber value="${ detail.store_express_fee }" type="number" />원</span>
                                    </div>
                                </td>
                                <td class="odm_td" style="width: 33%;">
                                    <span class="bold">결제상세</span>
                                    <div class="odm_td_div">
                                        카드결제 <span>${pay.store_order_pay_card_name}</span>
                                        <br>
                                        카드번호 <span>${ pay.store_order_pay_card_number }</span>
                                    </div>
                                </td>
                                <td class="odm_td odm_td_last" style="width: 34%;">
                                    <span class="bold">최종결제</span>
                                    <div class="odm_td_div">
                                        주문금액 <span><fmt:formatNumber value="${ detail.store_order_total_price }" type="number" />원</span>
                                    </div>
                                    <div class="odm_td_div">
                                        카드결제 <span><fmt:formatNumber value="${ detail.store_order_total_price }" type="number" />원</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
<!-- 0030 배송지 -->
                <div class="order_detail_bottom">
                    <h5>배송지 정보</h5>
                    <div class="odb_table_div">
                        <table class="odb_table" style="width: 100%;">
                            <tr>
                                <td class="odb_td odb_td1 odb_td1_top" style="width:10%">수령인</td>
                                <td class="odb_td" odb_td_line2 style="width:60%">${ express.store_express_name }</td>
                            </tr>
                            <tr>
                                <td class="odb_td odb_td1">배송지</td>
                                <td class="odb_td odb_td_line">
                                    ${ express.store_express_postnum }<br>
                                    ${ express.store_express_addr1 }<br>
                                    ${ express.store_express_addr2 }
                                </td>
                            </tr>
                            <tr>
                                <td class="odb_td odb_td1 odb_td1_bot">연락처</td>
                                <td class="odb_td odb_td_line">
                                    ${ express.store_express_phone }
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
</main>
<c:import url="/footer.do"></c:import>
	<script>
    	function storeWithdrawal(){
    		$("#checkStWithdrawalModal").modal("toggle");
    		$("#orderIdx").val(${ express.store_order_idx});
    	}
    </script>
<!-- 0040 모달 -->
	<div class="modal fade" id="checkStWithdrawalModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content login_modal_content">
	      <div class="modal-header login_modal_header">
	        <button type="button" class="login_modal_close close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body login_modal_body">
	      	<div style="text-align:center;"><h4> 구매를 취소 요청하시겠습니까? </h4></div>
	      	<form action="storeWithdraw.do" method="post">
	      		<input type="hidden" name="amount" value="${pay.store_order_pay_amount}">
	      		<input type="hidden" name="imp_uid" value="${pay.store_order_pay_imp_uid}">
	      		<input type="hidden" name="store_order_idx" id="orderIdx" value="${ express.store_order_idx }"/>
	      		<c:forEach var="item" items="${ option }">
	                <input type="hidden" name="store_order_option_select_idx" value="${item.store_order_option_select_idx}">
	                <input type="hidden" name="store_order_option_select_count" value="${item.store_order_option_select_count}">
				</c:forEach>
	      		<div style="text-align:right; margin-top:50px">
		      		<button class="w-btn-outline w-btn-red-outline">확인</button>
		      		<button type="button"  class="w-btn-outline w-btn-black-outline"  data-dismiss="modal" aria-label="Close">취소</button>
	      		</div>
	      	</form>
	      </div>
	      	<div class="modal-footer login_modal_footer">
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 리뷰 등록 모달 0041 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 --><!-- 리뷰 등록 모달 -->
<div class="modal fade" id="reviewWriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">상품 리뷰<div>이 상품의 품질에 대해서 얼마나 만족하시나요?</div></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
               <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
                <div class="modal-body">
                      <table>
                          <tr class="rrtr1">
                              <td class="rrtd1">
                                  <img src="../resources/upload/store/${detail.store_thumbnail }" alt="" class="td1Img">
                              </td>
                              <td class="rrtd2">
                                  <div class="bold">${detail.store_title }</div>
                                  <div class="rr_option">
                                  		<input type="hidden" id="optionSize" value="${option.size() }">
										<c:forEach var="item" items="${option}" varStatus ="status">
	                                       	<span>${ item.store_option_name } </span>
	                                       	<input type="hidden" id="rwm_option${status.index}" value="${item.store_option_name} ">
                                       </c:forEach>
								  </div>
                                  <div id="myform">
                                      <fieldset>
                                          <input type="radio" name="store_review_star" value="5" id="rate1"><label for="rate1">⭐</label>
                                          <input type="radio" name="store_review_star" value="4" id="rate2"><label for="rate2">⭐</label>
                                          <input type="radio" name="store_review_star" value="3" id="rate3"><label for="rate3">⭐</label>
                                          <input type="radio" name="store_review_star" value="2" id="rate4"><label for="rate4">⭐</label>
                                          <input type="radio" name="store_review_star" value="1" id="rate5"><label for="rate5">⭐</label>
                                      </fieldset>
                                      
                                      <span class="myformSpan">(필수)</span>
                                      
                                      <input type="number" id="reviewWriteModal_store_idx" name="store_idx" value="${detail.store_idx }" style="display:none;">
                                      <input type="number" id="reviewWriteModal_member_idx" name="member_idx" value="${login.member_idx }" style="display:none;">
                                      <input type="hidden" id="rwm_store_order_idx" name="store_order_idx" value="${detail.store_order_idx }">
                                  </div>
                              </td>
                          </tr>
                      </table>
                      <div class="div2">
                          <div class="bold">상세리뷰</div>
                          <textarea name="store_review_content" id="" rows="7" placeholder="상품 품질에 대한 고객님의 솔직한 리뷰를 남겨주세요"></textarea>
                      </div>
                 
                      <div class="div2">
                          <span class="bold">사진첨부</span><span class="thin">&nbsp;*올라온 사진을 클릭하면 삭제할 수 있어요</span><br>
                          	<button id="btn-upload" type="button" class="btn btn-outline-primary photoBtn">
                          		사진 첨부하기
                          	</button>
                          	<input id="input_file" multiple="multiple" type="file" style="display:none;">
                          	<span id="input_file_num">0</span> / 5
                          	<div class="data_file_txt" id="data_file_txt">
							<span></span>
							<br/>
							<div id="articlefileChange">
							</div>
						</div>
                      </div>
                  
                  <br>
                  <h3>게시물 이용안내</h3>
                  <p class="storeWriteWarning">
                      최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는
                      점을
                      유의하여 주시기 바랍니다.
                  </p>
                  
                  <p class="storeWriteNotice">
                      1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다.
                      <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                      <br>3.3. 제품 관련 문의 및 기타 문의는 'Q&A탭'을 통해 정확한 답변을 받을 수 있습니다.
                      <br>4.4. 서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.
                      <br>5.5. 상품 품질에 대한 고객님의 솔직한 리뷰를 남겨주세요.
                  </p>
              </div>
              <div class="modal-footer">
                  <button type="submit" id="reviewWriteBtn" class="btn btn-outline-danger reviewWriteBtn">리뷰 등록</button>
              </div>
              </form>
          </div>
      </div>
  </div>
<!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 --><!-- 리뷰 등록 모달 끝 -->

<!-- 리뷰 수정 모달 0042 -->
<div class="modal fade" id="reviewModifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">리뷰 수정<div>리뷰를 수정합니다.</div></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
               <form name="dataForm2" id="dataForm2" onsubmit="return modifyAction()">
                <div class="modal-body">
                      <table>
                          <tr class="rrtr1">
                              <td class="rrtd1">
                                  <img src="../resources/upload/store/${detail.store_thumbnail }" alt="" class="td1Img">
                              </td>
                              <td class="rrtd2">
                                  <div class="bold">${detail.store_title }</div>
                                  <div class="rr_option">
                                  		<input type="hidden" id="optionSize" value="${option.size() }">
										<c:forEach var="item" items="${option}" varStatus ="status">
	                                       	<span>${ item.store_option_name } </span>
	                                       	<input type="hidden" id="rwm_option${status.index}" value="${item.store_option_name} ">
                                       </c:forEach>
								  </div>
                                  <div id="myform2">
                                      <fieldset>
                                          <input type="radio" name="store_review_star" value="5" id="rate11"><label for="rate11">⭐</label>
                                          <input type="radio" name="store_review_star" value="4" id="rate22"><label for="rate22">⭐</label>
                                          <input type="radio" name="store_review_star" value="3" id="rate33"><label for="rate33">⭐</label>
                                          <input type="radio" name="store_review_star" value="2" id="rate44"><label for="rate44">⭐</label>
                                          <input type="radio" name="store_review_star" value="1" id="rate55"><label for="rate55">⭐</label>
                                      </fieldset>
                                      <span class="myformSpan">(필수)</span>
                                      <input type="hidden" id="get_review_star" value="${review.store_review_star }">
                                      <input type="number" id="reviewModifyModal_store_idx" name="store_idx" value="${detail.store_idx }" style="display:none;">
                                      <input type="number" id="reviewModifyModal_member_idx" name="member_idx" value="${login.member_idx }" style="display:none;">
                                  </div>
                              </td>
                          </tr>
                      </table>
                      <div class="div2">
                          <div class="bold">상세리뷰</div>
                          <textarea name="store_review_content" id="" rows="7">${review.store_review_content }</textarea>
                      </div>
                 
                      <div class="div2">
                          <span class="bold">사진첨부</span><span class="thin">&nbsp;*올라온 사진을 클릭하면 삭제할 수 있어요</span><br>
                          	<button id="btn-upload-modify" type="button" class="btn btn-outline-primary photoBtn">
                          		사진 첨부하기
                          	</button>
                          	<input id="input_file_modify" multiple="multiple" type="file" style="display:none;">
                          	<span id="input_file_num_modify">0</span> / 5
                          	<div class="data_file_txt" id="data_file_txt">
							<span></span>
							<br/>
							<div id="articlefileChangeModify">
							</div>
						</div>
                      </div>
                  
                  <br>
                  <h3>게시물 이용안내</h3>
                  <p class="storeWriteWarning">
                      최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는
                      점을
                      유의하여 주시기 바랍니다.
                  </p>
                  
                  <p class="storeWriteNotice">
                      1.1. 본 프로젝트와 무관한 광고성, 욕설, 비방 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다.
                      <br>2.2. 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.
                      <br>3.3. 제품 관련 문의 및 기타 문의는 'Q&A탭'을 통해 정확한 답변을 받을 수 있습니다.
                      <br>4.4. 서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.
                      <br>5.5. 상품 품질에 대한 고객님의 솔직한 리뷰를 남겨주세요.
                  </p>
              </div>
              <div class="modal-footer">
                  <button type="submit" id="reviewModifyBtn" class="btn btn-outline-danger reviewModifyBtn">리뷰 수정</button>
              </div>
              </form>
          </div>
      </div>
  </div>

<!-- 리뷰 수정 모달 끝 -->
<!-- 리뷰 삭제 모달 -->
<div class="modal fade" id="reviewDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="reviewDelForm" method="post">
        <div class="modal-dialog">
            <div class="modal-content write_modal_content">
                <div class="modal-header write_modal_header">
                    <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body write_modal_body">
                
                    <h4 class="bold"><br><br>정말 삭제 하시겠습니까?</h4>
                    <input type=hidden value="${detail.store_idx }" name="store_idx">
                    <input type=hidden value="${login.member_idx }" name="member_idx">
                    <input type=hidden value="${detail.store_order_idx }" name="store_order_idx">
                </div>
                <div class="modal-footer write_modal_footer">
                    <button type="button" id="reviewDelBtn" class="qnaDeleteBtn qnaBtn btn btn-outline-danger">예</button>
                    <button type="button" id="reviewDelNo" class="qnaBtn btn btn-outline-success">아니오</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="../resources/js/mypage/info_store_detail.js"></script>
</body>
</html>