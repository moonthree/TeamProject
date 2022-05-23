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
<link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_reserve_complete.css">
<script>
	window.onload = function(){
		var end_date = document.getElementById('end_date').value;
		var date = end_date.split("-");
		var end_date_text = new Date(date.toLocaleString());
		end_date_text = end_date_text.getFullYear() + "년 " + ((end_date_text.getMonth() + 1) > 9 ? (end_date_text.getMonth() + 1).toString() : "0" + (end_date_text.getMonth() + 1)) + "월 " + (end_date_text.getDate() > 9 ? end_date_text.getDate().toString() : "0" + end_date_text.getDate().toString()) + "일";
		document.querySelector('#end_date_text').textContent = end_date_text;
		
		// 결제 예정일
		var pay_date = new Date(date.toLocaleString());
		pay_date.setDate(pay_date.getDate() + 1);
		var pay_date_text = pay_date.getFullYear() + "년 " + ((pay_date.getMonth() + 1) > 9 ? (pay_date.getMonth() + 1).toString() : "0" + (pay_date.getMonth() + 1)) + "월 " + (pay_date.getDate() > 9 ? pay_date.getDate().toString() : "0" + pay_date.getDate().toString()) + "일";
		pay_date = pay_date.getFullYear() + "-" + ((pay_date.getMonth() + 1) > 9 ? (pay_date.getMonth() + 1).toString() : "0" + (pay_date.getMonth() + 1)) + "-" + (pay_date.getDate() > 9 ? pay_date.getDate().toString() : "0" + pay_date.getDate().toString());
		document.querySelector('#pay_date').textContent = pay_date_text;

		// 배송 예정일 (+40~45일)
		var express_date1 = new Date(pay_date.toLocaleString());
		express_date1.setDate(express_date1.getDate() + 40);
		express_date1 = express_date1.getFullYear() + "-" + ((express_date1.getMonth() + 1) > 9 ? (express_date1.getMonth() + 1).toString() : "0" + (express_date1.getMonth() + 1)) + "-" + (express_date1.getDate() > 9 ? express_date1.getDate().toString() : "0" + express_date1.getDate().toString());
		var express_date2 = new Date(pay_date.toLocaleString());
		express_date2.setDate(express_date2.getDate() + 45);
		express_date2 = express_date2.getFullYear() + "-" + ((express_date2.getMonth() + 1) > 9 ? (express_date2.getMonth() + 1).toString() : "0" + (express_date2.getMonth() + 1)) + "-" + (express_date2.getDate() > 9 ? express_date2.getDate().toString() : "0" + express_date2.getDate().toString());
		document.querySelector('#express_date').textContent = express_date1 + " ~ " + express_date2;
	}
	
</script>
<title>펀딩 결제 예약 완료</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
    <main>
    <!-- 펀딩 제목  -->
	<div><h3>${read.funding_title }</h3></div>
    <div class="container" style="margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
            	<div class="wrap" style="margin: 30px 0px 20px auto;">
                    <div class="step" style="text-align: center; width: 455px; margin: 0 auto; font-weight: 600;">
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">결제 예약</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="color: #fff; border: none; background: #fa6462;">예약 완료</div>
                    </div>
                </div>
                <div class="reserve_card">
                    <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12"><div style="color: #fa6462">${member.member_name}님,</div> 펀딩 예약이 완료되었습니다.</div>
                    <table class="type04">
					  <tr>
					    <th scope="row">프로젝트명</th>
					    <td>${read.funding_title}</td>
					  </tr>
					  <tr>
					    <th scope="row">결제 예정일</th>
					    <td>목표금액을 달성할 경우, <div id="pay_date" style="display: inline;">결제 날짜</div>에 자동 결제 예정</td>
					  </tr>
					  <tr>
					    <th scope="row">배송 예정일</th>
					    <td><div id="express_date" style="display: inline;">배송 날짜</div></td>
					  </tr>
					  <tr>
					    <td colspan="2" style="border-bottom: none; color: gray;">
					    	* 결제 성공 시 배송 예정일에 전달 예정입니다.<br>
	                    	<input type="hidden" id="end_date" value="${read.funding_end_date}">
	                    	<c:forEach var="item" items="${myFundingList}" varStatus="i">
		                    	<c:if test="${i.first}">
		                        * 펀딩 내역 > <a href="<%= request.getContextPath()%>/mypage/info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }" style="text-decoration: underline;color: #007bff;">펀딩 상세 내역</a>에서 <div id="end_date_text" style="display: inline;">종료 날짜</div>까지 펀딩을 취소 및 변경하실 수 있습니다.
		                    	</c:if>
		                    </c:forEach>
					    </td>
					  </tr>
					</table>
