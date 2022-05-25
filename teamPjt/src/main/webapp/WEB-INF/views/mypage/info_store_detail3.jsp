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
var message = ${msg};
if(message != null){alert(message);}

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
        <img src="../resources/upload/store/${detail.store_thumbnail}" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">
            	<c:choose>
            		<c:when test="${ detail.store_category eq 0 }">강아지 용품</c:when>
            		<c:when test="${ detail.store_category eq 1 }">고양이 용품</c:when>
            		<c:when test="${ detail.store_category eq 2 }">다른 동물 용품</c:when>
            	</c:choose>
            </h5>
            <br>
            <h3 class="card-title">${ detail.store_title }</h3>
        </div>
    </div>
    <!-- -->    
    <div class="container" >
        
    <!--본문-->
    <div class="row" style="margin-top:10px"> 
        <div class="col-sm-9"></div>
        <div class="col-sm-3">
        <button type="button" class="btn btn-dark" style="width: 100%; height:50px; " onclick="window.open('note.do?seller=${detail.member_idx}&consumer=${member.member_idx}&store_idx=${detail.store_idx }','PopupWin', 'width=500,height=700');" >판매자에게 문의하기</button>
        </div>		
    </div>
		
        <div class="row">
            <!--펀딩 내역-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                	구매 내역
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="200px">구매 번호</td>
                            <td>${ detail.store_idx }</td>
                            <td width="200px">구매 상태?</td>
                            <td>
                                <c:choose>
                                	<c:when test="${ detail.store_current_state eq 0 }">진행중</c:when>
                                	<c:when test="${ detail.store_current_state eq 1 }">성공</c:when>
                                	<c:when test="${ detail.store_current_state eq 2 }">실패</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>주문 날짜</td>
                            <td>
                               
                                <fmt:formatDate type="time" value="${detail.store_order_date}" pattern="yyyy-MM-dd" />
                               
                            </td>
                            <td>발송 시작일?</td>
                            <td>
                                	판매자가 발송버튼 누르면 보여짐
                            </td>
                        </tr>
                        <tr>
                            
                            <td>구매 옵션</td>
                            <td width="300px">
                            
                            <c:forEach var="item" items="${ option }">
                            	<strong>구성</strong> ${ item.store_option_name }(x${ item.store_order_option_select_count })<br>
                            	<strong>금액</strong> ${ item.store_option_price }<br>
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
                            <td>${ detail.store_order_total_price - detail.store_express_fee}</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>
                                ${ detail.store_express_fee }
                            </td>
                        </tr>
                        <tr>
                            <td>최종 결제 금액</td>
                            <td>
                                ${ detail.store_order_total_price }
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
                                ${ pay.store_order_pay_card_number }
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
                            <td>${ express.store_express_name }</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                ${ express.store_express_phone }
                            </td>
                        </tr>
                        <tr id="funding_express">
                            <td>주소</td>
                            <td>
                            	<div>(<span>${ express.store_express_postnum }</span>)<span>${ express.store_express_addr1 }</span></div>
                                <div>${ express.store_express_addr2 }</div> 
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        
        <div class="row" style="margin-top:100px">
        	<div class="col-sm-12" style="text-align:right; font-size: large; color:#737373">
        	<c:choose>
       			<c:when test="${ detail.store_order_pay_state eq 0 }">
					<c:if test="${ express.store_express_state eq 0 }">
						<button type="button" class="btn btn-outline-dark" style="width: 30%; height:50px;" onclick="storeWithdrawal()">주문 취소</button>
       				</c:if>
       				<c:if test="${ express.store_express_state eq 1 }">
						상품의 배송이 시작되었습니다.
	        		</c:if>
       			</c:when>
        		<c:when test="${ detail.store_order_pay_state eq 1 }">
					구매가 취소되었습니다.
        		</c:when>
        	</c:choose>
        	</div>
        </div>
        <div class="row" style="margin-top:10px"> 
            <div class="col-sm-12">
            <button type="button" class="btn btn-dark" style="width: 100%; height:70px; " onclick="location.href='info_store.do'">구매 목록 돌아가기</button>
            </div>		
        </div>
    </div>
    <script>
    	function storeWithdrawal(){
    		$("#checkStWithdrawalModal").modal("toggle");
    		$("#orderIdx").val(${ express.store_order_idx });
    	}
    </script>
    <!-- 모달 -->
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
	      		<input type="hidden" name="store_order_idx" id="orderIdx" value="${ express.store_order_idx }"/>
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
</html>
