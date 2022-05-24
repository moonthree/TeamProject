<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_pay.css">

<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function handleOnInput(el, maxlength) {
        if(el.value.length > maxlength)  {
            el.value 
            = el.value.substr(0, maxlength);
        }
    }

</script>

<title>스토어 주문 및 결제</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
    <main>
    <!-- 펀딩 제목  -->
	<div><h3>${param.store_title}</h3></div>
    <div class="container" style="margin-bottom: 6%;">
    	<div class="row" style="margin-top: 30px;">
	        <div class="col-md-12 section_title" style="font-size: 35px;">주문 및 결제</div>
	        <div class="payment_notice_container">
		        <div class="payment_notice">
	        		<span>
	        			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill messagebox_icon" viewBox="0 0 16 16">
						  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						</svg>
	        		</span>
	        		<div class="message_container">
	        			<p class="message_p">본 상품은 상시 판매하는 스토어 상품입니다.</p>
	        			<div class="message_d">
	        				<ul>
	        					<li>구매 즉시 결제가 진행됩니다.</li>
	        					<li>본 상품은 구매 후 1일 내 발송됩니다. (주말,공휴일 제외)</li>
	        				</ul>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	    </div>
        
        <form id="paymentForm" name="paymentForm" action="store_pay.do" method="post">
        <input type="hidden" name="member_idx" value="${member.member_idx}">
        <input type="hidden" name="select" value="${param.select}">
        <input type="hidden" name="store_idx" value="${param.store_idx }">
        <input type="hidden" name="store_order_pay_card_name" value="">
        <input type="hidden" name="store_order_pay_card_number" value="">
        <input type="hidden" name="store_order_pay_amount" value="">
        <div class="row" style="margin-top: 30px;">
	        <!-- 구매자 정보 -->
            <div class="col-md-6">
	        <div class="addressInfo_div section_title">구매자 정보</div>
                <table class="table table-borderless card buyer_card">
<!--                     <thead> -->
<!--                       <tr> -->
<!--                         <th scope="col" colspan="2"> -->
<!--                             <div style="font-size: 25px;">구매자 정보</div> -->
<!--                         </th> -->
<!--                       </tr> -->
<!--                     </thead> -->
                    <tbody style="display: inline-table;">
                      <tr>
                        <th scope="row" width="30%">이름</th>
                        <td>${member.member_name}</td>
                      </tr>
                      <tr>
                        <th scope="row">연락처</th>
                        <td>${member.member_phone}</td>
                      </tr>
                      <tr>
                        <th scope="row">이메일</th>
                        <td>${member.member_email}</td>
                      </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- 배송지 정보 -->
            <div class="col-md-6" style="padding: 0px 30px;">
                <div class="addressInfo_div section_title">배송지 정보</div>

                <!-- 선택 버튼  (새로입력/기존주소) -->
                <div class="addressInfo_button_div">
	                <div class="form-group">
	                    <div class="form-check form-check-inline">
	                        <input class="form-check-input" type="radio" onchange="setDisplay()" name="inlineRadioOptions1" id="inlineRadio1" value="option1" checked>
	                        <label class="form-check-label" for="inlineRadio1">새로 입력</label>
	                    </div>
	                    <div class="form-check form-check-inline">
	                        <input class="form-check-input" type="radio" onchange="setDisplay()" name="inlineRadioOptions1" id="inlineRadio2" value="option2">
	                        <label class="form-check-label" for="inlineRadio2">기존 주소</label>
	                    </div>
                	</div>
                </div>
                <hr>
                <!-- 배송지 입력란 -->
                <div class="addressInfo_input_div_wrap">
                	<!-- 새로 입력 -->
                    <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">이름</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" name="store_express_name1">
                          	</div>
                        </div>
                        <div class="form-group row">
                          	<label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">연락처</label>
                          	<div class="col-sm-9">
                            	 <input type="tel" onkeyup="mobile_keyup(this)" class="form-control m-input telCheckSize" name="store_express_phone1" id="telInput" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
                                    aria-label="Default" aria-describedby="inputGroup-sizing-default">
                          	</div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">주소</label>
                            <div class="col-sm-4">
                        	    <input type="number" class="form-control address1_input" name="store_express_postnum1" placeholder="우편번호">
                            </div>
                            <div class="col-sm-5">
                                <button type="button" class="btn btn-primary address_search_btn" onclick="execution_daum_address();" style="background-color: #fa6462; border: none;">주소 찾기</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address2_input" name="store_express_addr1_1" placeholder="기본 주소">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address3_input" name="store_express_addr2_1" placeholder="상세 주소">
                            </div>
                        </div>
                	</div>
                	<!-- 기존 주소 -->
                	<div class="addressInfo_input_div addressInfo_input_div_2">
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">이름</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" name="store_express_name2" value="${member.member_name}">
                          	</div>
                        </div>
                        <div class="form-group row">
                          	<label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">연락처</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" name="store_express_phone2" value="${member.member_phone}">
                          	</div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">주소</label>
                            <div class="col-sm-4">
                        	    <input type="text" class="form-control address1_input" name="store_express_postnum2" value="${member.member_postnum}">
                            </div>
                            <div class="col-sm-5">
