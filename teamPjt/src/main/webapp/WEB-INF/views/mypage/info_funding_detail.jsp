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

    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    <!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>펀딩 상세 내역</title>
<style>
    main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    } 
    .bg-text {
        color: white;
        font-weight: bold;
        position: absolute;
        top: 13%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 2;
        width: 80%;
        padding: 30px;
        text-align: center;
    }
    
    /*빨간색 버튼*/
    .w-btn-outline {
	    position: relative;
	    padding: 5px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	}
	.w-btn-red-outline:hover {
	    background-color: #ff5f2e;
	    color: #e1eef6;
	}
	.w-btn-black-outline:hover{
		background-color : black;
		color : white;
	}
</style>
<script>
function autoHypenTel(str) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';

    if (str.substring(0, 2) == 02) {
        // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
        if (str.length < 3) {
        return str;
        } else if (str.length < 6) {
        tmp += str.substr(0, 2);
        tmp += '-';
        tmp += str.substr(2);
        return tmp;
        } else if (str.length < 10) {
        tmp += str.substr(0, 2);
        tmp += '-';
        tmp += str.substr(2, 3);
        tmp += '-';
        tmp += str.substr(5);
        return tmp;
        } else {
        tmp += str.substr(0, 2);
        tmp += '-';
        tmp += str.substr(2, 4);
        tmp += '-';
        tmp += str.substr(6, 4);
        return tmp;
        }
    } else {
        // 핸드폰 및 다른 지역 전화번호 일 경우
        if (str.length < 4) {
        return str;
        } else if (str.length < 7) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
        } else if (str.length < 11) {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
        } else {
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
        }
    }
    return str;
}
$(function(){
    $(".telCheckSize").keyup(function (event) {
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenTel(_val);
    });
})
</script>
</head>
<body>
<main id="wrapper">
<c:import url="/header.do"></c:import>
   <!-- 썸네일 -->
    <div class="card bg-dark text-white topcard">
        <img src="../resources/upload/funding/${detail.funding_thumbnail}" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">
            	<c:choose>
            		<c:when test="${ detail.funding_category eq 0 }">강아지 용품</c:when>
            		<c:when test="${ detail.funding_category eq 1 }">고양이 용품</c:when>
            		<c:when test="${ detail.funding_category eq 2 }">다른 동물 용품</c:when>
            	</c:choose>
            </h5>
            <br>
            <h3 class="card-title">${ detail.funding_title }</h3>
        </div>
    </div>
    <!-- -->    
    <div class="container" >
        
    <!--본문-->
        <div class="row">
            <!--펀딩 내역-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                	펀딩 내역
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="200px">펀딩 번호</td>
                            <td>${ detail.funding_idx }</td>
                            <td width="200px">펀딩 상태</td>
                            <td>
                                <c:choose>
                                	<c:when test="${ detail.funding_current_state eq 0 }">진행중</c:when>
                                	<c:when test="${ detail.funding_current_state eq 1 }">성공</c:when>
                                	<c:when test="${ detail.funding_current_state eq 2 }">실패</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 예약 날짜</td>
                            <td>
                               
                                <fmt:formatDate type="time" value="${detail.funding_order_date}" pattern="yyyy-MM-dd" />
                               
                            </td>
                            <td>발송 시작일</td>
                            <td>
                                ${ detail.funding_express_date }
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 종료일</td>
                            <td width="300px">
                                ${ detail.funding_end_date }
                            </td>
                            <td>펀딩 옵션</td>
                            <td width="300px">
                            
                            <c:forEach var="item" items="${ option }">
                            	<strong>구성</strong> ${ item.funding_option_name }(x${ item.funding_order_option_select_count })<br>
                            	<strong>금액</strong> ${ item.funding_option_price }<br>
                            	<br>
                            </c:forEach>
                           	
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <!--결제 내역-->
            <div class="col-md-6 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                결제 내역
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="200px">결제 금액</td>
                            <td>${ detail.funding_order_total_price - detail.funding_express_fee - detail.funding_order_donation }</td>
                        </tr>
                        <tr>
                            <td>추가 후원금</td>
                            <td>
                                ${ detail.funding_order_donation }
                            </td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>
                                ${ detail.funding_express_fee }
                            </td>
                        </tr>
                        <tr>
                            <td>최종 결제 금액</td>
                            <td>
                                ${ detail.funding_order_total_price }
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!--결제 정보-->
            <div class="col-md-6 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                	결제 정보
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="200px">결제 방법</td>
                            <td>신용카드</td>
                        </tr>
                        <tr>
                            <td>카드번호</td>
                            <td>
                                ${ pay.funding_order_pay_card_num }
                            </td>
                        </tr>
                        <tr>
                            <td>할부 기간</td>
                            <td>
                                	일시불
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
		<script type="text/javascript">
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
	    	$("#change").children("div").remove();
	    	$("#change").append("<div style='color:blue; cursor:pointer;' onclick='notChange()'>취소</div>");
	    	
			$("#express").after("<tr class='ex'><td>주소</td>"+
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
	    	$("#express").after("<tr class='ex'><td>이름</td><td><input  name='funding_express_name' type='text' class='form-control' placeholder='이름 입력' id='funding_express_name' value='${express.funding_express_name}'</td></tr>");

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
	    	$("#change").children("div").remove();
	    	$("#change").append("<div style='color:blue; cursor:pointer;' onclick='changeExpress()'>변경</div>");
		}
		</script>
        <div class="row">
            <!--배송지 정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th>
                                	배송지 정보
                            </th>
                            <td style="text-align: right" id="change">
                            	<div style="color:blue; cursor:pointer;" onclick="changeExpress(this)">변경</div>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="express">
                        <tr>
                            <td>이름</td>
                            <td>${ express.funding_express_name }</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                ${ express.funding_express_phone }
                            </td>
                        </tr>
                        <tr id="funding_express">
                            <td>주소</td>
                            <td>
                            	<div>(<span>${ express.funding_express_postnum }</span>)<span>${ express.funding_express_addr1 }</span></div>
                                <div>${ express.funding_express_addr2 }</div> 
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        
        <div class="row" style="margin-top:100px">
        	<div class="col-sm-12" style="text-align:right;">
             <button type="button" class="btn btn-outline-dark" style="width: 30%; height:50px;" onclick="fundingWithdrawal()">펀딩 취소</button>
        	</div>
        </div>
        <div class="row" style="margin-top:10px"> 
            <div class="col-sm-12">
            <button type="button" class="btn btn-dark" style="width: 100%; height:70px; " onclick="location.href='info_funding.do'">펀딩 목록 돌아가기</button>
            </div>
       		
        </div>
    </div>
    <script>
    	function fundingWithdrawal(){
    		$("#checkFdWithdrawalModal").modal("toggle");
    		$("#orderIdx").val(${ express.funding_order_idx });
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
<c:import url="/footer.do"></c:import>
</body>