<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
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
                <form name="mem_frm" action="join_company.do" method="post" accept-charset="utf-8">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">이름</label>
                        <input  name="member_name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름 입력"
                        
                        <c:if test="${kakaoVo != null}">
                            value = "${kakaoVo.member_name}"
                            </c:if>
                        >
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">이메일</label>
                        <div class="form-inline">
                            <input  name="member_email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="이메일 계정" style="width: 68%;"
                            <c:if test="${kakaoVo != null}">
                            value = "${kakaoVo.member_email}"
                            </c:if>
                            > 
                            &nbsp;<input type="button" class="btn btn-secondary" value="중복 확인" style="width: 30%;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">비밀번호</label>
                        <input  name="member_password"  type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호" style="margin-bottom: 10px;">
                        <input  name="member_password2" type="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호 확인">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">주소</label>
                        <div class="form-inline">
                            <input  name="member_addr"   type="text" class="form-control" id="exampleFormControlInput1" placeholder="주소 입력" style="width: 68%;"> &nbsp;
                            <input type="button" class="btn btn-secondary" value="주소 찾기" style="width: 30%;">
                        </div>
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
                            &nbsp;-&nbsp;<input name="phone1" type="text" class="form-control" id="exampleFormControlInput1" style="width: 30%;">
                            &nbsp;-&nbsp;<input  name="phone1" type="text" class="form-control" id="exampleFormControlInput1" style="width: 30%;">
                         
                           
                           <!--  여기 넘어가는거 확인 후 수정 해야함 -->
                             <!-- <input name="member_phone" type="text" class="form-control" id="exampleFormControlInput1" > -->

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">선호 애완동물</label><br>
                        <div class="form-check form-check-inline">
                            <input name="member_pet" class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="0">
                            <label class="form-check-label" for="inlineRadio1">강아지</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input name="member_pet" class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="1">
                            <label class="form-check-label" for="inlineRadio2">고양이</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input name="member_pet" class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="2">
                            <label class="form-check-label" for="inlineRadio2">다른 동물</label>
                        </div>
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
                    <input type="submit" value="제출">
                     <button  type="button" class="btn btn-secondary" style="width: 100%;">회원가입</button><br>
                </form>
            </div>
        </div>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>