<!--                                 <button type="button" class="btn btn-primary address_search_btn" onclick="execution_daum_address()" style="background-color: #83BD75; border: none;">주소 찾기</button> -->
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address2_input" name="store_express_addr1_2" value="${member.member_addr}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address3_input" name="store_express_addr2_2" value="${member.member_addr2}">
                            </div>
                        </div>
                	</div>
                </div>
<!--                 <hr> -->
<!--                 <div> -->
<!--                     <div style="font-weight: bold; margin-bottom: 10px;">배송 시 요청사항 (선택)</div> -->
<!--                     <div> -->
<!--                         <input type="text" class="form-control" id=""> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </div>
        
        <div class="row" style="margin-top: 40px;">
        	<!-- 상품 정보 -->
        	<div class="col-md-6" style="padding: 0px 30px;">
        		<div class="section_title">상품 정보</div>
        		<c:forEach var="optionlist" items="${optionlist}">
	        		<c:forEach var="select" items="${param.select}">
	        			<c:if test="${optionlist.store_option_idx == select}">
	        				<!-- 상품 제목  -->
			        		<div class="store_option_name">${optionlist.store_option_name}</div>
	        				<!-- 상품 설명 -->
			        		<div class="store_option_detail">${optionlist.store_option_detail}</div>
			        		<div class="store_option_price_info">
		        				<!-- 수량 -->
			        			<c:set var="p_num" value="p_num${select}" />
	                       		<input type="hidden" id="count" name="count" value="${param[p_num]}">
	                       		<span class="info_count">수량: <c:out value="${param[p_num]}"/>개</span>
				        		<!-- 가격 -->
			        			<c:set var="price" value="price${select}" />
	                       		<input type="hidden" id="price" name="price" value="${param[p_num]}">
	                       		<span class="info_price"><fmt:formatNumber value="${param[price]*param[p_num]}" type="number" />원</span>
			        		</div>
	        				<div class="line"></div>
	        			</c:if>
	       			</c:forEach>
			    </c:forEach>
			    <!-- 배송 안내사항 -->
			    <div style="margin-top: 24px;">
			    	<div class="delivery">배송 안내사항</div>
			    	<div class="delivery_notice">코로나로 인한 택배 배송(간선하차) 불가로 일부 지역은 배송이 제한될 수 있습니다. 자세한 내용은 공지사항을 참고 부탁드립니다.</div>
			    </div>
        	</div>
        
        	<!-- 결제 금액 -->
            <div class="col-md-6" style="padding: 0px 30px;">
            	<div class="section_title">결제 금액</div>
                <table style="margin: 0px auto; width: 90%; border-top: 1px solid black; border-bottom: 1px solid black; vertical-align: middle;" class="table order">
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">상품 금액</th>
                        <td style="border-top: 1px dashed gray;" colspan="2">
                        	<input type="hidden" id="expressFee" name="expressFee" value="0">
                        	<fmt:formatNumber value="${param.total_price}" type="number" />원
                        	<div></div>
                        </td>
                    </tr>
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">배송비</th>
                        <td style="border-top: 1px dashed gray;" colspan="2">
                        	<input type="hidden" id="expressFee" name="expressFee" value="0">
                        	<fmt:formatNumber value="${param.express_fee}" type="number" />원
                        	<div></div>
                        </td>
                    </tr>
                    <tr class="thead-light">
                        <th scope="col" style="border-top: 1px solid gray;">최종 결제가</th>
                        <th scope="col" style="border-top: 1px solid gray; text-align: right;" colspan="2">
                        	<!-- 배송비 추가 해야 함 -->
                        	<input type="hidden" id="sumTotal_id" name="store_order_total_price" value="${param.total_price+param.express_fee}">
                        	<strong><fmt:formatNumber value="${param.total_price+param.express_fee}" type="number" /></strong>원
                        	<div id="sumTotal"></div>
                        </th>
                    </tr>
                </table>
            </div>
        </div>
		
        </form>
        
        <!-- 동의 -->
        <div class="row" style="margin-top: 40px; padding: 0px 30px;">
            <div class="col-xs-12" style="width: 100%;">
                <div class="col-md-12 section_title">약관 동의</div>
            </div>
            <div class="col-xs-12" style="width: 100%;">
                <table style="border: 1px solid lightgray;" cellpadding="20px" width="100%">
                    <thead>
                      <tr>
                        <th scope="col" colspan="2">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="checkAll" name="checkAll">
                                <label class="custom-control-label" for="checkAll">전체 동의하기</label>
                            </div>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="chk1" name="checkbox" required="required">
                                <label class="custom-control-label" for="chk1"><span style="font-weight: bold">(필수)</span> 개인정보 제3자 제공 동의</label>
                            </div>
                        </td>
                        <td style="text-align: right;">
                            <!-- 모달창 -->
                            <div id="my_modal" style="text-align: left">
							 	<div style="font-weight: bold; font-size: 22px;">개인정보 제3자 제공 동의</div>
							    <hr>
								'펀딩하기'를 통한 결제 및 리워드 전달 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트 판매자)에게 제공합니다.<br>
								판매자에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이 판매자에게 있으며, 파기하지 않아 생기는 문제에 대한 법적 책임은 판매자에게 있습니다.<br>
								아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 서비스 이용이 제한됩니다.
								<hr>
							    <a class="modal_close_btn">확인</a>
							</div>
							<button id="popup_open_btn" style="border: none; text-decoration: underline; color: gray; background-color: transparent;">내용 보기</button>
                        </td>
                      </tr>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="chk2" name="checkbox" required="required">
                                <label class="custom-control-label" for="chk2"><span style="font-weight: bold">(필수)</span> 후원 유의사항 확인</label>
                            </div>
                        </td>
                        <td style="text-align: right;">
                        	<div class="accordion" id="accordionExample">
							  <div>
							    <div>
							      <h5 class="mb-0">
							        <button class="btn btn-link" id="accordionbtn" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							          	확인
							        </button>
							      </h5>
							    </div>
							  </div>
							</div>
                        </td>
                      </tr>
                      <tr>
                      	<td colspan="2" style="padding-top: 0px;">
                      		<div class="accordion" id="accordionExample">
							  <div>
							    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							      <div style="text-align: left;">
									<ul>
										<li style="font-size: 13px;line-height: 2;">
											후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.<br>
											텀블벅에서의 후원은 아직 실현되지 않은 프로젝트가 실현될 수 있도록 제작비를 후원하는 과정으로, 기존의 상품 또는 용역을 거래의 대상으로 하는 매매와는 차이가 있습니다. 
											따라서 전자상거래법상 청약철회 등의 규정이 적용되지 않습니다.
										</li>
										<li style="font-size: 13px;line-height: 2;">
											프로젝트는 계획과 달리 진행될 수 있습니다.<br>
											예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다. 
											본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.	
										</li>
									</ul>
							      </div>
							    </div>
							  </div>
							</div>
                      	</td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        <div style="text-align: center; margin-top: 60px;">
            <button type="button" class="btn btn_success" id="next">결제하기</button>
        </div>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
   	
