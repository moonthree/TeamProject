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
<link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_option.css">
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
<c:import url="/header.do"></c:import>
	<main>
    <!-- 펀딩 제목  -->
	<div><h3>${read.funding_title }</h3></div>
    <div class="container" style="margin-bottom: 6%;">
        <form name="order" id="orderform" action="option.do" method="post" class="orderform">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
            	<input type="hidden" name="funding_title" value="${read.funding_title}">
                <div class="wrap" style="margin: 30px 0px 20px auto;">
                    <div class="step">
                        <div class="step_circle select_circle">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle none_select_circle">결제 예약</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle none_select_circle">예약 완료</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
	        <input type="hidden" name="funding_idx" value="${read.funding_idx}">
            <div class="" id="option" style="width: 90%; margin: 20px auto;">
            	<!-- 옵션 선택 -->
                <h5 style="font-weight: 600;">옵션 선택</h5>
                <p>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
                <!-- 옵션 박스 -->
                <c:if test="${optionlist.size() > 0}">
                	<c:forEach var="item" items="${optionlist}">
                		<div class="option_select" id="option_select">
                				<!-- 품절 아닐 때 -->
                				<c:if test="${item.funding_option_stock > 0}">
                					<div class="custom-control custom-checkbox">
				                        <input type="checkbox" name="check" onclick="javascript:option.checkItem();" class="custom-control-input" id="customCheck${item.funding_option_idx}" value="${item.funding_option_idx}">
				                        <label class="custom-control-label" for="customCheck${item.funding_option_idx}" style="cursor: pointer; width: 100%;">
				                        	<!-- 옵션 가격 -->
				                            <div class="price" style="font-weight: 600;">
				                            	<fmt:formatNumber value="${item.funding_option_price}" type="number" />원 펀딩합니다.
				                            </div>
				                            <div class="detail" style="font-size: 14px; line-height: 2; color: gray;">
				                            	<!-- 옵션 제목 -->
				                               	<div>
				                               		<span style="color: black">${item.funding_option_name}</span>
					                                <!-- 옵션 재고 -->
					                                <input type="hidden" name="stock" id="stock" value="${item.funding_option_stock}">
					                               	<span style="padding-left: 10px; font-size: 12px;">(${item.funding_option_stock}개 남음)</span>
				                               	</div>
				                               	<!-- 옵션 설명 -->
				                               	<div style="font-size: 12px">${item.funding_option_detail}</div>
				                            </div>
				                        </label>
				                        <div>
					                    	<div class="optionprice"><input type="hidden" name="p_price${item.funding_option_idx}" id="p_price${item.funding_option_idx}" class="p_price" value="${item.funding_option_price}"></div>
					                        <div class="checked_area" style="margin-top: 10px; height: 60px; display: none">
					                        	<div class="count" style="float: left; width: 180px;">
						                        	<div style="font-size: 13px; margin-bottom: 5px; color: gray;">수량 </div>
						                        	<p class="updown" style="cursor: pointer; width: 170px;">
						                        		<button type="button" onclick="javascript:option.changePNum(${item.funding_option_idx});" class="stockbtn">
						                        			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="down" viewBox="0 0 16 16">
															  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
															  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
															</svg>
						                        		</button>
						                        		<!-- 수량  -->
						                        		<input type="hidden" name="stock" id="stock" value="${item.funding_option_stock}">
						                                <input type="number" name="p_num${item.funding_option_idx}" id="p_num${item.funding_option_idx}" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:option.changePNum(${item.funding_option_idx});" style="border: 1px solid gray; border-radius: 5px; padding-left: 10px; width: 80px;" autocomplete="off">
						                                <button type="button"  onclick="javascript:option.changePNum(${item.funding_option_idx});" class="stockbtn">
						                                	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="up" viewBox="0 0 16 16">
															  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
															  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
															</svg>
						                                </button>
						                        	</p>
						                        	
					                        	</div>
					                        	<div class="totalPrice" style="float: left;">
							                        <div style="font-size: 13px; margin-bottom: 5px; color: gray;">금액</div>
							                    	<div class="sum" style="line-height: 2"><fmt:formatNumber value="${item.funding_option_price}" type="number" />원</div>
					                        	</div>
					                        </div>
				                        </div>
				                    </div> <!-- custom-checkbox end -->
                				</c:if>
                				<!-- 품절일 경우 -->
                				<c:if test="${item.funding_option_stock < 1}">
                					<div class="custom-control custom-checkbox">
				                        <input type="checkbox" name="check" onclick="javascript:option.checkItem();" class="custom-control-input" id="customCheck${item.funding_option_idx}" value="${item.funding_option_idx}" disabled="disabled">
				                        <label class="custom-control-label" for="customCheck${item.funding_option_idx}" style="cursor: pointer; width: 100%; color: #9B9B9B">
				                        	<!-- 옵션 가격 -->
				                            <div class="price" style="font-weight: 600;">
				                            	<fmt:formatNumber value="${item.funding_option_price}" type="number" />원 펀딩합니다.
				                            </div>
				                            <div class="detail" style="font-size: 14px; line-height: 2; color: #9B9B9B">
				                            	<!-- 옵션 제목 -->
				                               	<div>
				                               		<span>${item.funding_option_name}</span>
					                                <!-- 옵션 재고 -->
					                                <input type="hidden" name="stock" id="stock" value="${item.funding_option_stock}">
					                               	<span style="padding-left: 10px; font-size: 12px; color: red;">(마감)</span>
				                               	</div>
				                               	<!-- 옵션 설명 -->
				                               	<div style="font-size: 12px">${item.funding_option_detail}</div>
				                            </div>
				                        </label>
				                        <div>
					                    	<div class="optionprice"><input type="hidden" name="p_price${item.funding_option_idx}" id="p_price${item.funding_option_idx}" class="p_price" value="${item.funding_option_price}"></div>
					                        <div class="checked_area" style="margin-top: 10px; height: 60px; display: none">
					                        	<div class="count" style="float: left; width: 180px;">
						                        	<div class="updown" style="cursor: pointer; width: 130px;">
						                        		<!-- 수량  -->
						                                <input type="hidden" name="p_num${item.funding_option_idx}" id="p_num${item.funding_option_idx}" class="p_num" value="0">
						                        	</div>
					                        	</div>
					                        </div>
				                        </div>
				                    </div> <!-- custom-checkbox end -->
                				</c:if>
		                </div>
                	</c:forEach>
                </c:if>
            <!-- 후원금 -->
            <div style="width: 90%; margin-top: 80px;">
                <h5 style="font-weight: 600; float: left; text-align: left; width: 200px; height: 130px;">후원금 (선택)</h5>
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
        <hr style="width: 90%">
        <!-- 선택 금액, 버튼 -->
        <div class="row">
            <div style="margin: 50px auto; text-align: center;">
                <div style="font-weight: bold; font-size: 20px;">
                	<input type="hidden" name="sum_p_price" value="">
					${read.funding_title}에 <div id="sum_p_price" style="color:#fa6462; text-decoration: underline; display: inline">0</div>원을 펀딩합니다.
                </div>
                <br>
                <div>
