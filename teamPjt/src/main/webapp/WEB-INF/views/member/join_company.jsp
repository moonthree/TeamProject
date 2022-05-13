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
       

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	       
	    });
	 
        
        function checkID() {
			
			var email = $("input[name=member_email]").val();
			
			$.ajax({
				url:"check.do",
				type:"post",
				data:"email="+email,
				success:function(data){
					if(data >= 1){
						
						alert('중복 아이디 존재합니다.');
						$("#join_bnt").attr("disabled", "disabled"); 
						
						/* document.getElementById("join_bnt").style.display="none" */
					}
					else{
						$("#join_bnt").removeAttr("disabled"); 
						/* document.getElementById("join_bnt").style.display="" */
						alert('사용가능한 아이디 입니다.');
					}
				},
				error:function(){	
					alert('오류 발생');
				}
			});
		
        }
        
        <!-- 비밀번호 확인 스크립트-->
	$(function (){
		$("#alert-success").hide(); 
    	$("#alert-danger").hide(); 
    	
    	$("input[name=member_password2]").keyup(function(){ 
    		
    		
    		var pwd1=$("input[name=member_password2]").prev().val(); 
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
    			}
    		}
    	});
 
	});
	
	function checkAll() {
			var form_control = $("#mem_frm input.form-control");
			var flag = true;
			for(var i=0; i<form_control.length; i++){	
	
				 if("" == $(form_control[i]).val() || null == $(form_control[i]).val()){

					flag = false;
					}  
			}
			if(flag ==false){
				alert("입력하지 않은 양식이 존재합니다.");
			}
			
			else{
				 document.querySelector('#mem_frm').submit();
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
</head>
<body>
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
                            <input  name="member_email" type="email" class="form-control" id="exampleFormControlInput_email" placeholder="이메일 계정" style="width: 68%;"
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
                            &nbsp;-&nbsp;<input name="phone1" type="text" class="form-control" id="exampleFormControlInput3" style="width: 30%;">
                            &nbsp;-&nbsp;<input  name="phone1" type="text" class="form-control" id="exampleFormControlInput4" style="width: 30%;">
                         
                        </div>
                    </div>
                     <div class="form-group">
                       <label for="exampleFormControlInput1">사업자명(회사명)</label>
                       <input name="member_business_name" type="text" class="form-control" id="exampleFormControlInput3" style="width: 80%;">                
                    </div>
                      <div class="form-group">
                      <label for="exampleFormControlInput1">사업자 등록번호</label>
                       <input name="member_business_num" type="text" class="form-control" style="width: 50%;">                
                    </div>
                 
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Petdding 이용 약관 동의</label>
                        <a href="#" style="position: absolute; right: 0px; text-decoration: underline;">내용보기</a>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck2">
                        <label class="form-check-label" for="exampleCheck2">개인정보 수집, 이용 동의</label>
                        <a href="#" style="position: absolute; right: 0px; text-decoration: underline;">내용보기</a>
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
</html>