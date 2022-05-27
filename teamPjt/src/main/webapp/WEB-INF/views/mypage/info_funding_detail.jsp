<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/info_store_detail.css">
    <!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>펀딩 상세 내역</title>


<script>
//날짜 계산
window.onload = function(){
		var end_date = document.getElementById('end_date').value;
		var date = end_date.split("-");
		var end_date_text = new Date(date.toLocaleString());
		end_date_text = end_date_text.getFullYear() + "년 " + ((end_date_text.getMonth() + 1) > 9 ? (end_date_text.getMonth() + 1).toString() : "0" + (end_date_text.getMonth() + 1)) + "월 " + (end_date_text.getDate() > 9 ? end_date_text.getDate().toString() : "0" + end_date_text.getDate().toString()) + "일";
		//document.getElementById('end_date').textContent = end_date_text;
		
		// 결제 예정일
		var pay_date = new Date(date.toLocaleString());
		pay_date.setDate(pay_date.getDate() + 1);
		var pay_date_text = pay_date.getFullYear() + "-" + ((pay_date.getMonth() + 1) > 9 ? (pay_date.getMonth() + 1).toString() : "0" + (pay_date.getMonth() + 1)) + "-" + (pay_date.getDate() > 9 ? pay_date.getDate().toString() : "0" + pay_date.getDate().toString());
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
		
		
		//카드 번호 가져오기
		var card_num = $('#card_num').text()
		var secret_card_num = card_num.split(' ');
		console.log(secret_card_num);
		var replace = '****'
		var replace_card_num = secret_card_num[0] +" "+ secret_card_num[1] +" "+ replace +" "+ secret_card_num[3];
		$('#card_num').text(replace_card_num)
	}


