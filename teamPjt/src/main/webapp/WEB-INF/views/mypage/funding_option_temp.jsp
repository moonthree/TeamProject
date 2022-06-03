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
<style>
	main {
        height: auto;
        min-height: 100%;
    }
    .step_circle{
        display: table-cell;
        vertical-align: middle;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
<script>
	// 숫자 자리 제한
	function handleOnInput(el, maxlength) {
	    if(el.value.length > maxlength)  {
	        el.value = el.value.substr(0, maxlength);
	    }
	}
	 
</script>
<title>Insert title here</title>
</head>
<body>

	<main>
    <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
           <%--  <input type="hidden" name="funding_idx" value="${read.funding_idx}">
            ${param.funding_idx} --%>
            	<!-- 펀딩 제목  -->
                <div><h3 style="text-align: center; font-weight: bold;">${param.funding_title }</h3></div>
                <div class="wrap" style="margin: 30px 0px 10px auto;">
                    <div class="step" style="text-align: center; width: 280px; margin: 0 auto; font-weight: 600;">
                        <div class="step_circle" style="color: #fff; border: none; background: #4E944F;">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">결제 예약</div>
                    </div>
                </div>
            </div>
        </div>
        <form name="order" id="orderform" action="option.do" method="post" class="orderform" style="width: 100%">
        <div class="row">
            <div class="" id="option" style="width: 90%; margin: 20px auto;">
            	<!-- 옵션 선택 -->
                <h5 style="font-weight: 600;">옵션 선택</h5>
                <p>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
                <!-- 옵션 박스 -->
                <c:if test="${param.optionList.length() > 0}">
                	<c:forEach var="item" items="${optionList}" varStatus="status">
                		<div class="option_select">
		                    <div class="custom-control custom-checkbox" style="border: 1px solid lightgray; border-radius: 5px; padding: 20px; padding-left: 60px; margin-bottom: 20px;">
		                        <input type="checkbox" name="check" onclick="javascript:option.checkItem();" class="custom-control-input" id="customCheck${status.index+1}" value="${status.index+1}">
		                        <label class="custom-control-label" for="customCheck${status.index+1}" style="cursor: pointer;">
		                        	<!-- 옵션 가격 -->
		                            <div class="price" style="font-weight: 600;">${item.funding_option_price}원 펀딩합니다.</div>
		                            <div class="detail" style="font-size: 14px; line-height: 2; color: gray;">
		                            	<!-- 옵션 제목 -->
		                               	${item.funding_option_name}<br>
		                               	<!-- 옵션 설명 -->
		                               	${item.funding_option_detail}<br>
		                                <!-- 옵션 재고 -->
		                                (${item.funding_option_stock}개 남음)
		                            </div>
		                        </label>
		                        <div>
			                    	<div class="optionprice"><input type="hidden" name="p_price${status.index+1}" id="p_price${status.index+1}" class="p_price" value="${item.funding_option_price}"></div>
			                        <div class="checked_area" style="margin-top: 10px; height: 60px;">
			                        	<div class="count" style="float: left; width: 180px;">
				                        	<div style="font-size: 13px; margin-bottom: 5px; color: gray;">수량 </div>
				                        	<div class="updown" style="cursor: pointer; width: 130px;">
				                        		<span onclick="javascript:option.changePNum(${status.index+1});">
				                        			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="down" viewBox="0 0 16 16">
													  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
													  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
													</svg>
				                        		</span>
				                        		<!-- 수량  -->
				                                <input type="number" name="p_num${status.index+1}" id="p_num${status.index+1}" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:option.changePNum(${status.index+1});" style="border: 1px solid gray; border-radius: 5px; padding-left: 10px; width: 80px;" autocomplete="off">
				                                <span onclick="javascript:option.changePNum(${status.index+1});">
				                                	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="up" viewBox="0 0 16 16">
													  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
													  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
													</svg>
				                                </span>
				                        	</div>
			
			                        	</div>
			                        	<div class="totalPrice" style="float: left;">
					                        <div style="font-size: 13px; margin-bottom: 5px; color: gray;">금액</div>
					                    	<div class="sum">${item.funding_option_price}원</div>
			                        	</div>
			                        </div>
		                        </div>
		                    </div>
		                </div>
                	</c:forEach>
                </c:if>
            <!-- 후원금 -->
            <div style="width: 90%; margin: 20px auto;">
                <h5 style="font-weight: 600; float: left; text-align: left; width: 200px; height: 100px;">후원금 (선택)</h5>
                <div>
                	<p>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
                	<p>
                		<div style="display: inline">
                  			<input type="number" id="addDonation" name="addDonation" onkeyup="javascript:option.changeDonation();"  oninput='handleOnInput(this, 8)' placeholder="0" value="" autocomplete="off">
                		</div>원을 추가로 후원합니다.
                	</p>
                </div>
            </div>
            </div>
        </div>
        
        <!-- 선택 금액, 버튼 -->
        <div class="row">
            <div style="margin: 50px auto; text-align: center;">
                <div style="font-weight: bold; font-size: 20px;">
                	<input type="hidden" name="sum_p_price" value="">
					어머니 아버지, 이제 이 바닥을 떠나고 싶어요. 반려동물 캠핑의자에 <div id="sum_p_price" style="color:#83BD75; text-decoration: underline; display: inline">0</div>원을 펀딩합니다.
                </div>
                <br>
                <div>
                    <button type="button"  class="btn btn-secondary" style="background-color: #83BD75; border: none; width: 150px; height: 50px; font-weight: bold;">다음 단계로 ></button>
                </div>
            </div>
        </div>
    	</form>
    </div>
    </main>
  
    
<script>
	let option = {
	    totalCount: 0, 
	    totalPrice: 0,
	    sumTotal: 0,
	    
	    // 옵션 재계산
	    reCalc: function(){
	        this.totalCount = 0;
	        this.totalPrice = 0;
	        this.sumTotal = 0;
	        //p_num : 수량
	        document.querySelectorAll(".p_num").forEach(function (item) {
	            if(item.parentElement.parentElement.parentElement.parentElement.parentElement.firstElementChild.checked == true){
	            	var count = parseInt(item.getAttribute('value'));
	                this.totalCount += count;
	                var price = item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.value;
	                this.totalPrice += (count * price);
	            }
	            var addDonation = $('#addDonation').val();
	            if (addDonation == '') {
	              addDonation = 0;
	            }
	            var addDonation = parseInt(addDonation);

	            this.sumTotal = this.totalPrice + addDonation;
	        }, this);
	    },

	    //화면 업데이트
	    updateUI: function () {
	    	document.querySelector('[name="sum_p_price"]').value = this.sumTotal;
	        document.querySelector('#sum_p_price').textContent = this.sumTotal.formatNumber();
	    },
	    
	    //개별 수량 변경
	    changePNum: function (pos) {
	        var item = document.querySelector('input[name=p_num'+pos+']');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        
	        if (parseInt(newval) < 1 || parseInt(newval) > 1300) { return false; }

	        item.setAttribute('value', newval);
	        item.value = newval;
	        
            var price = item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.value;
	        //sum
	        item.parentElement.parentElement.nextElementSibling.lastElementChild.textContent = (newval * price).formatNumber()+"원";

	        this.reCalc();
	        this.updateUI();
	    },
	    checkItem: function () {
	        this.reCalc();
	        this.updateUI();
	    },
	    
	    
      // 후원금
	    changeDonation: function () {
	    	
	    	var addDonation = $('#addDonation').val();
            if (addDonation == "") {
              addDonation = 0;
            }
            
	        this.reCalc();
	        this.updateUI();
	    },
	}

	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
</script>
</body>
</html>