<!--                     <div style="font-size: 18px; line-height: 3;}"> -->
<!-- 						프로젝트 성공 종료 시 <div id="pay_date" style="display: inline;">결제 날짜</div>에 결제됩니다.<br> -->
<!-- 						결제 성공 시 <div id="express_date" style="display: inline;">배송 날짜</div>에 발송 예정입니다.<br> -->
<%-- 						* 펀딩 내역 > <a href="#">펀딩 상세</a>에서 ${read.funding_end_date}까지 펀딩을 취소 및 변경하실 수 있습니다. --%>
<!--                     </div> -->
                    <div style="display: inline-block; text-align: center; width: 100%; margin: 15px 0;">
                    <c:forEach var="item" items="${myFundingList}" varStatus="i">
                    	<c:if test="${i.first}">
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/mypage/info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" class="btn reserve_detail">
                        	펀딩 상세 내역 보기
                        </button>
                    	</c:if>
                    </c:forEach>
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/main.do'" class="btn funding_home">펀딩 홈 가기</button>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12" style="width: 100%; margin-top: 100px;">
            	<hr>
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">공유하기</div>
                <div style="padding: 5px;">
                	<div style="font-size: 20px; font-weight: bold"><span style="color: #d9a407">${read.funding_end_date}</span>까지 모금이 활발하게 이어지도록, 이 프로젝트를 주변에 알려주세요!</div>
                	<div style="display: inline-block; text-align: center; width: 100%; margin: 15px 0;">
                        <a href="https://www.facebook.com/" type="button" class="btn btn-light" >
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#4267B2" class="bi bi-facebook" viewBox="0 0 20 20">
							  <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
							</svg> 페이스북 공유
						</a>
						<a href="https://www.instagram.com/" type="button" class="btn btn-light" >
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#bc2a8d" class="bi bi-instagram" viewBox="0 0 20 20">
							  <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
							</svg> 인스타그램 공유
						</a>
						<a href="https://twitter.com" type="button" class="btn btn-light" >
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#1DA1F2" class="bi bi-twitter" viewBox="0 0 20 20">
							  <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
							</svg> 트위터 공유
						</a>
                    </div>
                </div>
            </div>
                
            <div class="col-xs-12" style="width: 100%; margin-top: 50px;">
            	<hr>
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">취향 맞춤 펀딩 프로젝트</div>
                <article>
                <div class="row">
                  <div class="col-lg-4 col-md-12">
                      <div class="card">
                      <img  style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAzMjNfMjYg%2FMDAxNjQ4MDI1NzI3ODUx.vzt2n8yQnjwEGoaBwNh5w-sWSoLsYNzKKe2PPUwHnG8g.4NpNElrFsZl3YMKWdwj94k8amFqu0B-D6XSfMJhaEZcg.JPEG.bryam%2F1_%25283%2529.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMTZfMTky%2FMDAxNjAyODE3ODE5NDAw.lRnreU9Br7iCfOLs_Y7MG5dKCk0EaF-b-zQW6COrlWgg.fl-h-0x7OyDK2VX83_AqxZGhqSsgJrZCW9mM-UPsgfkg.JPEG.luckystar_00%2F%25BA%25B0%25BB%25E7%25C1%25F8%25B0%25FC_%25B9%25DD%25B7%25C1%25B5%25BF%25B9%25B01.jpg&type=sc960_832" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150715_105%2Fcodn9_1436957170912RkyPh_JPEG%2Fhttps3A2F2F41.media.tumblr.com2Fd3b5a3b8793fe1111ce4a544299fb3bb2Ftumblr_ne.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-4 col-md-12">
                     <div class="card">
                      <img  style="height: 200px; width: auto;" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Ff4%2F9c%2F7c%2Ff49c7ced21fad4c5a70ac61940c4a435.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card" >
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDhfMTAg%2FMDAxNjI1NzEwMDg0ODg4.aL9dS24RZ4Sp468CjTNI50iGF4vRlF_3xAraXo3OCVog.KA7XiKJw4wu11PlLNjX-pkK5Nz6iccYwsAy9PUqFnJMg.JPEG.lsb1933%2FIMG_8113.JPG&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  
                    <div class="col-lg-4 col-md-12">
                     <div class="card" >
                      <img style="height: 200px; width: auto;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAzMjNfMjYg%2FMDAxNjQ4MDI1NzI3ODUx.vzt2n8yQnjwEGoaBwNh5w-sWSoLsYNzKKe2PPUwHnG8g.4NpNElrFsZl3YMKWdwj94k8amFqu0B-D6XSfMJhaEZcg.JPEG.bryam%2F1_%25283%2529.jpg&type=a340" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text">[wa배송] 카드 잃어버릴 걱정 끝! 소매에 주머니 달린 I TTC멘투맨</p>
                      </div>
                    </div>
                  </div>
                  </div>
                  </article>
            </div>
        </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>