<!--                     <button type="button" onclick="document.getElementById('orderform').submit();" class="btn btn-secondary" style="background-color: #83BD75; border: none; width: 150px; height: 50px; font-weight: bold;">다음 단계로 ></button> -->
                    <button type="button" onclick="javascript:checkone();" class="btn btn-secondary" style="background-color: #fa6462; border: none; width: 150px; height: 50px; font-weight: bold;">다음 단계로 ></button>
                </div>
            </div>
        </div>
    	</form>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
    
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
	            	var count = item.getAttribute('value');
	            	if(count == ''){
	            		count = 0;
	            	}else{
	            		count = parseInt(count);
	            	}
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
	    	if(this.sumTotal == ''){
	    		document.querySelector('#sum_p_price').textContent = 0;
	    	}else{
		        document.querySelector('#sum_p_price').textContent = this.sumTotal.formatNumber();
	    	}
	    },
	    
	    //개별 수량 변경
	    changePNum: function (pos) {
	        var item = document.querySelector('input[name=p_num'+pos+']');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        var stock = item.previousElementSibling.value;
	        if(parseInt(newval) > stock){
	        	alert('잔여수량 내에서 수량을 선택해주세요.');
	        	item.setAttribute('value', 1);
	        	item.value = 1;
	        	newval = 1;
	        }if(parseInt(newval) == 0){
	        	alert('1개 이하로 수량을 선택할 수 없습니다.');
	        	item.setAttribute('value', 1);
	        	item.value = 1;
	        	newval = 1;
	        }else if(parseInt(newval) < 1 || parseInt(newval) > stock){
	        	return false;
	        }else{
	        	item.setAttribute('value', newval);
	        	item.value = newval;
	        }
	        
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
	
	// 체크박스 - 색 변화
	$('input[name="check"]').change(function() {
	    var value = $(this).val();
	    var checked = $(this).prop('checked');
	    var $option = $(this).parent().parent();            
	 
	    if(checked)
	        $option.css('background-color', '#ffedf1');
	    else
	        $option.css('background-color', '#f6f6f6');
	});
	
	// 체크박스 - 수량 금액
	$('input[name="check"]').change(function() {
	    var value = $(this).val();
	    var checked = $(this).prop('checked');
	    var $checked_area = $(this).next().next().children().first().next(); // checked_area    
	    if(checked){
	        $checked_area.css('display', 'block');
	    }
	    else
	        $checked_area.css('display', 'none');
	});
	
	// 체크박스 체크 validate (체크박스 유효성 검증)
    function checkone (){ 
        var arr_form = document.getElementsByName('check'); 
        var num = 0; 
        for(var i=0; i<arr_form.length; i++){ 
            if(arr_form[i].checked){ 
                num++; 
            } 
        } 
        if(!num){ 
            alert('최소 1개 이상의 옵션을 선택해주세요.'); 
            return false; 
        }else{
        	document.getElementById('orderform').submit();
        }
    } 
	
</script>
</body>
</html>