<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_pay_complete.css">
<link rel="stylesheet" type="text/css" href="../resources/css/home.css">
<title>스토어 주문 완료</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
    <main>
    <!-- 펀딩 제목  -->
<%-- 	<div><h3>${info.store_title}</h3></div> --%>
    <div class="container" style="margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div class="reserve_card">
                    <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12"><div style="color: #fa6462">${member.member_name}님,</div> 주문이 완료되었습니다.</div>
                    <table class="type04">
					  <tr>
					    <th scope="row">상품명</th>
					    <td>${info.store_title}</td>
					  </tr>
					  <tr>
					    <td colspan="2" style="border-bottom: none; color: gray;">
					    	* 주문하신 상품의 주문이 완료되었습니다.<br>
<%-- 	                    	<input type="hidden" id="end_date" value="${read.funding_end_date}"> --%>
	                    	<c:forEach var="item" items="${myStoreList}" varStatus="i">
		                    	<c:if test="${i.first}">
		                        * 상세 내역은 스토어 내역 > <a href="<%= request.getContextPath()%>/mypage/info_store_detail.do?store_idx=${item.store_idx}&store_order_idx=${ item.store_order_idx }" style="text-decoration: underline;color: #007bff;">스토어 상세 내역</a>에서 확인해주세요.<br>
		                    	</c:if>
		                    </c:forEach>
		                    * 배송 정보 변경이 필요한 경우, 발송이 시작되기 전 판매자에게 문의해주세요.
					    </td>
					  </tr>
					</table>
					
                    <div style="display: inline-block; text-align: center; width: 100%; margin: 15px 0;">
                    <c:forEach var="item" items="${myStoreList}" varStatus="i">
                    	<c:if test="${i.first}">
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/mypage/info_store_detail.do?store_idx=${item.store_idx}&store_order_idx=${ item.store_order_idx }'" class="btn buy_detail">
                        	구매 상세 보기
                        </button>
                    	</c:if>
                    </c:forEach>
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/store/store_main.do'" class="btn store_home">스토어 홈 가기</button>
                    </div>
                    </div>
                </div>
            </div>
            <!-- 공유하기 -->
<!--             <div class="col-xs-12" style="width: 100%; margin-top: 100px;"> -->
<!--             	<hr> -->
<!--                 <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">공유하기</div> -->
<!--                 <div style="padding: 5px;"> -->
<!--                 	<div style="font-size: 20px; font-weight: bold"><span style="color: #d9a407">공유해주세요!</div> -->
<!--                 	<div style="display: inline-block; text-align: center; width: 100%; margin: 15px 0;"> -->
<!--                         <a href="https://www.facebook.com/" type="button" class="btn btn-light" > -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#4267B2" class="bi bi-facebook" viewBox="0 0 20 20"> -->
<!-- 							  <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/> -->
<!-- 							</svg> 페이스북 공유 -->
<!-- 						</a> -->
<!-- 						<a href="https://www.instagram.com/" type="button" class="btn btn-light" > -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#bc2a8d" class="bi bi-instagram" viewBox="0 0 20 20"> -->
<!-- 							  <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/> -->
<!-- 							</svg> 인스타그램 공유 -->
<!-- 						</a> -->
<!-- 						<a href="https://twitter.com" type="button" class="btn btn-light" > -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#1DA1F2" class="bi bi-twitter" viewBox="0 0 20 20"> -->
<!-- 							  <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/> -->
<!-- 							</svg> 트위터 공유 -->
<!-- 						</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
                
            <div class="col-xs-12" style="width: 100%; margin-top: 50px;">
            	<hr>
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">스토어 추천 제품</div>
                <div class="row" style="padding: 45px 100px;">
                	<div class="row">
               	   	<c:forEach var="item" items="${storeHomeFund}">
	                   <div class="col-lg-2 col-sm-4 col-6">
	                       <div class="card section03_card">
	                           <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
		                            <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top" alt="...">
		                       </a>
	                           <div class="card-body">
	                               <p class="card-text section03_title">
	                               		<a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
	                               			${item.store_title }
	                               		</a>
	                               </p>
	                               <p class="card_store_text02">
	                                   <fmt:formatNumber value="${item.store_price }" type="number" /><span class="won">원</span>
	                                   &nbsp;<span>|</span>&nbsp;
	                                   <span>
	                                   		<c:if test="${item.store_category eq 0}">
				                        		강아지
				                        	</c:if>
				                        	<c:if test="${item.store_category eq 1}">
				                        		고양이
				                        	</c:if>
				                        	<c:if test="${item.store_category eq 2}">
				                        		반려동물
				                        	</c:if>
	                                   </span>
	                               </p>
	                           </div>
	                       </div>
	                   </div>
               	   	</c:forEach>
               	</div>
                </div>
            </div>
        </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>