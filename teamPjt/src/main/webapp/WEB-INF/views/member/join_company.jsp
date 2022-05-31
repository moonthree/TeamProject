<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- //git 넘기기용 -->
 <!-- //git 넘기기용 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>  -->
        
        
        
  <!--    <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
       
<style type="text/css">
/* 모달 */
	#my_modal{
        display: none;
        width: 500px;
	    height: 850px;
	    line-height: 2;
	    padding: 20px 30px;
	    background-color: #fefefe;
	    border: 1px solid #888;
	    border-radius: 3px;
	     overflow: auto;
	    overflow-x: hidden;
    }
    
    #my_modal2{
        display: none;
        width: 700px;
	    height: 850px;
	    line-height: 2;
	    padding: 20px 30px;
	    background-color: #fefefe;
	    border: 1px solid #888;
	    border-radius: 3px;
	     overflow: auto;
	    overflow-x: hidden;
    }

    #my_modal .modal_close_btn  {
        position: relative;
	    bottom: 20px;
	    right: 40px;
	    text-decoration-line: none;
	    cursor: pointer;
	    font-size: 18px;
	    font-weight: 600;
	    color: #f24f49;
    }
     #my_modal2 .modal_close_btn  {
        position: relative;
	    bottom: 20px;
	    right: 40px;
	    text-decoration-line: none;
	    cursor: pointer;
	    font-size: 18px;
	    font-weight: 600;
	    color: #f24f49;
    }

</style>
<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->

    <script type="text/javascript">
    var emailcheck = false;
    
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	       
	    });
	    function update_email(){
	    	
	    	emailcheck = false;
	    }
        
        function checkID() {
			
			var email = $("input[name=member_email]").val();
			var regExp = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
			  // 검증에 사용할 정규식 변수 regExp에 저장

			  if (email.match(regExp) != null) {
		 			$.ajax({
						url:"check.do",
						type:"post",
						data:"email="+email,
						success:function(data){
							if(data >= 1){
								
								alert('중복 아이디 존재합니다.');
								$("#join_bnt").attr("disabled", "disabled"); 
								
								
							}
							else{
								$("#join_bnt").removeAttr("disabled"); 
							
								alert('사용가능한 아이디 입니다.');
								emailcheck = true;
							}
						},
						error:function(){	
							alert('오류 발생');
						}
					}); 
			  }
			  else {
			    alert('이메일 형식에 맞지 않습니다.');
			  }
			
		
        }
   var passwordCheck = false;
        <!-- 비밀번호 확인 스크립트-->
	$(function (){
		$("#alert-warning").hide(); 
		$("#alert-success").hide(); 
    	$("#alert-danger").hide(); 
    	$("#alert-dangerPhone").hide();
    	
    	$("input[name=member_password]").keyup(function(){
	    	var pw = $("input[name=member_password]").val();
	    	var num = pw.search(/[0-9]/g);
	    	var eng = pw.search(/[a-z]/ig);
	    	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	    	if(pw.length < 8 || pw.length > 16){
		    	$("#alert-warning").show();
		    	$("#join_bnt").removeAttr("disabled");
	    	}else if(pw.search(/\s/) != -1){
		    	$("#alert-warning").show(); 
		    	$("#join_bnt").removeAttr("disabled");
	    	}else if(num < 0 || eng < 0 || spe < 0 ){
		    	$("#alert-warning").show(); 
		    	$("#join_bnt").removeAttr("disabled");
	    	}else {
	    		$("#alert-warning").hide();
		    	return true;
	    	}
    	});

    	
    	$("input[name=member_password2]").keyup(function(){ 
    		
    		
    		var pwd1=$("input[name=member_password]").val(); 
    		var pwd2=$("input[name=member_password2]").val();
    		if(pwd1 != "" || pwd2 != ""){ 
    			if(pwd1 == pwd2){ 
    			$("#alert-success").show(); 
    			$("#alert-danger").hide();
    			$("#join_bnt").removeAttr("disabled"); 
    			}
    			else{ 
    			$("#alert-success").hide(); 
    			$("#alert-danger").show(); 
    			$("#join_bnt").attr("disabled", "disabled"); 
    			passwordCheck = true;
    			}
    		}
    	});
 
	});
	
	
	
	function checkAll() {
		var phoneCheck = true;
		if(emailcheck == false){
			alert('이메일 체크 후 제출해주세요');
		}
		
		
		else{
			
			if(passwordCheck == false){
				alert('비밀번호 체크 후 제출해주세요');
			}
			
			else{
			var phne = $("input[name=phone1]");
			var phonecc = /[0-9]{4}$/;
			for(var z = 0; z<phne.length; z++){
				
				var pmath  = phne[z].value;
				if(pmath.match(phonecc) == null){
					phoneCheck = false;
				}else{
					if(Number(pmath) > 9999){
						phoneCheck = false;
					}
					
				}
				
			}
			
			
			
			var form_control = $("#mem_frm input.form-control");
			var flag = true;
			for(var i=0; i<form_control.length; i++){	
				
				 if("" == $(form_control[i]).val() || null == $(form_control[i]).val()){

					flag = false;
					}  
			}
			if(flag == false){
					alert("입력하지 않은 양식이 존재합니다.");
				}
			
			else{
				if(phoneCheck == false ){
					alert('전화번호 형식 체크 후 제출해주세요');
				}
				else{
					
					if($("#exampleCheck1").is(':checked') == true && $("#exampleCheck2").is(':checked') == true){
						//console.log("다넘어옴")
						document.querySelector('#mem_frm').submit();
					}else{
						alert('모든 체크박스 선택후 제출해주세요');
					}
				}
				 
			}
		 }
		
	}
}
	
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
               
               
               $("[name=member_postnum]").val(data.zonecode);
               $("[name=member_addr]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }
	
	// 최대 길이 제한
	function handleOnInput(el, maxlength) {
        if(el.value.length > maxlength)  {
            el.value 
            = el.value.substr(0, maxlength);
        }
    }
	
	// 사업자 등록번호
	function mobile_keyup(obj){
	    let mobile_len=obj.value.length;
	    if(event.keyCode==10){
	        obj.value=obj.value.slice(0,mobile_len); 
	        return 0; 
	    }else if (mobile_len==3 || mobile_len==6){
	        obj.value += '-';
	    }
	}

</script>
    
<style>
	main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
    button{
        margin-top: 10px;
    }
    .form-group label{
        border-left: 3px solid gray;
        padding-left: 10px;
        margin-top: 10px;
    }
    .form-check label{
        border-left: 0px;
        padding-left: 0px;
        margin-top: 0px;
    }
    .box{
	    width: 125px;
	    height: 125px; 
	    border-radius: 70%;
	    overflow: hidden;
    }
    .profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
	}
    
