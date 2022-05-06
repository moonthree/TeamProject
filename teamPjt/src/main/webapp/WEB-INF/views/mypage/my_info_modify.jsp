<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
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
    })
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
                            <td>우편번호</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="member_addr" aria-label="Default" aria-describedby="inputGroup-sizing-default" value="${ member.member_addr }">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>나머지 주소</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>선호 동물</td>
                            <td>
                                <div class="input-group mb-3">
                                    <select class="custom-select" name="member_pet" id="inputGroupSelect01">
                                        <option selected>선택</option>
                                        <option value="1">강아지</option>
                                        <option value="2">고양이</option>
                                        <option value="3">다른 동물</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="member_password" aria-label="Default" aria-describedby="inputGroup-sizing-default" value=" ${ member.member_password }">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row"> 
                    <div class="col-sm-12" style="text-align: right;"><button type="submit" class="btn btn-outline-dark" style="width: 100px;">저장</button></div>
                </div>
                </form>
            </div>

            
            
        </div>
    </div>
</main>
<c:import url="/footer.do"></c:import>
</body>
</html>