<script type="text/javascript">
	
	/* 다음 주소 연동 */
	function execution_daum_address(){
		   new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 	// 추가해야할 코드
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                      addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	             	// 제거해야할 코드
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $(".address1_input").val(data.zonecode);
	                $(".address2_input").val(addr);				
	                // 커서를 상세주소 필드로 이동한다.
	                $(".address3_input").attr("readonly", false);
	                $(".address3_input").focus();	 
		            
		            
		        }
		    }).open();  	
		
	}
	//  연락처
		function mobile_keyup(obj){
		    let mobile_len=obj.value.length;
		    if(event.keyCode==8){
		        obj.value=obj.value.slice(0,mobile_len); 
		        return 0; 
		    }else if (mobile_len==3 || mobile_len==8){
		        obj.value += '-';
		    }
		}
		
	//  유효기간
		function date_keyup(obj){
		    let date_len = obj.value.length;
		    if (event.keyCode==8){
		        obj.value = obj.value.slice(0,date_len)
		        return 0;
		    }else if(date_len==2){
		        obj.value += '/';
		    }
		}
	
	// 주소 선택
		function setDisplay(){
		    if($('input:radio[id=inlineRadio1]').is(':checked')){
		        $('.addressInfo_input_div_1').show();
		        $('.addressInfo_input_div_2').hide();
		    }else{
		        $('.addressInfo_input_div_1').hide();
		        $('.addressInfo_input_div_2').show();
		    }
		}
	
	// 체크박스 - 전체 선택
		$(document).ready(function(){
            //전체 체크박스 클릭
            $("#checkAll").click(function() {
                if ($("#checkAll").prop("checked")) {
                    $(".custom-control-input").prop("checked", true);
                } else {
                    $(".custom-control-input").prop("checked", false);
                }
            });
            //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
            $(".custom-control-input").click(function() {
                if ($("input[name='checkbox']:checked").length == 2) {
                    $("#checkAll").prop("checked", true);
                } else {
                    $("#checkAll").prop("checked", false);
                }
            });
        });    
	
	// 유효성 검사
        $("#next").click(function(){
        	setTimeout( function(){
        	var store_express_name1 = $('input[name=store_express_name1]').val();
        	var store_express_phone1 = $('input[name=store_express_phone1]').val();
        	var store_express_postnum1 = $('input[name=store_express_postnum1]').val();
        	var store_express_addr2_1 = $('input[name=store_express_addr2_1]').val();
        	var card_num1 = $('input[id=card_num1]').val();
        	var card_num2 = $('input[id=card_num2]').val();
        	var card_num3 = $('input[id=card_num3]').val();
        	var card_num4 = $('input[id=card_num4]').val();
        	var store_order_pay_card_valid = $('input[name=store_order_pay_card_valid]').val();
        	var store_order_pay_card_password = $('input[name=store_order_pay_card_password]').val();
        	var store_order_pay_register_num = $('input[name=store_order_pay_register_num]').val();
        	var reserveform = document.reserveform;
        	
        	// 필수 동의 안했을 때
            if($("#chk1").is(":checked")){
            } else {
                alert("개인정보 제3자 제공 동의를 하셔야 결제예약이 가능합니다.")
                return false;
            }
            
            if($("#chk2").is(":checked")){
            } else { 
                alert("후원 유의사항을 확인하셔야 합니다.");
                return false;
            }
            
            // 동의 후 입력 확인
            if($("#chk1").is(":checked") && $("#chk2").is(":checked")){
            	// 배송지 - 새로 입력 확인
                if($('input:radio[id=inlineRadio1]').is(':checked')){
                	if (store_express_name1 == '') {
                        alert('신규 배송지에 받을사람을 입력하세요.'); 
                        setTimeout(function(){
                          $('input[name=store_express_name1]').focus();
                        }, 0);
                        return false;
                      } else if (store_express_phone1 == '') {
                        alert('신규 배송지에 휴대폰 번호를 입력하세요.');
                        setTimeout(function(){
                        	$('input[name=store_express_phone1]').focus();
                        }, 0);
                        return false;
                      } else if (store_express_postnum1 == '') {
                        alert('우편번호를 검색해서 주소를 입력하세요.');
                        setTimeout(function(){
                        	$('input[name=store_express_postnum1]').focus();
                        }, 0);
                        return false;
                      } else if (store_express_addr2_1 == '') {
                        alert('상세 주소를 입력하세요.');
                        setTimeout(function(){
                        	$('input[name=store_express_addr2_1]').focus();
                        }, 0);
                        return false;
                      }
                }else{
                	// 전부 동의했을 경우 결제 진행
                	var IMP = window.IMP;
            		IMP.init('imp86698144'); // iamport 식별코드
            		IMP.request_pay({
            			pg: 'html5_inicis',
            			/*
            				'kakao':카카오페이,
            				'html5_inicis':이니시스(웹표준결제)
            				'nice':나이스페이
            				'jtnet':제이티넷
            				'uplus':LG유플러스
            				'danal':다날
            				'payco':페이코
            				'syrup':시럽페이
            				'paypal':페이팔
            			*/
            			pay_method: 'card',
            			/*
            				'samsung':삼성페이,
            				'card':신용카드,
            				'trans':실시간계좌이체,
            				'vbank':가상계좌,
            				'phone':휴대폰소액결제
            			*/
            			merchant_uid: 'merchant_' + new Date().getTime(),
            			name: '${param.store_title}', //결제창에서 보여질 이름
            			
            			// 가격은 1000원으로 설정
            			amount: 1000,
//             			amount: '${param.total_price+param.express_fee}',
            			buyer_email: '${member.member_email}',
            			buyer_name: '${member.member_name}',
            			buyer_tel: '${member_member_phone}',
            			buyer_addr: '${member.member_addr} ${member.member_addr2}',
            			buyer_postcode: '${member.member_postnum}',
            			}, function (rsp) {
            				console.log(rsp);
//             					msg += '고유ID : ' + rsp.imp_uid;
//             					msg += '상점 거래ID : ' + rsp.merchant_uid;
//             					msg += '결제 금액 : ' + rsp.paid_amount;
//             					msg += '카드 승인번호 : ' + rsp.apply_num;

           						// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
           		                // 결제내역을 사용자에게 보여주기 위해 필요함.
         		        	$.ajax({
        						url : "verifyIamport/"+rsp.imp_uid,
        						type : "post",
         					}).done(function(data){
     							console.log(data);
     						// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
     					        if(rsp.paid_amount == data.response.amount){
     						       	$('input[name=store_order_pay_card_name]').attr('value',data.response.cardName);
     						       	$('input[name=store_order_pay_card_number]').attr('value',data.response.cardNumber);
     						       	$('input[name=store_order_pay_amount]').attr('value',data.response.amount);
          							$('#paymentForm').submit();
     					        } else {
     					        	alert("결제 실패");
     					       	}
         					});
            		});
                }
            	
        	}
        	}, 0);
        });
	
	// 체크되면 아코디언 닫기
		$("#checkAll").click(function(){
			if($("#checkAll").is(":checked")){
				var class_name = $('#collapseOne').attr('class');
				if(class_name == 'collapse show'){
		           	$('#accordionbtn').on('click', function(){});
		           	$('#accordionbtn').trigger('click');
				}
	        }
		});
		$("#chk2").click(function(){
			if($("#chk2").is(":checked")){
				var class_name = $('#collapseOne').attr('class');
				if(class_name == 'collapse show'){
		           	$('#accordionbtn').on('click', function(){});
		           	$('#accordionbtn').trigger('click');
				}
	        }
		});
	
	// 모달창
		function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);
	
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = $('<div>')
	        .css({
	            position: 'fixed',
	            zIndex: zIndex,
	            left: '0px',
	            top: '0px',
	            width: '100%',
	            height: '100%',
	            overflow: 'auto',
	            // 레이어 색갈은 여기서 바꾸면 됨
	            backgroundColor: 'rgba(0,0,0,0.4)'
	        })
	        .appendTo('body');
	
	    modal
	        .css({
	            position: 'fixed',
	            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	            // 시꺼먼 레이어 보다 한칸 위에 보이기
	            zIndex: zIndex + 1,
	
	            // div center 정렬
	            top: '50%',
	            left: '50%',
	            transform: 'translate(-50%, -50%)',
	            msTransform: 'translate(-50%, -50%)',
	            webkitTransform: 'translate(-50%, -50%)'
	        })
	        .show()
	        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	        .find('.modal_close_btn')
	        .on('click', function() {
	            bg.remove();
	            modal.hide();
	        });
		}
		
		$('#popup_open_btn').on('click', function() {
		    // 모달창 띄우기
		    modal('my_modal');
		});
		
</script>    
</body>
</html>