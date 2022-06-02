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

	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
        $("#telInput").keyup(function (event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenTel(_val);
        });
    });
    
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
               
               
               $("[name=member_postnum]").val(data.zonecode);
               $("[name=member_addr]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }
    
    //비밀번호 변경
    function changePw(){
    	console.log(1);
    	$("#pswd").after(
    			"<tr id='checkPw'><td style='border:none;'></td><th style='border:none;'>"+
    			"현재 비밀번호"+
    			"<div class='input-group mb-3'>"+
    			"<input type='password' class='form-control' id='member_password0' name='member_password0' aria-label='Default' aria-describedby='inputGroup-sizing-default'></div><br><br>"+

    			"새 비밀번호 <div style='color:#fa6463'>8~16자의 영문 대소문자+숫자+특수문자만 가능합니다.</div>"+
    			"<div class='input-group mb-3'>"+
    			"<input type='password' class='form-control' id='member_password1' name='member_password1' aria-label='Default' aria-describedby='inputGroup-sizing-default'></div>"+
    			
    			"새 비밀번호 확인"+
    			"<div class='input-group mb-3'>"+
    			"<input type='password' class='form-control' id='member_password2' name='member_password2' aria-label='Default' aria-describedby='inputGroup-sizing-default'></div>"+
    			"</th></tr>"
    			);
    	$("#pswd").children('td:eq(1)').children('div:eq(0)').remove();
    	$("#pswd").children('td:eq(1)').prepend("<div style='color:blue; cursor:pointer;' onclick='changePw2()'>변경완료</div>");
//     	<div class="input-group mb-3">
//         	<input type="text" class="form-control" name="member_password" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${ member.member_password }">
//     	</div>
    }
    
    //비밀번호 변경 ajax
    function changePw2(){
    	console.log(2);
    	console.log($("#member_password0").val());
    	console.log($("#member_password1").val());
    	console.log($("#member_password2").val());
    	
    	var pw = $("#member_password1").val();
    	var num = pw.search(/[0-9]/g);
    	var eng = pw.search(/[a-z]/ig);
    	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    	if(pw.length < 8 || pw.length > 16){
	    	alert("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
    	}else if(pw.search(/\s/) != -1){
    		alert("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
    	}else if(num < 0 || eng < 0 || spe < 0 ){
    		alert("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
    	}else { //모든 조건을 통과한 경우
    		
    		if( $("#member_password1").val() != $("#member_password2").val() ){
        		alert("비밀번호가 서로 다릅니다.");
        		}else{
        		console.log("비밀번호 같음");
        		//ajax 통신할 준비
        		//준비물 : 현재 비밀번호, 새 비밀번호
        		$.ajax({
        			url : "changePw.do",
        			type : "post",
        			data : {"member_password_old":$("#member_password0").val(),"member_password_new":$("#member_password1").val()},
        	        success:function(data){
        	        	if(data=="s"){
        	        		alert("비밀번호가 변경되었습니다.");
        	        		$(".alert-danger").remove();
        	        		$("#checkPw").remove();
            	        	$("#pswd").children('td:eq(1)').children('div:eq(0)').remove();
            	        	$("#pswd").children('td:eq(1)').prepend("<div style='color:blue; cursor:pointer;' onclick='changePw()'>변경</div>");
        	        	}else{
        	        		alert("현재 비밀번호가 틀립니다.")
        	        	}    	        	
        	        },
        	        error: function (XMLHttpRequest, textStatus, errorThrown){
        	        	alert('비밀번호 변경 에이잭스 오류');
        	        }
        		});
        	}
    		
    	}
    	
    	
    }
    

</script>
<style>
/* Profile Section */

.profile {
    padding: 5rem 0;
}

.profile::after {
    content: "";
    display: block;
    clear: both;
}

.profile-image {
    float: left;
    display: flex;
    margin-right: 3rem;
}

.profile-image img {
    width: 150px; 
    height: 150px; 
    border-radius: 70%;
}

.profile-user-settings,
.profile-stats,
.profile-bio {
    float: left;
    width: calc(66.666% - 2rem);
}

.profile-user-settings {
    margin-top: 1.5rem;
}

.profile-user-name {
    display: inline-block;
    font-size: 3rem;
    font-weight: 500;
}

.profile-edit-btn {
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.8;
    border: 0.1rem solid #dbdbdb;
    border-radius: 0.3rem;
    padding: 0 1rem;
}

/*파일 업로드 버튼*/
.filebox label {
  display: inline-block;
  padding: .3em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5cb85c;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .3em 25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #6ed36e;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
<title>내 정보 수정</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
    <div class="container" style="width: 100%;">
        <div class="row">
            <!--회원정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <div class="profile">
                    <div class="profile-image">
                        <c:choose>
                        	<c:when test="${ empty member.member_photo }">
                        		<img src="../resources/image/111.png" alt="profile_img" class="profile_img">
                        	</c:when>
                        	<c:otherwise>
								<img src="../resources/upload/${member.member_photo }" alt="profile_img" class="profile_img">
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    
                    <div class="profile-user-settings">
                        <h1 class="profile-user-name">${member.member_name }</h1>
                        <h5>
                        	<c:choose>
                           		<c:when test="${ member.member_level eq 0 }">
                           			일반 회원
                           		</c:when>
                           		<c:when test="${ member.member_level eq 1 }">
                           			판매자
                           		</c:when>
                           		<c:otherwise>
                           			없는 사용자 -> 메인화면으로 바꾸고 알림 띄울것
                           		</c:otherwise>
                           	</c:choose>
                        </h5>

                        <form name="aaa" action="upload.do" method="post" enctype="multipart/form-data">
							<div class="filebox">
							  <label for="ex_file">파일 업로드</label>
							  <input type="file" id="ex_file" name="fff" onchange=aa();>
							  10Mb 이하의 JPG, GIF, PNG 파일을 지원합니다.
							</div>
							<input type="hidden" name="member_idx" value="${ member.member_idx }"/>
						</form>
						<script> 
							function aa(){ 
								if(document.aaa.fff.value != ""){ 
									document.aaa.action = "upload.do"; 
									document.aaa.submit(); 
								} 
							}
						</script> 
          
                    </div>
                </div>
	
				<form action="profileUpdate.do" method="post">
                <table class="table" style="border-top: 3px solid #06113C;">
                    <tbody>
                        <tr>
                            <td>이메일</td>
                            <td>${ member.member_email }</td>
                        </tr>
                        <tr id="pswd">
                            <td>비밀번호</td>
                            <td style="text-align: right">
                            	<div style="color:blue; cursor:pointer;" onclick="changePw(this)">변경</div>
                            	
                            </td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="tel" class="form-control m-input" name="member_phone" id="telInput" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
                                    aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${ member.member_phone }">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div class="form-group"> 
                                <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="member_postnum" id="addr1" type="text" readonly="readonly" value="${ member.member_postnum }" >
								    <button type="button" class="btn btn-secondary" onclick="execPostCode();"><i class="fa fa-search"></i>주소 찾기</button>                               
								</div>
								<div class="form-group">
								    <input name="member_addr" class="form-control" style="top: 5px;" placeholder="도로명 주소"  id="addr2" type="text" readonly="readonly" value="${ member.member_addr }"/>
								</div>
                            </td>
                        </tr>
                        <tr>
                            <td>나머지 주소</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="member_addr2" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${ member.member_addr2 }">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>선호 동물</td>
                            <td>
                                <div class="input-group mb-3">
                                    <select class="custom-select" name="member_pet" id="inputGroupSelect01">
                                        <c:choose>
                                        	<c:when test="${ member.member_pet eq 0 }">
                                        		<option value="0" selected>강아지</option>
		                                        <option value="1">고양이</option>
		                                        <option value="2">다른 동물</option>
                                        	</c:when>
                                        	<c:when test="${ member.member_pet eq 1 }">
                                        		<option value="0">강아지</option>
		                                        <option value="1" selected>고양이</option>
		                                        <option value="2">다른 동물</option>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<option value="0">강아지</option>
		                                        <option value="1">고양이</option>
		                                        <option value="2" selected>다른 동물</option>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                    </select>
                                </div>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="row"> 
                    <div class="col-sm-12" style="text-align: right;"><button type="submit" class="btn btn-outline-dark" style="width: 100px;" onclick="alert('정보가 수정되었습니다.')">저장</button></div>
                </div>
                </form>
            </div>

            
            
        </div>
    </div>
    
    
</main>
<c:import url="/footer.do"></c:import>
</body>
</html>