//주소 찾기
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=funding_express_postnum]").val(data.zonecode);
           $("[name=funding_express_addr1]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
//배송지 변경
function changeExpress(){
	console.log(1);
	
	//display:none; 속성 추가
	$("#express").attr("style","display:none");
	
	//변경버튼 -> 취소버튼
	$("#change").children("button").remove();
	$("#change").append('<button onclick="notChange()">취소</button>');
	
	/* $("#express").after("<tr class='ex'><td>주소</td>"+
			"<td>"+
            "<div class='form-group'>"+ 
            "<input class='form-control' style='width: 40%; display: inline;' placeholder='우편번호' name='funding_express_postnum' id='funding_express_postnum' type='text' readonly='readonly' value='${ express.funding_express_postnum }' >"+
			    "<button type='button' class='btn btn-secondary' onclick='execPostCode();'><i class='fa fa-search'></i>주소 찾기</button>"+                               
			"</div>"+
			"<div class='form-group'>"+
			    "<input name='funding_express_addr1' class='form-control' style='top: 5px;' placeholder='도로명 주소'  id='funding_express_addr1' type='text' readonly='readonly' value='${ express.funding_express_addr1 }'/>"+
			"</div>"+
			"<div class='input-group mb-3'>"+
            	"<input type='text' class='form-control' name='funding_express_addr2' id='funding_express_addr2' value='${ express.funding_express_addr2 }'>"+
        	"</div>"+
        	"<div class='row'>"+ 
            	"<div class='col-sm-12' style='text-align: right;'><button type='button' class='btn btn-dark' style='width: 250px;' onclick='changeExpress2()'>배송지 정보 변경 완료</button></div>"+
        	"</div>"+
        "</td></tr>");
	$("#express").after("<tr class='ex'><td>전화번호</td><td><input  name='funding_express_phone' type='text' class='form-control m-input telCheckSize' placeholder='전화번호 입력' id='funding_express_phone' value='${ express.funding_express_phone }'</td></tr>");
	$("#express").after("<tr class='ex'><td>이름</td><td><input  name='funding_express_name' type='text' class='form-control' placeholder='이름 입력' id='funding_express_name' value='${express.funding_express_name}'</td></tr>"); */
	$("#express").after('<tr class="ex">'+
							'<td class="odb_td odb_td1 odb_td1_top" style="width:10%">수령인</td>'+
							'<td class="odb_td" odb_td_line2 style="width:60%"><input  name="funding_express_name" type="text" class="form-control" placeholder="이름 입력" id="funding_express_name" value="${express.funding_express_name}"></td>'+
						'</tr>'+
						'<tr class="ex">'+
							'<td class="odb_td odb_td1 odb_td1_bot">연락처</td>'+
							'<td class="odb_td odb_td_line">'+
								'<input  name="funding_express_phone" type="text" class="form-control m-input telCheckSize" placeholder="전화번호 입력" id="funding_express_phone" value="${ express.funding_express_phone }">'+
							'</td>'+
						'</tr>'+
						'<tr class="ex">'+
							'<td class="odb_td odb_td1">배송지</td>'+
							'<td class="odb_td odb_td_line">'+
								'<div class="form-group">'+
									'<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="funding_express_postnum" id="funding_express_postnum" type="text" readonly="readonly" value="${ express.funding_express_postnum }">'+
									'<button type="button" class="btn btn-secondary" onclick="execPostCode();"><i class="fa fa-search"></i>주소 찾기</button>'+
								'</div>'+
								'<div class="form-group">'+
									'<input name="funding_express_addr1" class="form-control" style="top: 5px;" placeholder="도로명 주소"  id="funding_express_addr1" type="text" readonly="readonly" value="${ express.funding_express_addr1 }"/>'+
								'</div>'+
								'<div class="input-group mb-3">'+
									'<input type="text" class="form-control" name="funding_express_addr2" id="funding_express_addr2" value="${ express.funding_express_addr2 }">'+
								'</div>'+
								'<div class="row">'+
									'<div class="col-sm-12" style="text-align: right;"><button type="button" class="btn btn-dark" style="width: 250px;" onclick="changeExpress2()">배송지 정보 변경 완료</button></div>'+
									
								'</div>'+
							'</td>'+
						'</tr>'
						);

}
//배송지 변경2
function changeExpress2(){
	console.log("funding_express_name"+$("#funding_express_name").val());
	console.log("funding_express_phone"+$("#funding_express_phone").val());
	console.log("funding_express_addr1"+$("#funding_express_addr1").val());
	console.log("funding_express_addr2"+$("#funding_express_addr2").val());
	console.log("funding_express_postnum"+$("#funding_express_postnum").val());
	console.log("funding_order_idx : "+${ express.funding_order_idx });
	
	//ajax로 넘겨서 funding_express 변경
	$.ajax({
		url : "changeExpress.do",
		type : "post",
		data : {"funding_express_name":$("#funding_express_name").val(),
				"funding_express_phone":$("#funding_express_phone").val(),
				"funding_express_postnum":$("#funding_express_postnum").val(),
				"funding_express_addr1":$("#funding_express_addr1").val(),
				"funding_express_addr2":$("#funding_express_addr2").val(),
				"funding_order_idx":${ express.funding_order_idx }
		},
        success:function(data){
        	if(data=="s"){
        		alert("주소지 변경 완료");
        		location.reload(true);
        		location.href=location.href;
        		
        	}else{
        		alert("주소지 변경 오류");
        	}
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	alert('주소 변경 에이잭스 오류');
        }
	});
	
}
//배송지 변경 취소
function notChange(){
	$("#express").removeAttr("style");
	$(".ex").remove();
	
	//취소버튼 -> 변경버튼
	$("#change").children("button").remove();
	$("#change").append('<button onclick="changeExpress(this)">변경</button>');
}
</script>
</head>
<body>
<main>
<c:import url="/header.do"></c:import>

<div class="mypage_background mypage_background_detail">${detail.funding_title }</div>
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
            </div><!-- end of col-3 -->
            <div class="col-9 order_detail_place">
                <div class="order_detail_top">
                    <h5>펀딩 상세정보</h5>
                    
                    <fmt:formatDate var="order_date" value="${detail.funding_order_date}" pattern="yyyy-MM-dd" />
                    <fmt:parseDate var="end_date_parse" value="${detail.funding_end_date}" pattern="yyyy-MM-dd" />
                    <fmt:formatDate var="end_date" value="${end_date_parse}" pattern="yyyy-MM-dd" />
                    
                    <input type="hidden" id="end_date" value="${detail.funding_end_date}">
                    
                    <div class="order_detail_num">
                        <span>펀딩 예약일</span>
                        <span class="color">${order_date }</span>
                        <span class="middlebar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                        <span>펀딩 종료일</span>
                        <span class="color">${end_date }</span>
                        <span class="middlebar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                        <span>펀딩번호</span>
                        <span class="color">${detail.funding_order_idx }</span>
                        <span class="middlebar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                        <br>
                        <span>결제 예정일</span>
                        <span class="color" id="pay_date"></span>
                        <span class="middlebar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                        <span>발송 예정일</span>
                        <span class="color" id="express_date"></span>
                    </div>
                    <div class="order_datail_product">
                        <table class="odp_table" style="width: 100%;">
                            <tr class="odp_tr1">
                                <td style="width: 10%; font-weight: bold;">펀딩번호</td>
                                <td style="width: 50%;">상품정보</td>
                                <td class="odp_td" style="width: 15%;">배송비/판매자</td>
                                <td class="odp_td odp_td_top" style="width: 25%;" colspan="2">진행상태</td>
                            </tr>
                            <tr class="odp_tr2">
                                <td>${detail.funding_order_idx }</td>
                                <td>
                                    <div class="row">
                                        <div class="col-3">
                                            <a href="../funding/view.do?funding_idx=${detail.funding_idx }" class="odp_table_a">
                                           
                                                <img src="../resources/upload/funding/${detail.funding_thumbnail}">
                                            </a>
                                        </div>
                                        <div class="col-9 odp_title" style="text-align: left;">
                                            <c:forEach var="item" items="${ option }">
                                            	<span>${ item.funding_option_name }</span>
                                            	<span>|</span>
                                            	<span><fmt:formatNumber value="${ item.funding_option_price }" type="number" />원 (${ item.funding_order_option_select_count }개)</span>
                                            	
                                            	<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </td>
                                <td class="odp_td">
                                    <span><fmt:formatNumber value="${detail.funding_express_fee }" type="number" />원</span><br>
                                    <span class="odp_sub">${detail.member_name }</span><br>
                                    <span class="odp_sub">(${detail.member_phone })</span>
                                    <button type="button" class="" onclick="window.open('note.do?funding_idx=${detail.funding_idx}&store_idx=0&message_idx=0','PopupWin', 'width=500,height=700');" >판매자 문의</button>
                                </td>
<!-- 0020 배송상태 -->
                                <td class="odp_td" style="width: 10%">
                                	<c:choose>
                                		<c:when test="${ detail.funding_order_pay_state eq 2 }">
											펀딩 취소
							        	</c:when>
						        		<c:otherwise>
						        			<c:if test="${ detail.funding_current_state eq 0 }">
	                                			펀딩 진행중
	                                		</c:if>
	                                		<c:if test="${ detail.funding_current_state eq 1 }">
												펀딩 성공
							        		</c:if>
							        		<c:if test="${ detail.funding_current_state eq 2 }">
												펀딩 실패
							        		</c:if>
						        		</c:otherwise>
                                	</c:choose>
                                </td>
                                <td class="odp_td odp_td_bot">
                                	<c:choose>
                                		<c:when test="${ detail.funding_order_pay_state eq 0 }">
											<button type="button" class="btn" onclick="fundingWithdrawal()">펀딩 취소</button>
							        	</c:when>
							        	<c:when test="${ detail.funding_order_pay_state eq 1 }">
											결제 완료
						        		</c:when>
						        		<c:when test="${ detail.funding_order_pay_state eq 2 }">
											결제 취소
						        		</c:when>
							        </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="order_detail_middle">
                    <h5>펀딩/결제 금액 정보</h5>
                    <div class="odm_talbe_div">
                        <table class="odm_table" style="width: 100%;">
                            <tr>
                                <td class="odm_td" style="width: 33%;">
                                    <span class="bold">최초펀딩금액</span>
                                    <div class="odm_td_div">
                                        상품금액 <span><fmt:formatNumber value="${ detail.funding_order_total_price - detail.funding_express_fee - detail.funding_order_donation}" type="number" />원</span>
                                        <br>
                                        후원금 <span>+<fmt:formatNumber value="${ detail.funding_order_donation}" type="number" />원</span>
                                        <br>
                                        배송비 <span>+<fmt:formatNumber value="${ detail.funding_express_fee }" type="number" />원</span>
                                    </div>
                                </td>
                                <td class="odm_td" style="width: 33%;">
                                    <span class="bold">결제상세</span>
                                    <div class="odm_td_div">
                                        카드결제 <span><fmt:formatNumber value="${ detail.funding_order_total_price }" type="number" />원</span>
                                        <br>
                                        카드번호 <span id="card_num">${ pay.funding_order_pay_card_num }</span>
                                    </div>
                                </td>
                                <td class="odm_td odm_td_last" style="width: 34%;">
                                	<c:choose>
                                		<c:when test="${ detail.funding_order_pay_state eq 0 }">
											<span class="bold">결제예정</span>
		                                    <div class="odm_td_div">
		                                        주문금액 <span><fmt:formatNumber value="${ detail.funding_order_total_price }" type="number" />원</span>
		                                    </div>
		                                    <div class="odm_td_div">
		                                        카드결제 <span><fmt:formatNumber value="${ detail.funding_order_total_price }" type="number" />원</span>
		                                    </div>
							        	</c:when>
							        	<c:when test="${ detail.funding_order_pay_state eq 1 }">
											<span class="bold">결제완료</span>
		                                    <div class="odm_td_div">
		                                        주문금액 <span><fmt:formatNumber value="${ detail.funding_order_total_price }" type="number" />원</span>
		                                    </div>
		                                    <div class="odm_td_div">
		                                        카드결제 <span><fmt:formatNumber value="${ detail.funding_order_total_price }" type="number" />원</span>
		                                    </div>
						        		</c:when>
						        		<c:when test="${ detail.funding_order_pay_state eq 2 }">
											<span class="bold">결제취소</span>
						        		</c:when>
							        </c:choose>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
<!-- 0030 배송지 -->
                <div class="order_detail_bottom">
                	
                    <h5 id="change">
                    	배송지 정보 
                    	<button onclick="changeExpress(this)">변경</button>
                   	</h5>
                    
                    <div class="odb_table_div">
                        <table class="odb_table" style="width: 100%;" id="express">
                            <tr>
                                <td class="odb_td odb_td1 odb_td1_top" style="width:10%">수령인</td>
                                <td class="odb_td" odb_td_line2 style="width:60%">${ express.funding_express_name }</td>
                            </tr>
                            <tr>
                                <td class="odb_td odb_td1">배송지</td>
                                <td class="odb_td odb_td_line">
                                    ${ express.funding_express_postnum }<br>
                                    ${ express.funding_express_addr1 }<br>
                                    ${ express.funding_express_addr2 }
                                </td>
                            </tr>
                            <tr>
                                <td class="odb_td odb_td1 odb_td1_bot">연락처</td>
                                <td class="odb_td odb_td_line">
                                    ${ express.funding_express_phone }
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div><!-- end-of-col-9 -->
		</div><!-- end_of_row -->
	</div>
   
<c:import url="/footer.do"></c:import>
<script type="text/javascript">
		
		
	function fundingWithdrawal(){
		$("#checkFdWithdrawalModal").modal("toggle");
	}
</script>
    <!-- 모달 -->
	<div class="modal fade" id="checkFdWithdrawalModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content login_modal_content">
	      <div class="modal-header login_modal_header">
	        <button type="button" class="login_modal_close close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body login_modal_body">
	      	<div style="text-align:center;"><h4> 정말 펀딩을 취소하시겠습니까? </h4></div>
	      	<form action="fundingWithdraw.do" method="post">
	      		<input type="hidden" name="funding_order_idx" id="orderIdx" value="${ express.funding_order_idx }"/>
	      		<input type="hidden" name="funding_order_total_price" value="${ detail.funding_order_total_price }"/>
	      		<input type="hidden" name="funding_idx" value="${ detail.funding_idx }"/>
	      		<c:forEach var="item" items="${ option }">
	      			<input type="hidden" name="funding_order_option_select_count" value="${ item.funding_order_option_select_count }"/>
	      			<input type="hidden" name="funding_order_option_select_idx" value="${ item.funding_order_option_select_idx }"/>
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
</main>
</body>