</style>
<title>Insert title here</title>
</head><body>

	<% request.setCharacterEncoding("UTF-8");%>
	<c:import url="/header.do"></c:import>
	
	<main>
    <div class="container" style="text-align: center; margin-top: 6%; margin-bottom: 6%;">
        <div class="row" style="width: 400px; margin: 0px auto;">
            <div class="col-sm-12" style="text-align: left;">
                <div>
                
                <h3 style="margin-bottom: 50px; font-weight: 600; text-align: center;">
                 <c:if test="${kakaoVo == null}">회원가입</c:if>
               <c:if test="${kakaoVo != null}">카카오로 회원가입</c:if>
                </h3>
                </div>
                
                
                <!-- 자기자신 페이지로 post 방식으로 회원가입 요청 -->
                <form id="mem_frm" name="mem_frm" action="join_company.do" method="post" accept-charset="utf-8">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">이름</label>
                        <input  name="member_name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름 입력"
                        
                        <c:if test="${kakaoVo != null}">
                            value = "${kakaoVo.member_name}"
                            </c:if>
                        >
                    </div>
                    <!-- http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg -->

                     <div class="form-group">
                        <label for="exampleInputPassword1">프로필</label>
                         <div class="form-inline box ">
                         <c:if test="${kakaoVo == null}">
                        	<img src="http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg" class="rounded float-left profile" alt="...">
                         	<input type="hidden" name="member_photo">
                          </c:if>
                          
                          <c:if test="${kakaoVo != null}">
                          <img src="${kakaoVo.member_photo}" class="rounded float-left profile" alt="...">
                          <input type="hidden" name="member_photo" value="${kakaoVo.member_photo}">
                          </c:if>
                         </div>
                    </div>
                 
 				

                    <div class="form-group">
                        <label for="exampleFormControlInput1">이메일</label>
                        <div class="form-inline">
                            <input onchange="update_email()" name="member_email" type="text" class="form-control" id="exampleFormControlInput_email" placeholder="이메일 계정" style="width: 68%;"
                            <c:if test="${kakaoVo != null}">
                            value = "${kakaoVo.member_email}"
                            </c:if>
                            > 
                            &nbsp;<input type="button" class="btn btn-secondary" value="중복 확인" onclick="checkID()" style="width: 30%;">
                        </div>
                    </div>
                    
                    <c:if test="${kakaoVo == null}">
                    <div class="form-group">
                        <label for="exampleInputPassword1">비밀번호</label>
                        <input  name="member_password"  type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호" style="margin-bottom: 10px;">
                        <div class="alert alert-warning" id="alert-warning">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
                        <input  name="member_password2" type="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호 확인">
                    </div>
                    <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지않습니다.</div>

                    </c:if>
                    
                    <div class="form-group"> 
                     <label for="exampleFormControlInput1">주소</label>
                    
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="member_postnum" id="addr1" type="text" readonly="readonly" >
						    <button type="button" class="btn btn-secondary" onclick="execPostCode();"><i class="fa fa-search"></i>주소 찾기</button>                               
						</div>
						<div class="form-group">
						    <input name="member_addr" class="form-control" style="top: 5px;" placeholder="도로명 주소"  id="addr2" type="text" readonly="readonly" />
						</div>
						<div class="form-group">
						
						    <input name="member_addr2" class="form-control"  placeholder="상세주소" id="addr3" type="text"  />
					</div>
                    
                    
                    <div class="form-group">
                        <label for="exampleFormControlInput1">연락처</label>
                        <div class="form-inline">
                        <!-- 일단 여기 ㅊ통합해서 구현 후 select로 변환 해야함 -->
                            <select name="phone1" class="custom-select" style="width: 30%;">
                                <option selected>010</option>
                                <option value="011">011</option>
                                <option value="017">017</option>
                            </select> 
                            &nbsp;-&nbsp;<input name="phone1" type="number" oninput='handleOnInput(this, 4)' class="form-control" id="exampleFormControlInput3" style="width: 30%;">
                            &nbsp;-&nbsp;<input  name="phone1" type="number" oninput='handleOnInput(this, 4)' class="form-control" id="exampleFormControlInput4" style="width: 30%;">
                         
                        </div>
                    </div>
                     <div class="form-group">
                       <label for="exampleFormControlInput1">사업자명(회사명)</label>
                       <input name="member_business_name" type="text" class="form-control" id="exampleFormControlInput3" style="width: 80%;">                
                    </div>
                      <div class="form-group">
                      <label for="exampleFormControlInput1">사업자 등록번호</label>
                      <input type="text" onkeyup="mobile_keyup(this)" class="form-control m-input telCheckSize" name="member_business_num" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="12"
                                    aria-label="Default" aria-describedby="inputGroup-sizing-default">
                    </div>
                 
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Petdding 이용 약관 동의</label>
                        <div id="my_modal" style="text-align: left">
							<div style="font-weight: bold; font-size: 22px;">Petdding 이용 약관 동의</div>
							    <hr>
								petting(주)의 펀딩 · 스토어 서비스 서포터 이용약관을 규정합니다.<br>

								제1장 펀딩 서비스<br>
								제2장 스토어 서비스<br>
								부칙<br>
								제1장 펀딩 서비스<br>
								제1조 (목적)<br>
								본 장의 약관은 petting 주식회사(이하 "회사")와 회사가 제공하는 리워드형 크라우드펀딩 중개 서비스를 이용하는 서포터 간의 서비스 이용에 관한 권리·의무 관련 사항을 정함을 그 목적으로 합니다.<br>
								
								제2조 (정의)<br>
								본 장에서 사용하는 용어의 정의는 다음 각 호와 같습니다.<br>
								<hr>
								
								* 서비스 : 회원가입약관에 따른 회원이 전자적 시스템에 접속하여 홈페이지에서 온라인상의 거래 등을 할 수 있게 본 약관에 따라 회사가 제공하는 리워드형 크라우드펀딩 중개서비스를 말합니다.<br>
								* 홈페이지 : 본 약관에 따라 회사가 제공하는 서비스가 구현되는 온라인상의 웹페이지(https://www.)를 말합니다.<br>
								* 메이커 : 회사와 별도의 이용계약을 체결하고 홈페이지에서 펀딩 서비스 메이커 이용약관에 따른 프로젝트를 개설하여 서포터들로부터 펀딩을 받으려는 자를 말합니다.<br>
								* 서포터 : 회사의 회원가입약관에 따른 회원 중에서 메이커가 개설한 프로젝트에 펀딩을 하려는 자를 말합니다.<br>
								* 펀딩 : 서포터가 메이커에게 일정한 자금을 제공하는 부담을 지고 메이커가 약속한 유형의 제품 또는 무형의 서비스를 제공받는 행위를 의미합니다.<br>
								* 성공 : 펀딩기간의 종료시점을 기준으로 서포터의 펀딩 신청에 따라 모집된 결제예약금 합계액이 메이커가 설정한 목표 금액 이상인 경우를 의미합니다.<br>
								* 실패 : 펀딩기간의 종료시점을 기준으로 서포터의 펀딩 신청에 따라 모집된 결제예약금 합계액이 메이커가 설정한 목표 금액 미만인 경우를 의미합니다.<br>
								* 앵콜 펀딩: 성공한 펀딩 프로젝트의 리워드와 동일한 리워드를 대상으로 다시 펀딩하는 프로젝트를 말합니다. 단, 이전에 성공한 펀딩 프로젝트의 리워드와 동일하지 않은 리워드가 포함되어 구성되는 경우에는 본 약관 및 펀딩 심사 정책 등에서 규정한 펀딩 요건을 충족하여야 합니다.<br>
								* 글로벌 펀딩 : 해외에서 유통되었던 제품을 국내에 공식 유통하기 위한 목적으로 자금을 모으는 펀딩 프로젝트를 말합니다.<br>
								* 리워드 : 메이커가 펀딩과 관련하여 서포터로부터 자금을 받으면서 서포터에게 제공하기로 약속한 유형의 제품 또는 무형의 서비스를 의미합니다.<br>
								* 프로젝트 : 메이커가 서포터에게 리워드 제공을 약속하고 펀딩을 통해 자금을 모으기 위하여 회사의 승인을 받아 회사의 홈페이지에 개설한 페이지 및 이를 통해 서포터에게 약속한 내용을 의미합니다.<br>
								* 펀딩의 신청 : 서포터가 프로젝트의 펀딩 기간 내에 회사가 정한 방법에 따라 펀딩의 의사표시를 하는 것을 말합니다.<br>
								* 펀딩의 취소 : 서포터가 프로젝트의 펀딩기간 내에 펀딩의 의사표시를 철회하는 것을 말합니다.<br>
								* 펀딩 달성률 : 서포터가 목표한 금액을 기준으로 펀딩의 신청 접수가 완료된 결제예약금이 차지하는 비율을 말합니다.<br>
								* 결제예약금 : 서포터가 펀딩의 신청에 따라 결제를 예약한 금액을 의미합니다.<br>
								* 결제 취소 : 서포터가 프로젝트 종료 후 리워드의 발송 또는 제공 전까지 회사가 정한 특별한 사유가 있는 경우에 한하여 카드결제 등의 결제 취소를 요청함으로써 펀딩의 의사표시를 철회하는 것을 말합니다.<br>
								* 펀딩금 : 프로젝트 종료 시점에 모집된 결제예약금 중 결제 기간(프로젝트 종료일로부터 4영업일) 종료 시 결제절차가 완료된 금원을 의미합니다<br>
								<hr>
								<div style="text-align: right ;">
							    <a class="modal_close_btn">확인</a>
							    </div>
							</div>
                    	 <a href="javascript:void(0)"  id="popup_open_btn11" style="position: absolute; right: 0px; text-decoration: underline;">내용보기</a>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck2">
                        <label class="form-check-label" for="exampleCheck2">개인정보 수집, 이용 동의</label>
                        <div id="my_modal2" style="text-align: left">
							 <div style="font-weight: bold; font-size: 22px;">개인정보 제3자 제공 동의</div>
<pre style="font-family: 바탕체;">petting(주)(이하 “회사")가 제공하는 서비스에 회원가입 신청하시는 분께 수집하는 
개인정보의 항목, 이용 목적, 보유 및 이용 기간을 안내 드리오니 확인 후 
동의하여 주시기 바랍니다.

1. 수집하는 개인정보
회사는 서비스 가입 및 이용 등을 위해 아래와 같은 개인정보를 수집합니다.							
공통 회원 서비스
* 필수 *
이름, 닉네임, ID(이메일 주소 / SNS 연동정보),
비밀번호, 기기 정보(IP, 모바일 광고식별자)
 
* 선택 *
휴대전화 번호, 프로필 사진, 회사 및/ 학교 정보, 관심사
펀딩하기 서비스(서포터)
주문자 정보(이름, 이메일 주소, 휴대전화 번호, 
본인인증정보(DI)), 리워드 수취인 정보(이름, 휴대전화 번호, 주소)

펀딩하기 서비스(메이커)
* 개인 메이커 *
대표자 정보(이름, 이메일 주소, 휴대전화 번호, 본인인증정보(DI))
관리자와 대표자가 다른 경우 관리자 정보(이름, 이메일 주소, 휴대전화 번호)
정산대금 입금 계좌정보(은행명, 예금주명, 계좌번호), 
뒷자리 마스킹된 신분증 사본(생년월일, 주소)

* 개인사업자 메이커 / 법인사업자 메이커*
대표자 정보(이름, 이메일 주소, 휴대전화 번호, 
본인인증정보(DI), 생년월일, 사업장 소재지, 성별), 
공동대표인 경우 다른 공동대표자 정보(이름, 이메일 주소, 휴대전화 번호)
관리자와 대표자가 다른 경우 관리자 정보(이름, 이메일 주소, 휴대전화 번호)
정산대금 입금 계좌정보(은행명, 예금주명, 계좌번호)
구매하기 서비스 (서포터)
주문자 정보(이름, 이메일 주소, 휴대전화 번호, 본인인증정보(DI)),
상품 수취인 정보(이름, 휴대전화 번호, 주소)
구매하기 서비스(메이커)

* 개인사업자 메이커 / 법인사업자 메이커 *
대표자 정보(이름, 이메일 주소, 휴대전화 번호, 본인인증정보(DI), 생년월일, 사업장 소재지),
공동대표인 경우 다른 공동대표자 정보(이름, 이메일 주소, 휴대전화 번호)
관리자와 대표자가 다른 경우 관리자 정보(이름, 이메일 주소, 휴대전화 번호)
정산대금 입금 계좌정보(은행명, 예금주명, 계좌번호)
간편결제 등록, 결제 및 결제 예약
카드 번호, 카드 유효기간, 카드 비밀번호2자리, 생년월일(또는 사업자등록번호), 간편결제 비밀번호
고객센터 상담
회원 정보, 서비스 이용 내역
서포터클럽 멤버십
휴대전화 번호
간편결제 등록, 결제 및 결제 예약
카드 번호, 카드 유효기간, 카드 비밀번호2자리, 생년월일(또는 사업자등록번호), 간편결제 비밀번호
고객센터 상담
회원 정보, 서비스 이용 내역 </pre>
								
								<hr>
								<br>
								2. 개인정보 이용 목적
								홈페이지 회원관리: 회원제 서비스 이용 등에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 고지사항 전달, 상담처리 등
								회사가 제공하는 서비스 이용
								설문조사와 이벤트를 위한 이용
								컨텐츠 및 회원 맞춤형 서비스 제공, 서비스 구매 및 요금결제, 금융거래 본인인증 및 금융 서비스, 상품 주문에 따른 배송 서비스
								신규서비스(콘텐츠) 개발 및 특화, 이벤트 등 광고성 정보 전달, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계
								금융사고 조사, 기타 법령상 의무이행 등
								<hr>
								<br>
								3. 개인정보 보유 및 이용 기간
								이용자는 회원가입시 개인정보의 수집·이용 및 제공에 대해 동의한 내용은 언제든지 회원탈퇴 등의 방법을 통해 철회하실 수 있습니다. 또한, 수집 및 이용목적이 달성되거나 동의를 얻은 개인정보의 보유·이용 기간이 종료한 경우 지체 없이 파기하는 것을 원칙으로 합니다. 다만, 자본시장과 금융투자업에 관한 법률 등 다른 법률에 따라 개인정보를 보존해야 하는 경우에는 그러하지 아니하며, 귀하가 회원가입 등을 위해 입력하신 정보는 내부 방침 및 기타 관련법령에 따라 일정기간 저장 후 파기될 수 있습니다. 이때 일정기간 저장된 개인정보는 법률에 의한 경우가 아니고서는 동의 받지 아니한 다른 목적으로 이용되지 않습니다.
								
								회사 내부 방침에 의한 정보보유 사유
								이메일주소, 휴대전화 번호, 광고성정보 수신 동의
								(보존 이유: 불량회원의 부정이용방지와 비인가 사용방지, 서비스 이용의 혼선 방지 및 분쟁 발생 시 감독기관 소명, 보존 기간: 1년)
								관계법령에 의한 정보보유 사유
								표시/광고에 관한 기록 (전자상거래등에서의 소비자보호에 관한 법률, 보존기간: 6개월) 계약 또는 청약철회 등에 관한 기록 (전자상거래등에서의 소비자보호에 관한 법률, 보존기간: 5년) 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래등에서의 소비자보호에 관한 법률, 보존기간: 5년) 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래등에서의 소비자보호에 관한 법률, 보존기간: 3년) 웹 사이트 방문에 관한 기록 (통신기밀보호법, 보존기간: 3개월)
								<hr>
								<br>
								4. 장기 미이용 회원 개인정보 분리 보관
								관련 법령에 의거하여 장기 미이용 회원의 계정을 휴면 상태로 전환하고 개인정보를 암호화하여 분리 보관합니다. (관련 법령: 개인정보보호법제39조의6 및 동법 시행령 제48조의5, 휴면 회원: 서비스를 1년이상 이용하지 않음에 따라 휴면 상태로 전환된 회원)
								펀딩에 참여하여 와디즈의 서비스를 제공받고 있는 중인 회원의 권익보호를 위하여 휴면 상태로 전환되지 않습니다.
								휴면 상태 전환 30일 전까지 휴면 예정 회원에게 휴면 전환 예정일, 별도 분리 보관되는 사실 및 개인정보 항목이 이메일을 통해 사전 안내됩니다. 해당 통지 수단에 대한 정보가 부재 또는 오류인 경우에는 홈페이지 공지사항 게시로 대체됩니다.
								휴면 예정 회원이 사전 안내된 휴면 전환 예정일 이전에 로그인 하시는 경우에는 휴면 상태로 전환되지 않고 기존과 같이 서비스를 이용하실 수 있습니다.
								휴면 상태로 전환된 사실은 메일을 통해 휴면 회원에게 안내됩니다.
								휴면 회원은 사용했던 계정으로 로그인하여 서비스를 재이용함으로써 일반회원으로 전환될 수 있습니다.
								휴면 회원의 개인정보는 4년간 별도 분리 보관 후 삭제됩니다.
								펀딩·스토어·회원 이벤트 혜택 알림(선택)
								펀딩·스토어·회원 서비스, 이벤트·할인 혜택 등에 대한 정보를 이메일, 앱 알림(앱 회원가입 시)로 받아볼 수 있습니다. (동의 철회 시까지)
								투자 서비스 가입(선택)
								
								스타트업 찾기 서비스 가입(선택)
								
								·선택 동의를 거부해도 펀딩 서비스(투자, 스타트업찾기 제외) 이용이 가능합니다.
								<hr>
								<div style="text-align: right;">
							    <a class="modal_close_btn">확인</a>
							    </div>							   
							</div>
                        
                        <a href="javascript:void(0)" id="popup_open_btn22" style="position: absolute; right: 0px; text-decoration: underline;">내용보기</a>
                       
                       
                       
                    </div>
                    <br>
                    <br>
                   
                     <button  type="button"  onclick="checkAll()" class="btn btn-secondary" id="join_bnt" style="width: 100%;">회원가입</button><br>
                </form>
            </div>
        </div>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
<script type="text/javascript">
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
	



$('#popup_open_btn22').on('click', function() {
    // 모달창 띄우기
    modal('my_modal2');
});


$('#popup_open_btn11').on('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});

</script>

</html>