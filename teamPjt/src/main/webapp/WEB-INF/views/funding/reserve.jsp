<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 <!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
    .step_circle{
        display: table-cell;
        vertical-align: middle;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    .card {
        border-radius: 2px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }
    .order td, .order th {
        padding: 20px;
        vertical-align: middle;
        border-top: 1px solid black;
    }
    
    table td{
        text-align: right;
    }

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    
    .addressInfo_button_div::after{
		content:'';
		display:block;
		clear:both;
	}
	.addressInfo_input_div{
		padding:12px;
		text-align: left;
		display: none;
		line-height: 40px;
	}
	
	input[type="radio"] {
		zoom: 1.5;
	}
	label{
		cursor: pointer;
	}
</style>
<script>
    function handleOnInput(el, maxlength) {
        if(el.value.length > maxlength)  {
            el.value 
            = el.value.substr(0, maxlength);
        }
    }
	
</script>
<title>Insert title here</title>
</head>
<body>
<%-- 	<c:import url="/header.do"></c:import> --%>
	<%@include file ="../header.jsp" %>
    <main>
    	<%
			String[] check = request.getParameterValues("check");
			for (String t : check) {
				out.println(t);
				if(t.equals("1")){
					%>${param.p_num1}<%
				}
				if(t.equals("2")){
					%>${param.p_num2}<%
				}
				if(t.equals("3")){
					%>${param.p_num3}<%
				}
				
			}
			
		%>
		${param.addDonation}
    <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div><h3 style="text-align: center; font-weight: bold;">어머니 아버지, 이제 이 바닥을 떠나고 싶어요. 반려동물 캠핑의자</h3></div>
                <div class="wrap" style="margin: 30px 0px 10px auto;">
                    <div class="step" style="text-align: center; width: 280px; margin: 0 auto; font-weight: 600;">
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="color: #fff; border: none; background: #4E944F;">결제 예약</div>
                    </div>
                </div>
            </div>
        </div>
        <form action="orderform.do" method="post">
        <!-- 옵션 정보 -->
        <div class="row" style="margin-top: 30px;">
            <div class="col-xs-12" style="width: 100%;">
                <table style="margin: 0px auto; width: 100%; border-top: 1px solid black; border-bottom: 1px solid black; line-height: 2; vertical-align: middle;" class="table order">
                	<c:forEach var="check" items="${paramValues.check}">
                		<c:forEach var="list" items="${optionlist}">
                			<c:if test="${list.funding_option_idx eq check}">
			                	<tr>
			                        <th width="70%" style="border-top: 1px dashed gray;">
			                            <div style="min-height: 50px;">
			                            	<!-- 옵션 이름  -->
			                                <div style="color: #4E944F;">
			                                    ${list.funding_option_name}
			                                </div>
			                                <!-- 옵션 설명 -->
			                                <div style="color: gray; font-weight: lighter; font-size: 14px;">
			                                   ${list.funding_option_detail}
			                                </div>
			                                <input type="hidden" name="price" id="price" value="${list.funding_option_price}">
			                            </div>
			                        </th>
			                        <td style="border-top: 1px dashed gray;">
			                            <div>
			                            <c:if test="${check eq 1 }">
			                            	<input type="hidden" id="count" value="${param.p_num1}">
											수량: ${param.p_num1}개
			                            </c:if>
			                            <c:if test="${check eq 2 }">
			                            	<input type="hidden" id="count" value="${param.p_num2}">
											수량: ${param.p_num2}개
			                            </c:if>
			                            <c:if test="${check eq 3 }">
			                            	<input type="hidden" id="count" value="${param.p_num3}">
											수량: ${param.p_num3}개
			                            </c:if>
			                            </div>
			                        </td>
			                        <td style="border-top: 1px dashed gray;">
			                        	<!-- 펀딩 옵션별 금액 -->
				                        <div class="sum" id="sum"></div>
			                        </td>
			                    </tr>
                			</c:if>
                		</c:forEach>
                	</c:forEach>
				
                    <!-- 후원금 -->
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">
                            <div>추가 후원금</div>
                        </th>
                        <td style="border-top: 1px dashed gray;" colspan="2">
	                        <c:if test="${param.addDonation eq ''}">
	                        	<input type="hidden" id="addDonation" value="0">
	                        	<div></div>
	                        </c:if>
	                        <c:if test="${param.addDonation ne ''}">
	                        	<input type="hidden" id="addDonation" value="${param.addDonation}">
	                        	<div></div>
	                        </c:if>
                        </td>
                    </tr>
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">배송비</th>
                        <td style="border-top: 1px dashed gray;" colspan="2">
                        	<input type="hidden" id="expressFee" value="30000">
                        	<div></div>
                        </td>
                    </tr>
                    <tr class="thead-light">
                        <th scope="col" style="border-top: 1px solid gray;">최종 결제가</th>
                        <th scope="col" style="border-top: 1px solid gray; text-align: right;" colspan="2">
                        	<div id="sumTotal"></div>
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <!-- 구매자 정보 -->
            <div class="col-md-6" style="padding: 30px;">
                <table style="margin: 0px auto; width: 100%; line-height: 2; vertical-align: middle; background-color:#E9EFC0; border-radius: 3px; border:none; padding: 20px;" class="table table-borderless card">
                    <thead>
                      <tr>
                        <th scope="col" colspan="2">
                            <div style="font-size: 20pt;">구매자 정보</div>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
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
                      <tr>
                          <td colspan="2" style="padding-top: 0px">
                              <hr>
                            <div class="form-check" style="text-align: left;">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" style="zoom: 1.5;">
                                <label class="form-check-label" for="defaultCheck1" style="cursor:pointer; ">
                                  <span style="font-weight: bold;">(필수)</span> 펀딩 진행에 대한 새소식 및 결제 관련 안내를 받습니다.
                                </label>
                              </div>
                          </td>
                      </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- 배송지 정보 -->
            <div class="col-md-6" style="padding: 30px;">
                <div class="addressInfo_div" style="font-size: 20pt; font-weight: bold; padding: 20px 0px;">배송지 정보</div>
                <!-- 선택 버튼  (새로입력/기존주소) -->
                <div class="addressInfo_button_div">
	                <div class="form-group">
	                    <div class="form-check form-check-inline">
	                        <input class="form-check-input" type="radio" onclick="showAdress('1')" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
	                        <label class="form-check-label" for="inlineRadio1">새로 입력</label>
	                    </div>
	                    <div class="form-check form-check-inline">
	                        <input class="form-check-input" type="radio" onclick="showAdress('2')" name="inlineRadioOptions" id="inlineRadio2" value="option2">
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
                            	<input type="text" class="form-control" id="">
                          	</div>
                        </div>
                        <div class="form-group row">
                          	<label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">연락처</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" id="">
                          	</div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">주소</label>
                            <div class="col-sm-4">
                        	    <input type="number" class="form-control address1_input" id="" placeholder="우편번호">
                            </div>
                            <div class="col-sm-5">
                                <button type="submit" class="btn btn-primary address_search_btn" onclick="execution_daum_address()" style="background-color: #83BD75; border: none;">주소 찾기</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address2_input" id="" placeholder="기본 주소">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address3_input" id="" placeholder="상세 주소">
                            </div>
                        </div>
                	</div>
                	
                	<!-- 기존 주소 -->
                	<div class="addressInfo_input_div addressInfo_input_div_2">
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">이름</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" id="" value="${member.member_name}">
                          	</div>
                        </div>
                        <div class="form-group row">
                          	<label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">연락처</label>
                          	<div class="col-sm-9">
                            	<input type="text" class="form-control" id="" value="${member.member_phone}">
                          	</div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">주소</label>
                            <div class="col-sm-4">
                        	    <input type="number" class="form-control address1_input" id="" placeholder="우편번호">
                            </div>
                            <div class="col-sm-5">
                                <button type="submit" class="btn btn-primary address_search_btn" onclick="execution_daum_address()" style="background-color: #83BD75; border: none;">주소 찾기</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address2_input" id="" placeholder="기본 주소">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control address3_input" id="" placeholder="상세 주소">
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

        <div class="row">
            <!-- 결제 정보 -->
            <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">결제 정보</div>
            <div class="col-lg-8">
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">직접 입력</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">네이버 페이</label>
                    </div>
                </div>
                <hr>
                <div>
                    <form>
                        <div class="form-group">
                            <label for="formGroupExampleInput" style="font-weight: bold;">신용(체크)카드번호</label>
                            <div class="row">
                                <div class="col">
                                    <input type="number" oninput='handleOnInput(this, 4)' class="form-control">
                                </div>
                                <div class="col">
                                    <input type="password" class="form-control" maxlength="4">
                                </div>
                                <div class="col">
                                    <input type="password" class="form-control" maxlength="4">
                                </div>
                                <div class="col">
                                    <input type="number" oninput='handleOnInput(this, 4)' class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="" style="font-weight: bold;">유효기간</label>
                                <input type="text" class="form-control validdate" id="" placeholder="MM/YY" maxlength="5">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="" style="font-weight: bold;">카드 비밀번호</label>
                                <input type="password" class="form-control" id="" placeholder="앞 2자리" maxlength="2">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" style="font-weight: bold; margin-bottom: 0px;">생년월일 (주민번호 앞 6자리)</label>
                            <small id="" class="form-text text-muted" style="margin-top: 0px; margin-bottom: 10px;">무기명 법인카드는 사업자등록번호 10자리를 입력하세요.</small>
                            <input type="text" class="form-control" id="" maxlength="10">
                        </div>   
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div style="font-weight: 600;">[ 결제 예약시 유의사항 ]</div>
                <div style="padding: 10px; line-height: 2;">
                    <ul style="padding-left: 10px; list-style: circle;">
                        <li>
                            결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 한번 확인하세요
                        </li>
                        <li>
                            1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다.
                        </li>
                        <li>
                            결제 예약 이후, 결제 정보를 변경하려면 마이페이지 > 나의 펀딩의 결제 정보에서 결제 정보를 변경해주세요.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        </form>
        
        <!-- 동의 -->
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px; margin: 20px 0 auto;" class="col-md-12">약관 동의</div>
            </div>
            <div class="col-xs-12" style="width: 100%;">
                <table style="border: 1px solid lightgray;" cellpadding="20px" width="100%">
                    <thead>
                      <tr>
                        <th scope="col" colspan="2">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">전체 동의하기</label>
                            </div>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                <label class="custom-control-label" for="customCheck2">개인정보 제3자 제공 동의</label>
                            </div>
                        </td>
                        <td>
                            <a href="#" style="text-decoration: underline; color: gray;">보기</a>
                        </td>
                      </tr>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck3">
                                <label class="custom-control-label" for="customCheck3">책임 규정에 대한 동의</label>
                            </div>
                        </td>
                        <td>
                            <a href="#" style="text-decoration: underline; color: gray;">보기</a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        <div style="text-align: center; margin-top: 60px;">
            <button type="button" class="btn btn-success" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/reserve_complete.do'" style="height: 60px; width: 200px; font-size: 15pt; font-weight: bold;">결제 예약하기</button>
        </div>
    </div>
    </main>
<%--     <c:import url="/footer.do"></c:import> --%>
   	<%@include file ="../footer.jsp" %>
<script type="text/javascript">
	$(function(){
		// 옵션
		var item = document.querySelector('#price');
		var price = parseInt(item.getAttribute('value'));
		var count = item.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.value;
		var total = parseInt(price * count);
		//sum
		item.parentElement.parentElement.parentElement.lastElementChild.firstElementChild.textContent = total.formatNumber()+"원";
		
		var totalPrice = 0;
		
		totalPrice += total;
		
		// 후원금
		var item2 = document.querySelector('#addDonation');
		var addDonation = parseInt(item2.getAttribute('value'));
        if (addDonation == '') {
          addDonation = 0;
        }
        addDonation = parseInt(addDonation);
        item2.nextElementSibling.textContent = addDonation.formatNumber()+"원";
        totalPrice += addDonation;
		
        // 배송비
        var item3 = document.querySelector('#expressFee');
		var expressFee = parseInt(item3.getAttribute('value'));
        if (expressFee == '') {
        	expressFee = 0;
        }
        expressFee = parseInt(expressFee);
        item3.nextElementSibling.textContent = expressFee.formatNumber()+"원";
        totalPrice += expressFee;
        
        var sumTotal = document.querySelector('#sumTotal');
        sumTotal.textContent = totalPrice.formatNumber()+"원";
	});
	
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	
	
	/* 주소입력란 버튼 동작(숨김, 등장) */
	function showAdress(className){
		/* 컨텐츠 동작 */
			/* 모두 숨기기 */
			$(".addressInfo_input_div").css('display', 'none');
			/* 컨텐츠 보이기 */
			$(".addressInfo_input_div_" + className).css('display', 'block');		
		
	}
	
	
	/* 다음 주소 연동 */
	function execution_daum_address(){
	 		console.log("동작");
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
</script>    
</body>
</html>